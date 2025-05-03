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



    // none of the (required, i.e. shared or exlusive) operation bits were set
    spinlock_release(&flock->lock);
    return -1;
}

// flock_release 
int flock_release(struct flock_t *flock) {

    spinlock_acquire(&flock->lock);

    

   // to do implement flock_release
    return 0;
}