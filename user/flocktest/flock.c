#include "flock.h"
#include "import.h"

/**
 * Initialize a flock.
*/
void flock_init(struct flock_t *flock) {
    flock->num_sh_waiting = 0;
    flock->num_ex_waiting = 0;
    flock->num_sh_active = 0;

    flock->ex_active = FALSE;
    flock->sh_active = FALSE;

    flock->state = INACTIVE;

    spinlock_init(&flock->lock);
    cv_init(&flock->ex_flock);
    cv_init(&flock->sh_flock);
}

int flock_acquire(struct flock_t *flock, int operation) {

    spinlock_acquire(&flock->lock);

    // --- implementing flock acquire

    if (operation & LOCK_EX) {

        if (flock->state == INACTIVE) {
            flock->state = EXCLUSIVE;
            flock->ex_active = TRUE;
            spinlock_release(&flock->lock); 
            return 0;
        } else if (operation & LOCK_NB) {
            spinlock_release(&flock->lock);
            return EWOULDBLOCK;
        } else {
            flock->num_ex_waiting++;
            while (flock->num_sh_active > 0 || flock->ex_active) {
                cv_wait(&flock->ex_flock, &flock->lock);
            }
            flock->num_ex_waiting--;
            flock->ex_active = TRUE;
            flock->state = EXCLUSIVE;
            spinlock_release(&flock->lock);
            return 0; 
        }

    } else if (operation & LOCK_SH) {

        if (flock->state == INACTIVE || flock->state == SHARED) {
            /*
            if (operation & LOCK_NB) {
                spinlock_release(&flock->lock);
                return EWOULDBLOCK; 
            } else {
            */
           // prioritize exclusive (writers) so you dont get writer starvation
            if (flock->num_ex_waiting > 0) {
                if (operation & LOCK_NB) {
                    spinlock_release(&flock->lock);
                    return EWOULDBLOCK; 
                } else {
                    flock->num_sh_waiting++;
                    while (flock->num_ex_waiting > 0) {
                        cv_wait(&flock->sh_flock, &flock->lock);
                    }
                    flock->num_sh_waiting--;
                }
            } 
            flock->state = SHARED;
            flock->num_sh_active++;
            flock->sh_active = TRUE;
            spinlock_release(&flock->lock);
            return 0;
            
            
            //}
        } else {
            // flock->state == exclusive
            if (operation & LOCK_NB) {
                // TODO: implement non-blocking 
                spinlock_release(&flock->lock);
                return EWOULDBLOCK;
            } else {
                flock->num_sh_waiting++;
                while (flock->num_ex_waiting > 0 || flock->ex_active) {
                    cv_wait(&flock->sh_flock, &flock->lock);
                }
                flock->state = SHARED;
                flock->num_sh_active++;
                flock->sh_active = TRUE;
                flock->num_sh_waiting--;
                spinlock_release(&flock->lock);
                return 0;
            }
        }

    }



    // none of the (required, i.e. shared or exlusive) operation bits were set
    spinlock_release(&flock->lock);
    return -1;
}

// flock_release 
int flock_release(struct flock_t *flock) {

    spinlock_acquire(&flock->lock);

    if (flock->state == INACTIVE) {
        spinlock_release(&flock->lock);
        return -1;
    }
    
    return 0;
}