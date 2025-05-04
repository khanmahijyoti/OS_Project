
obj/user/flocktest/flockstall:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:
#define exit(...) return __VA_ARGS__

char buf[8192];

int main(int argc, char *argv[])
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	57                   	push   %edi
4000000e:	56                   	push   %esi
4000000f:	53                   	push   %ebx
40000010:	e8 32 02 00 00       	call   40000247 <__x86.get_pc_thunk.bx>
40000015:	81 c3 df 3f 00 00    	add    $0x3fdf,%ebx
4000001b:	51                   	push   %ecx
4000001c:	83 ec 24             	sub    $0x24,%esp
     * This process is designed to be run in conjunction with 
     * flocktest_test_nonblocking in flocktest.c
    */
    int fd, con;
    
    printf("=====starting flockstall=====\n\n");
4000001f:	8d 83 b8 e1 ff ff    	lea    -0x1e48(%ebx),%eax
40000025:	89 5d e4             	mov    %ebx,-0x1c(%ebp)

static gcc_inline int sys_open(char *path, int omode)
{
    int errno;
    int fd;
    int len = strlen(path) + 1;
40000028:	8d b3 48 e0 ff ff    	lea    -0x1fb8(%ebx),%esi
4000002e:	50                   	push   %eax
4000002f:	e8 7c 03 00 00       	call   400003b0 <printf>
40000034:	89 34 24             	mov    %esi,(%esp)
40000037:	e8 d4 0b 00 00       	call   40000c10 <strlen>

    asm volatile ("int %2"
4000003c:	b9 01 00 00 00       	mov    $0x1,%ecx
40000041:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40000043:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40000046:	b8 04 00 00 00       	mov    $0x4,%eax
4000004b:	cd 30                	int    $0x30
                    "b" (path),
                    "c" (omode),
                    "d" (len)
                  : "cc", "memory");

    return errno ? -1 : fd;
4000004d:	83 c4 10             	add    $0x10,%esp

    /* open the file with write only permissions */
    if ((fd = open("flockfile", O_WRONLY)) < 0) {
40000050:	85 c0                	test   %eax,%eax
40000052:	0f 85 8d 00 00 00    	jne    400000e5 <main+0xe5>
40000058:	89 de                	mov    %ebx,%esi
4000005a:	85 db                	test   %ebx,%ebx
4000005c:	0f 88 83 00 00 00    	js     400000e5 <main+0xe5>

static gcc_inline int sys_flock(int fd, int op)
{
    int errno, ret;

    asm volatile ("int %2"
40000062:	b8 0d 00 00 00       	mov    $0xd,%eax
40000067:	b9 02 00 00 00       	mov    $0x2,%ecx
4000006c:	cd 30                	int    $0x30
4000006e:	89 c7                	mov    %eax,%edi
                    "a" (SYS_flock),
                    "b" (fd),
                    "c" (op)
                  : "cc", "memory");

    return errno ? -1 : 0;; // errno ? -1 : 0; 
40000070:	85 c0                	test   %eax,%eax
40000072:	0f 85 c1 00 00 00    	jne    40000139 <main+0x139>
        exit();
    }

    /* signal to flocktest_test_nonblocking that this process has obtained
    an exclusive lock on flockfile */
    produce(1);
40000078:	83 ec 0c             	sub    $0xc,%esp
4000007b:	6a 01                	push   $0x1
4000007d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
40000080:	e8 0b 0b 00 00       	call   40000b90 <produce>
40000085:	83 c4 10             	add    $0x10,%esp
40000088:	8d 8b 52 e0 ff ff    	lea    -0x1fae(%ebx),%ecx
    asm volatile ("int %2"
4000008e:	ba 0a 00 00 00       	mov    $0xa,%edx
40000093:	eb 21                	jmp    400000b6 <main+0xb6>
40000095:	8d 76 00             	lea    0x0(%esi),%esi

    /* write to the file */
    for (int i = 0; i < 50; i++) { // changed from 100 to 50
        if (write(fd, "cccccccccc", 10) != 10) {
40000098:	85 c0                	test   %eax,%eax
4000009a:	75 28                	jne    400000c4 <main+0xc4>
4000009c:	b8 07 00 00 00       	mov    $0x7,%eax
400000a1:	89 f3                	mov    %esi,%ebx
400000a3:	cd 30                	int    $0x30
            printf("error: write aa %d new file failed\n", i);
            exit();
        }
        if (write(fd, "cccccccccc", 10) != 10) {
400000a5:	83 fb 0a             	cmp    $0xa,%ebx
400000a8:	75 1a                	jne    400000c4 <main+0xc4>
400000aa:	85 c0                	test   %eax,%eax
400000ac:	75 16                	jne    400000c4 <main+0xc4>
    for (int i = 0; i < 50; i++) { // changed from 100 to 50
400000ae:	83 c7 01             	add    $0x1,%edi
400000b1:	83 ff 32             	cmp    $0x32,%edi
400000b4:	74 46                	je     400000fc <main+0xfc>
400000b6:	b8 07 00 00 00       	mov    $0x7,%eax
400000bb:	89 f3                	mov    %esi,%ebx
400000bd:	cd 30                	int    $0x30
        if (write(fd, "cccccccccc", 10) != 10) {
400000bf:	83 fb 0a             	cmp    $0xa,%ebx
400000c2:	74 d4                	je     40000098 <main+0x98>
            printf("error: write aa %d new file failed\n", i);
400000c4:	50                   	push   %eax
400000c5:	50                   	push   %eax
400000c6:	57                   	push   %edi
400000c7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
400000ca:	8d 83 3c e2 ff ff    	lea    -0x1dc4(%ebx),%eax
400000d0:	50                   	push   %eax
400000d1:	e8 da 02 00 00       	call   400003b0 <printf>
            exit();
400000d6:	83 c4 10             	add    $0x10,%esp
    close(fd);

    printf("=====finishing flockstall=====\n\n");

    return 0;
400000d9:	8d 65 f0             	lea    -0x10(%ebp),%esp
400000dc:	59                   	pop    %ecx
400000dd:	5b                   	pop    %ebx
400000de:	5e                   	pop    %esi
400000df:	5f                   	pop    %edi
400000e0:	5d                   	pop    %ebp
400000e1:	8d 61 fc             	lea    -0x4(%ecx),%esp
400000e4:	c3                   	ret
        printf("ERROR in flockstall: open flockfile failed\n");
400000e5:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
400000e8:	83 ec 0c             	sub    $0xc,%esp
400000eb:	8d 83 d8 e1 ff ff    	lea    -0x1e28(%ebx),%eax
400000f1:	50                   	push   %eax
400000f2:	e8 b9 02 00 00       	call   400003b0 <printf>
        exit();
400000f7:	83 c4 10             	add    $0x10,%esp
400000fa:	eb dd                	jmp    400000d9 <main+0xd9>
    con = consume();
400000fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
400000ff:	89 fb                	mov    %edi,%ebx
40000101:	e8 9a 0a 00 00       	call   40000ba0 <consume>
    asm volatile ("int %2"
40000106:	b8 0d 00 00 00       	mov    $0xd,%eax
4000010b:	b9 04 00 00 00       	mov    $0x4,%ecx
40000110:	89 f3                	mov    %esi,%ebx
40000112:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40000114:	85 c0                	test   %eax,%eax
40000116:	75 41                	jne    40000159 <main+0x159>
    asm volatile ("int %2"
40000118:	b8 05 00 00 00       	mov    $0x5,%eax
4000011d:	89 f3                	mov    %esi,%ebx
4000011f:	cd 30                	int    $0x30
    printf("=====finishing flockstall=====\n\n");
40000121:	83 ec 0c             	sub    $0xc,%esp
40000124:	8d 87 60 e2 ff ff    	lea    -0x1da0(%edi),%eax
4000012a:	89 fb                	mov    %edi,%ebx
4000012c:	50                   	push   %eax
4000012d:	e8 7e 02 00 00       	call   400003b0 <printf>
40000132:	31 c0                	xor    %eax,%eax
40000134:	83 c4 10             	add    $0x10,%esp
40000137:	eb a0                	jmp    400000d9 <main+0xd9>
        printf("ERROR in flockstall: could not acquire exclusive lock\n");
40000139:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
4000013c:	83 ec 0c             	sub    $0xc,%esp
4000013f:	8d 83 04 e2 ff ff    	lea    -0x1dfc(%ebx),%eax
        printf("ERROR in flockstall: could not release flock!\n");
40000145:	50                   	push   %eax
40000146:	e8 65 02 00 00       	call   400003b0 <printf>
4000014b:	b8 05 00 00 00       	mov    $0x5,%eax
40000150:	89 f3                	mov    %esi,%ebx
40000152:	cd 30                	int    $0x30
        exit();
40000154:	83 c4 10             	add    $0x10,%esp
40000157:	eb 80                	jmp    400000d9 <main+0xd9>
        printf("ERROR in flockstall: could not release flock!\n");
40000159:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
4000015c:	83 ec 0c             	sub    $0xc,%esp
4000015f:	8d 83 84 e2 ff ff    	lea    -0x1d7c(%ebx),%eax
40000165:	eb de                	jmp    40000145 <main+0x145>

40000167 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
40000167:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
4000016d:	75 04                	jne    40000173 <args_exist>

4000016f <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
4000016f:	6a 00                	push   $0x0
	pushl	$0
40000171:	6a 00                	push   $0x0

40000173 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
40000173:	e8 88 fe ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
40000178:	50                   	push   %eax

40000179 <spin>:
spin:
	jmp	spin
40000179:	eb fe                	jmp    40000179 <spin>
4000017b:	66 90                	xchg   %ax,%ax
4000017d:	66 90                	xchg   %ax,%ax
4000017f:	90                   	nop

40000180 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
40000180:	53                   	push   %ebx
40000181:	e8 c1 00 00 00       	call   40000247 <__x86.get_pc_thunk.bx>
40000186:	81 c3 6e 3e 00 00    	add    $0x3e6e,%ebx
4000018c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
4000018f:	ff 74 24 18          	push   0x18(%esp)
40000193:	ff 74 24 18          	push   0x18(%esp)
40000197:	8d 83 0c e0 ff ff    	lea    -0x1ff4(%ebx),%eax
4000019d:	50                   	push   %eax
4000019e:	e8 0d 02 00 00       	call   400003b0 <printf>
    vcprintf(fmt, ap);
400001a3:	58                   	pop    %eax
400001a4:	5a                   	pop    %edx
400001a5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001a9:	50                   	push   %eax
400001aa:	ff 74 24 24          	push   0x24(%esp)
400001ae:	e8 9d 01 00 00       	call   40000350 <vcprintf>
    va_end(ap);
}
400001b3:	83 c4 18             	add    $0x18,%esp
400001b6:	5b                   	pop    %ebx
400001b7:	c3                   	ret
400001b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001bf:	00 

400001c0 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
400001c0:	53                   	push   %ebx
400001c1:	e8 81 00 00 00       	call   40000247 <__x86.get_pc_thunk.bx>
400001c6:	81 c3 2e 3e 00 00    	add    $0x3e2e,%ebx
400001cc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
400001cf:	ff 74 24 18          	push   0x18(%esp)
400001d3:	ff 74 24 18          	push   0x18(%esp)
400001d7:	8d 83 18 e0 ff ff    	lea    -0x1fe8(%ebx),%eax
400001dd:	50                   	push   %eax
400001de:	e8 cd 01 00 00       	call   400003b0 <printf>
    vcprintf(fmt, ap);
400001e3:	58                   	pop    %eax
400001e4:	5a                   	pop    %edx
400001e5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001e9:	50                   	push   %eax
400001ea:	ff 74 24 24          	push   0x24(%esp)
400001ee:	e8 5d 01 00 00       	call   40000350 <vcprintf>
    va_end(ap);
}
400001f3:	83 c4 18             	add    $0x18,%esp
400001f6:	5b                   	pop    %ebx
400001f7:	c3                   	ret
400001f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001ff:	00 

40000200 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000200:	53                   	push   %ebx
40000201:	e8 41 00 00 00       	call   40000247 <__x86.get_pc_thunk.bx>
40000206:	81 c3 ee 3d 00 00    	add    $0x3dee,%ebx
4000020c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000020f:	ff 74 24 18          	push   0x18(%esp)
40000213:	ff 74 24 18          	push   0x18(%esp)
40000217:	8d 83 24 e0 ff ff    	lea    -0x1fdc(%ebx),%eax
4000021d:	50                   	push   %eax
4000021e:	e8 8d 01 00 00       	call   400003b0 <printf>
    vcprintf(fmt, ap);
40000223:	58                   	pop    %eax
40000224:	5a                   	pop    %edx
40000225:	8d 44 24 24          	lea    0x24(%esp),%eax
40000229:	50                   	push   %eax
4000022a:	ff 74 24 24          	push   0x24(%esp)
4000022e:	e8 1d 01 00 00       	call   40000350 <vcprintf>
40000233:	83 c4 10             	add    $0x10,%esp
40000236:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000023d:	00 
4000023e:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
40000240:	e8 3b 09 00 00       	call   40000b80 <yield>
    while (1)
40000245:	eb f9                	jmp    40000240 <panic+0x40>

40000247 <__x86.get_pc_thunk.bx>:
40000247:	8b 1c 24             	mov    (%esp),%ebx
4000024a:	c3                   	ret
4000024b:	66 90                	xchg   %ax,%ax
4000024d:	66 90                	xchg   %ax,%ax
4000024f:	90                   	nop

40000250 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
40000250:	55                   	push   %ebp
40000251:	57                   	push   %edi
40000252:	56                   	push   %esi
40000253:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
40000254:	8b 44 24 14          	mov    0x14(%esp),%eax
40000258:	0f b6 00             	movzbl (%eax),%eax
4000025b:	3c 2b                	cmp    $0x2b,%al
4000025d:	0f 84 8d 00 00 00    	je     400002f0 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
40000263:	3c 2d                	cmp    $0x2d,%al
40000265:	74 59                	je     400002c0 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000267:	8d 50 d0             	lea    -0x30(%eax),%edx
4000026a:	80 fa 09             	cmp    $0x9,%dl
4000026d:	77 71                	ja     400002e0 <atoi+0x90>
    int negative = 0;
4000026f:	31 ff                	xor    %edi,%edi
    int loc = 0;
40000271:	31 f6                	xor    %esi,%esi
        loc++;
40000273:	89 f2                	mov    %esi,%edx
    int acc = 0;
40000275:	31 c9                	xor    %ecx,%ecx
40000277:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000027e:	00 
4000027f:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
40000280:	83 e8 30             	sub    $0x30,%eax
40000283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
40000286:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
40000289:	0f be c0             	movsbl %al,%eax
4000028c:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000028f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000293:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
40000297:	8d 68 d0             	lea    -0x30(%eax),%ebp
4000029a:	89 eb                	mov    %ebp,%ebx
4000029c:	80 fb 09             	cmp    $0x9,%bl
4000029f:	76 df                	jbe    40000280 <atoi+0x30>
    }
    if (numstart == loc) {
400002a1:	39 f2                	cmp    %esi,%edx
400002a3:	74 3b                	je     400002e0 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
400002a5:	89 c8                	mov    %ecx,%eax
400002a7:	f7 d8                	neg    %eax
400002a9:	85 ff                	test   %edi,%edi
400002ab:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
400002ae:	8b 44 24 18          	mov    0x18(%esp),%eax
400002b2:	89 08                	mov    %ecx,(%eax)
    return loc;
}
400002b4:	89 d0                	mov    %edx,%eax
400002b6:	5b                   	pop    %ebx
400002b7:	5e                   	pop    %esi
400002b8:	5f                   	pop    %edi
400002b9:	5d                   	pop    %ebp
400002ba:	c3                   	ret
400002bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002c0:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
400002c4:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
400002c9:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002ce:	0f b6 40 01          	movzbl 0x1(%eax),%eax
400002d2:	8d 50 d0             	lea    -0x30(%eax),%edx
400002d5:	80 fa 09             	cmp    $0x9,%dl
400002d8:	76 99                	jbe    40000273 <atoi+0x23>
400002da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
400002e0:	31 d2                	xor    %edx,%edx
}
400002e2:	5b                   	pop    %ebx
400002e3:	89 d0                	mov    %edx,%eax
400002e5:	5e                   	pop    %esi
400002e6:	5f                   	pop    %edi
400002e7:	5d                   	pop    %ebp
400002e8:	c3                   	ret
400002e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002f0:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
400002f4:	31 ff                	xor    %edi,%edi
        loc++;
400002f6:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002fb:	0f b6 40 01          	movzbl 0x1(%eax),%eax
400002ff:	8d 50 d0             	lea    -0x30(%eax),%edx
40000302:	80 fa 09             	cmp    $0x9,%dl
40000305:	0f 86 68 ff ff ff    	jbe    40000273 <atoi+0x23>
        return 0;
4000030b:	31 d2                	xor    %edx,%edx
4000030d:	eb d3                	jmp    400002e2 <atoi+0x92>
4000030f:	90                   	nop

40000310 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
40000310:	53                   	push   %ebx
40000311:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000315:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000031a:	8b 02                	mov    (%edx),%eax
4000031c:	8d 48 01             	lea    0x1(%eax),%ecx
4000031f:	89 0a                	mov    %ecx,(%edx)
40000321:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000325:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
4000032b:	75 14                	jne    40000341 <putch+0x31>
        b->buf[b->idx] = 0;
4000032d:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
40000334:	8d 5a 08             	lea    0x8(%edx),%ebx
    asm volatile ("int %0"
40000337:	31 c0                	xor    %eax,%eax
40000339:	cd 30                	int    $0x30
        b->idx = 0;
4000033b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
40000341:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
40000345:	5b                   	pop    %ebx
40000346:	c3                   	ret
40000347:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000034e:	00 
4000034f:	90                   	nop

40000350 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
40000350:	53                   	push   %ebx
40000351:	e8 f1 fe ff ff       	call   40000247 <__x86.get_pc_thunk.bx>
40000356:	81 c3 9e 3c 00 00    	add    $0x3c9e,%ebx
4000035c:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
40000362:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000369:	00 
    b.cnt = 0;
4000036a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000371:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
40000372:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000379:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000380:	8d 44 24 10          	lea    0x10(%esp),%eax
40000384:	50                   	push   %eax
40000385:	8d 83 1c c3 ff ff    	lea    -0x3ce4(%ebx),%eax
4000038b:	50                   	push   %eax
4000038c:	e8 3f 01 00 00       	call   400004d0 <vprintfmt>

    b.buf[b.idx] = 0;
40000391:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000395:	8d 5c 24 20          	lea    0x20(%esp),%ebx
40000399:	31 c0                	xor    %eax,%eax
4000039b:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400003a0:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
400003a2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400003a6:	81 c4 28 02 00 00    	add    $0x228,%esp
400003ac:	5b                   	pop    %ebx
400003ad:	c3                   	ret
400003ae:	66 90                	xchg   %ax,%ax

400003b0 <printf>:

int printf(const char *fmt, ...)
{
400003b0:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
400003b3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400003b7:	50                   	push   %eax
400003b8:	ff 74 24 1c          	push   0x1c(%esp)
400003bc:	e8 8f ff ff ff       	call   40000350 <vcprintf>
    va_end(ap);

    return cnt;
}
400003c1:	83 c4 1c             	add    $0x1c,%esp
400003c4:	c3                   	ret
400003c5:	66 90                	xchg   %ax,%ax
400003c7:	66 90                	xchg   %ax,%ax
400003c9:	66 90                	xchg   %ax,%ax
400003cb:	66 90                	xchg   %ax,%ax
400003cd:	66 90                	xchg   %ax,%ax
400003cf:	90                   	nop

400003d0 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
400003d0:	e8 86 07 00 00       	call   40000b5b <__x86.get_pc_thunk.cx>
400003d5:	81 c1 1f 3c 00 00    	add    $0x3c1f,%ecx
{
400003db:	55                   	push   %ebp
400003dc:	57                   	push   %edi
400003dd:	89 d7                	mov    %edx,%edi
400003df:	56                   	push   %esi
400003e0:	89 c6                	mov    %eax,%esi
400003e2:	53                   	push   %ebx
400003e3:	83 ec 2c             	sub    $0x2c,%esp
400003e6:	8b 44 24 40          	mov    0x40(%esp),%eax
400003ea:	8b 54 24 44          	mov    0x44(%esp),%edx
400003ee:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
400003f2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
400003f9:	00 
{
400003fa:	8b 6c 24 50          	mov    0x50(%esp),%ebp
400003fe:	89 44 24 08          	mov    %eax,0x8(%esp)
40000402:	8b 44 24 48          	mov    0x48(%esp),%eax
40000406:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000040a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000040e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000412:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000416:	89 44 24 10          	mov    %eax,0x10(%esp)
4000041a:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
4000041e:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
40000421:	73 55                	jae    40000478 <printnum+0xa8>
        while (--width > 0)
40000423:	83 fa 01             	cmp    $0x1,%edx
40000426:	7e 17                	jle    4000043f <printnum+0x6f>
40000428:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000042f:	00 
            putch(padc, putdat);
40000430:	83 ec 08             	sub    $0x8,%esp
40000433:	57                   	push   %edi
40000434:	55                   	push   %ebp
40000435:	ff d6                	call   *%esi
        while (--width > 0)
40000437:	83 c4 10             	add    $0x10,%esp
4000043a:	83 eb 01             	sub    $0x1,%ebx
4000043d:	75 f1                	jne    40000430 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
4000043f:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000443:	ff 74 24 14          	push   0x14(%esp)
40000447:	ff 74 24 14          	push   0x14(%esp)
4000044b:	ff 74 24 14          	push   0x14(%esp)
4000044f:	ff 74 24 14          	push   0x14(%esp)
40000453:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
40000457:	e8 a4 0d 00 00       	call   40001200 <__umoddi3>
4000045c:	0f be 84 03 30 e0 ff 	movsbl -0x1fd0(%ebx,%eax,1),%eax
40000463:	ff 
40000464:	89 44 24 50          	mov    %eax,0x50(%esp)
}
40000468:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
4000046b:	89 f0                	mov    %esi,%eax
}
4000046d:	5b                   	pop    %ebx
4000046e:	5e                   	pop    %esi
4000046f:	5f                   	pop    %edi
40000470:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
40000471:	ff e0                	jmp    *%eax
40000473:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
40000478:	83 ec 0c             	sub    $0xc,%esp
4000047b:	55                   	push   %ebp
4000047c:	53                   	push   %ebx
4000047d:	50                   	push   %eax
4000047e:	83 ec 08             	sub    $0x8,%esp
40000481:	ff 74 24 34          	push   0x34(%esp)
40000485:	ff 74 24 34          	push   0x34(%esp)
40000489:	ff 74 24 34          	push   0x34(%esp)
4000048d:	ff 74 24 34          	push   0x34(%esp)
40000491:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
40000495:	e8 46 0c 00 00       	call   400010e0 <__udivdi3>
4000049a:	83 c4 18             	add    $0x18,%esp
4000049d:	52                   	push   %edx
4000049e:	89 fa                	mov    %edi,%edx
400004a0:	50                   	push   %eax
400004a1:	89 f0                	mov    %esi,%eax
400004a3:	e8 28 ff ff ff       	call   400003d0 <printnum>
400004a8:	83 c4 20             	add    $0x20,%esp
400004ab:	eb 92                	jmp    4000043f <printnum+0x6f>
400004ad:	8d 76 00             	lea    0x0(%esi),%esi

400004b0 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
400004b0:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
400004b4:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
400004b8:	8b 10                	mov    (%eax),%edx
400004ba:	3b 50 04             	cmp    0x4(%eax),%edx
400004bd:	73 0b                	jae    400004ca <sprintputch+0x1a>
        *b->buf++ = ch;
400004bf:	8d 4a 01             	lea    0x1(%edx),%ecx
400004c2:	89 08                	mov    %ecx,(%eax)
400004c4:	8b 44 24 04          	mov    0x4(%esp),%eax
400004c8:	88 02                	mov    %al,(%edx)
}
400004ca:	c3                   	ret
400004cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

400004d0 <vprintfmt>:
{
400004d0:	e8 7e 06 00 00       	call   40000b53 <__x86.get_pc_thunk.ax>
400004d5:	05 1f 3b 00 00       	add    $0x3b1f,%eax
400004da:	55                   	push   %ebp
400004db:	57                   	push   %edi
400004dc:	56                   	push   %esi
400004dd:	53                   	push   %ebx
400004de:	83 ec 2c             	sub    $0x2c,%esp
400004e1:	8b 74 24 40          	mov    0x40(%esp),%esi
400004e5:	8b 7c 24 44          	mov    0x44(%esp),%edi
400004e9:	89 44 24 0c          	mov    %eax,0xc(%esp)
400004ed:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
400004f1:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
400004f5:	8d 5d 01             	lea    0x1(%ebp),%ebx
400004f8:	83 f8 25             	cmp    $0x25,%eax
400004fb:	75 19                	jne    40000516 <vprintfmt+0x46>
400004fd:	eb 29                	jmp    40000528 <vprintfmt+0x58>
400004ff:	90                   	nop
            putch(ch, putdat);
40000500:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000503:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000506:	57                   	push   %edi
40000507:	50                   	push   %eax
40000508:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000050a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000050e:	83 c4 10             	add    $0x10,%esp
40000511:	83 f8 25             	cmp    $0x25,%eax
40000514:	74 12                	je     40000528 <vprintfmt+0x58>
            if (ch == '\0')
40000516:	85 c0                	test   %eax,%eax
40000518:	75 e6                	jne    40000500 <vprintfmt+0x30>
}
4000051a:	83 c4 2c             	add    $0x2c,%esp
4000051d:	5b                   	pop    %ebx
4000051e:	5e                   	pop    %esi
4000051f:	5f                   	pop    %edi
40000520:	5d                   	pop    %ebp
40000521:	c3                   	ret
40000522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
40000528:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
4000052d:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
40000532:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
40000539:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000540:	ff 
        lflag = 0;
40000541:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
40000548:	00 
40000549:	89 54 24 14          	mov    %edx,0x14(%esp)
4000054d:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000551:	0f b6 0b             	movzbl (%ebx),%ecx
40000554:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000557:	8d 41 dd             	lea    -0x23(%ecx),%eax
4000055a:	3c 55                	cmp    $0x55,%al
4000055c:	77 12                	ja     40000570 <.L21>
4000055e:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000562:	0f b6 c0             	movzbl %al,%eax
40000565:	8b b4 82 60 e0 ff ff 	mov    -0x1fa0(%edx,%eax,4),%esi
4000056c:	01 d6                	add    %edx,%esi
4000056e:	ff e6                	jmp    *%esi

40000570 <.L21>:
            putch('%', putdat);
40000570:	8b 74 24 40          	mov    0x40(%esp),%esi
40000574:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
40000577:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
40000579:	57                   	push   %edi
4000057a:	6a 25                	push   $0x25
4000057c:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
4000057e:	83 c4 10             	add    $0x10,%esp
40000581:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
40000585:	0f 84 66 ff ff ff    	je     400004f1 <vprintfmt+0x21>
4000058b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000590:	83 ed 01             	sub    $0x1,%ebp
40000593:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
40000597:	75 f7                	jne    40000590 <.L21+0x20>
40000599:	e9 53 ff ff ff       	jmp    400004f1 <vprintfmt+0x21>
4000059e:	66 90                	xchg   %ax,%ax

400005a0 <.L31>:
                ch = *fmt;
400005a0:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
400005a4:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
400005a7:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
400005a9:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
400005ad:	8d 48 d0             	lea    -0x30(%eax),%ecx
400005b0:	83 f9 09             	cmp    $0x9,%ecx
400005b3:	77 28                	ja     400005dd <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
400005b5:	8b 74 24 40          	mov    0x40(%esp),%esi
400005b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
400005c0:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
400005c3:	8d 14 92             	lea    (%edx,%edx,4),%edx
400005c6:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
400005ca:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
400005cd:	8d 48 d0             	lea    -0x30(%eax),%ecx
400005d0:	83 f9 09             	cmp    $0x9,%ecx
400005d3:	76 eb                	jbe    400005c0 <.L31+0x20>
400005d5:	89 54 24 14          	mov    %edx,0x14(%esp)
400005d9:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
400005dd:	8b 74 24 08          	mov    0x8(%esp),%esi
400005e1:	85 f6                	test   %esi,%esi
400005e3:	0f 89 68 ff ff ff    	jns    40000551 <vprintfmt+0x81>
                width = precision, precision = -1;
400005e9:	8b 44 24 14          	mov    0x14(%esp),%eax
400005ed:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
400005f4:	ff 
400005f5:	89 44 24 08          	mov    %eax,0x8(%esp)
400005f9:	e9 53 ff ff ff       	jmp    40000551 <vprintfmt+0x81>

400005fe <.L35>:
            altflag = 1;
400005fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000605:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000607:	e9 45 ff ff ff       	jmp    40000551 <vprintfmt+0x81>

4000060c <.L34>:
            putch(ch, putdat);
4000060c:	8b 74 24 40          	mov    0x40(%esp),%esi
40000610:	83 ec 08             	sub    $0x8,%esp
40000613:	57                   	push   %edi
40000614:	6a 25                	push   $0x25
40000616:	ff d6                	call   *%esi
            break;
40000618:	83 c4 10             	add    $0x10,%esp
4000061b:	e9 d1 fe ff ff       	jmp    400004f1 <vprintfmt+0x21>

40000620 <.L33>:
            precision = va_arg(ap, int);
40000620:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
40000624:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
40000626:	8b 00                	mov    (%eax),%eax
40000628:	89 44 24 14          	mov    %eax,0x14(%esp)
4000062c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000630:	83 c0 04             	add    $0x4,%eax
40000633:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
40000637:	eb a4                	jmp    400005dd <.L31+0x3d>

40000639 <.L32>:
            if (width < 0)
40000639:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000063d:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
4000063f:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000641:	85 c9                	test   %ecx,%ecx
40000643:	0f 49 c1             	cmovns %ecx,%eax
40000646:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
4000064a:	e9 02 ff ff ff       	jmp    40000551 <vprintfmt+0x81>

4000064f <.L30>:
            putch(va_arg(ap, int), putdat);
4000064f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000653:	8b 74 24 40          	mov    0x40(%esp),%esi
40000657:	83 ec 08             	sub    $0x8,%esp
4000065a:	57                   	push   %edi
4000065b:	8d 58 04             	lea    0x4(%eax),%ebx
4000065e:	8b 44 24 58          	mov    0x58(%esp),%eax
40000662:	ff 30                	push   (%eax)
40000664:	ff d6                	call   *%esi
40000666:	89 5c 24 5c          	mov    %ebx,0x5c(%esp)
            break;
4000066a:	83 c4 10             	add    $0x10,%esp
4000066d:	e9 7f fe ff ff       	jmp    400004f1 <vprintfmt+0x21>

40000672 <.L24>:
    if (lflag >= 2)
40000672:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000677:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
4000067b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000067f:	0f 8f d8 01 00 00    	jg     4000085d <.L25+0xe0>
        return va_arg(*ap, unsigned long);
40000685:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000689:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
4000068c:	31 db                	xor    %ebx,%ebx
4000068e:	ba 0a 00 00 00       	mov    $0xa,%edx
40000693:	8b 09                	mov    (%ecx),%ecx
40000695:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
400006a0:	83 ec 0c             	sub    $0xc,%esp
400006a3:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
400006a8:	50                   	push   %eax
400006a9:	89 f0                	mov    %esi,%eax
400006ab:	ff 74 24 18          	push   0x18(%esp)
400006af:	52                   	push   %edx
400006b0:	89 fa                	mov    %edi,%edx
400006b2:	53                   	push   %ebx
400006b3:	51                   	push   %ecx
400006b4:	e8 17 fd ff ff       	call   400003d0 <printnum>
            break;
400006b9:	83 c4 20             	add    $0x20,%esp
400006bc:	e9 30 fe ff ff       	jmp    400004f1 <vprintfmt+0x21>

400006c1 <.L26>:
            putch('0', putdat);
400006c1:	8b 74 24 40          	mov    0x40(%esp),%esi
400006c5:	83 ec 08             	sub    $0x8,%esp
400006c8:	57                   	push   %edi
400006c9:	6a 30                	push   $0x30
400006cb:	ff d6                	call   *%esi
            putch('x', putdat);
400006cd:	59                   	pop    %ecx
400006ce:	5b                   	pop    %ebx
400006cf:	57                   	push   %edi
400006d0:	6a 78                	push   $0x78
            num = (unsigned long long)
400006d2:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
400006d4:	ff d6                	call   *%esi
            num = (unsigned long long)
400006d6:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
400006da:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
400006df:	8b 08                	mov    (%eax),%ecx
            goto number;
400006e1:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
400006e4:	83 c0 04             	add    $0x4,%eax
400006e7:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
400006eb:	eb b3                	jmp    400006a0 <.L24+0x2e>

400006ed <.L22>:
    if (lflag >= 2)
400006ed:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006f2:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400006f6:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006fa:	0f 8f 6e 01 00 00    	jg     4000086e <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000700:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000704:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000707:	31 db                	xor    %ebx,%ebx
40000709:	ba 10 00 00 00       	mov    $0x10,%edx
4000070e:	8b 09                	mov    (%ecx),%ecx
40000710:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000714:	eb 8a                	jmp    400006a0 <.L24+0x2e>

40000716 <.L29>:
    if (lflag >= 2)
40000716:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
4000071b:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
4000071f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
40000723:	0f 8f 5b 01 00 00    	jg     40000884 <.L25+0x107>
        return va_arg(*ap, long);
40000729:	8b 00                	mov    (%eax),%eax
4000072b:	89 c3                	mov    %eax,%ebx
4000072d:	89 c1                	mov    %eax,%ecx
4000072f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000733:	c1 fb 1f             	sar    $0x1f,%ebx
40000736:	83 c0 04             	add    $0x4,%eax
40000739:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
4000073d:	85 db                	test   %ebx,%ebx
4000073f:	0f 88 68 01 00 00    	js     400008ad <.L19+0xc>
        return va_arg(*ap, unsigned long long);
40000745:	ba 0a 00 00 00       	mov    $0xa,%edx
4000074a:	e9 51 ff ff ff       	jmp    400006a0 <.L24+0x2e>

4000074f <.L28>:
            lflag++;
4000074f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000754:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000756:	e9 f6 fd ff ff       	jmp    40000551 <vprintfmt+0x81>

4000075b <.L27>:
            putch('X', putdat);
4000075b:	8b 74 24 40          	mov    0x40(%esp),%esi
4000075f:	83 ec 08             	sub    $0x8,%esp
40000762:	57                   	push   %edi
40000763:	6a 58                	push   $0x58
40000765:	ff d6                	call   *%esi
            putch('X', putdat);
40000767:	58                   	pop    %eax
40000768:	5a                   	pop    %edx
40000769:	57                   	push   %edi
4000076a:	6a 58                	push   $0x58
4000076c:	ff d6                	call   *%esi
            putch('X', putdat);
4000076e:	59                   	pop    %ecx
4000076f:	5b                   	pop    %ebx
40000770:	57                   	push   %edi
40000771:	6a 58                	push   $0x58
40000773:	ff d6                	call   *%esi
            break;
40000775:	83 c4 10             	add    $0x10,%esp
40000778:	e9 74 fd ff ff       	jmp    400004f1 <vprintfmt+0x21>

4000077d <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
4000077d:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
40000781:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
40000785:	8b 54 24 14          	mov    0x14(%esp),%edx
40000789:	8b 74 24 40          	mov    0x40(%esp),%esi
4000078d:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
40000790:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
40000795:	89 44 24 14          	mov    %eax,0x14(%esp)
40000799:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000079d:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
4000079f:	0f 95 c0             	setne  %al
400007a2:	85 c9                	test   %ecx,%ecx
400007a4:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
400007a7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
400007ab:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
400007ad:	85 db                	test   %ebx,%ebx
400007af:	0f 84 21 01 00 00    	je     400008d6 <.L19+0x35>
            if (width > 0 && padc != '-')
400007b5:	84 c0                	test   %al,%al
400007b7:	0f 85 48 01 00 00    	jne    40000905 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
400007bd:	89 d8                	mov    %ebx,%eax
400007bf:	8d 5b 01             	lea    0x1(%ebx),%ebx
400007c2:	0f be 08             	movsbl (%eax),%ecx
400007c5:	89 c8                	mov    %ecx,%eax
400007c7:	85 c9                	test   %ecx,%ecx
400007c9:	74 64                	je     4000082f <.L25+0xb2>
400007cb:	89 74 24 40          	mov    %esi,0x40(%esp)
400007cf:	89 d6                	mov    %edx,%esi
400007d1:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400007d5:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400007d9:	eb 2a                	jmp    40000805 <.L25+0x88>
400007db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
400007e0:	83 e8 20             	sub    $0x20,%eax
400007e3:	83 f8 5e             	cmp    $0x5e,%eax
400007e6:	76 2d                	jbe    40000815 <.L25+0x98>
                    putch('?', putdat);
400007e8:	83 ec 08             	sub    $0x8,%esp
400007eb:	57                   	push   %edi
400007ec:	6a 3f                	push   $0x3f
400007ee:	ff 54 24 50          	call   *0x50(%esp)
400007f2:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
400007f5:	0f be 03             	movsbl (%ebx),%eax
400007f8:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
400007fb:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
400007fe:	0f be c8             	movsbl %al,%ecx
40000801:	85 c9                	test   %ecx,%ecx
40000803:	74 1e                	je     40000823 <.L25+0xa6>
40000805:	85 f6                	test   %esi,%esi
40000807:	78 05                	js     4000080e <.L25+0x91>
                                         || --precision >= 0); width--)
40000809:	83 ee 01             	sub    $0x1,%esi
4000080c:	72 15                	jb     40000823 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000080e:	8b 14 24             	mov    (%esp),%edx
40000811:	85 d2                	test   %edx,%edx
40000813:	75 cb                	jne    400007e0 <.L25+0x63>
                    putch(ch, putdat);
40000815:	83 ec 08             	sub    $0x8,%esp
40000818:	57                   	push   %edi
40000819:	51                   	push   %ecx
4000081a:	ff 54 24 50          	call   *0x50(%esp)
4000081e:	83 c4 10             	add    $0x10,%esp
40000821:	eb d2                	jmp    400007f5 <.L25+0x78>
40000823:	89 6c 24 08          	mov    %ebp,0x8(%esp)
40000827:	8b 74 24 40          	mov    0x40(%esp),%esi
4000082b:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
4000082f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000833:	85 c0                	test   %eax,%eax
40000835:	7e 19                	jle    40000850 <.L25+0xd3>
40000837:	89 c3                	mov    %eax,%ebx
40000839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
40000840:	83 ec 08             	sub    $0x8,%esp
40000843:	57                   	push   %edi
40000844:	6a 20                	push   $0x20
40000846:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000848:	83 c4 10             	add    $0x10,%esp
4000084b:	83 eb 01             	sub    $0x1,%ebx
4000084e:	75 f0                	jne    40000840 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
40000850:	8b 44 24 14          	mov    0x14(%esp),%eax
40000854:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000858:	e9 94 fc ff ff       	jmp    400004f1 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
4000085d:	8b 08                	mov    (%eax),%ecx
4000085f:	8b 58 04             	mov    0x4(%eax),%ebx
40000862:	83 c0 08             	add    $0x8,%eax
40000865:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000869:	e9 d7 fe ff ff       	jmp    40000745 <.L29+0x2f>
4000086e:	8b 08                	mov    (%eax),%ecx
40000870:	8b 58 04             	mov    0x4(%eax),%ebx
40000873:	83 c0 08             	add    $0x8,%eax
40000876:	ba 10 00 00 00       	mov    $0x10,%edx
4000087b:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000087f:	e9 1c fe ff ff       	jmp    400006a0 <.L24+0x2e>
        return va_arg(*ap, long long);
40000884:	8b 08                	mov    (%eax),%ecx
40000886:	8b 58 04             	mov    0x4(%eax),%ebx
40000889:	83 c0 08             	add    $0x8,%eax
4000088c:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000890:	e9 a8 fe ff ff       	jmp    4000073d <.L29+0x27>

40000895 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
40000895:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
4000089a:	89 eb                	mov    %ebp,%ebx
4000089c:	e9 b0 fc ff ff       	jmp    40000551 <vprintfmt+0x81>

400008a1 <.L19>:
            padc = '-';
400008a1:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400008a6:	89 eb                	mov    %ebp,%ebx
400008a8:	e9 a4 fc ff ff       	jmp    40000551 <vprintfmt+0x81>
400008ad:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
400008b1:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
400008b4:	31 db                	xor    %ebx,%ebx
400008b6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
400008ba:	57                   	push   %edi
400008bb:	6a 2d                	push   $0x2d
400008bd:	ff d6                	call   *%esi
                num = -(long long) num;
400008bf:	8b 4c 24 10          	mov    0x10(%esp),%ecx
400008c3:	ba 0a 00 00 00       	mov    $0xa,%edx
400008c8:	f7 d9                	neg    %ecx
400008ca:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
400008ce:	83 c4 10             	add    $0x10,%esp
400008d1:	e9 ca fd ff ff       	jmp    400006a0 <.L24+0x2e>
            if (width > 0 && padc != '-')
400008d6:	84 c0                	test   %al,%al
400008d8:	0f 85 99 00 00 00    	jne    40000977 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
400008de:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
400008e2:	89 74 24 40          	mov    %esi,0x40(%esp)
400008e6:	b9 28 00 00 00       	mov    $0x28,%ecx
400008eb:	89 d6                	mov    %edx,%esi
400008ed:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400008f1:	b8 28 00 00 00       	mov    $0x28,%eax
400008f6:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400008fa:	8d 9b 42 e0 ff ff    	lea    -0x1fbe(%ebx),%ebx
40000900:	e9 00 ff ff ff       	jmp    40000805 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000905:	83 ec 08             	sub    $0x8,%esp
40000908:	52                   	push   %edx
40000909:	89 54 24 28          	mov    %edx,0x28(%esp)
4000090d:	ff 74 24 24          	push   0x24(%esp)
40000911:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000915:	e8 26 03 00 00       	call   40000c40 <strnlen>
4000091a:	29 44 24 18          	sub    %eax,0x18(%esp)
4000091e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000922:	83 c4 10             	add    $0x10,%esp
40000925:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000929:	85 c9                	test   %ecx,%ecx
4000092b:	0f 8e 99 00 00 00    	jle    400009ca <.L19+0x129>
                    putch(padc, putdat);
40000931:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000936:	89 54 24 10          	mov    %edx,0x10(%esp)
4000093a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000093e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000942:	83 ec 08             	sub    $0x8,%esp
40000945:	57                   	push   %edi
40000946:	53                   	push   %ebx
40000947:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
40000949:	83 c4 10             	add    $0x10,%esp
4000094c:	83 ed 01             	sub    $0x1,%ebp
4000094f:	75 f1                	jne    40000942 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
40000951:	8b 44 24 18          	mov    0x18(%esp),%eax
40000955:	8b 54 24 10          	mov    0x10(%esp),%edx
40000959:	89 6c 24 08          	mov    %ebp,0x8(%esp)
4000095d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000961:	8d 58 01             	lea    0x1(%eax),%ebx
40000964:	0f be 00             	movsbl (%eax),%eax
40000967:	0f be c8             	movsbl %al,%ecx
4000096a:	85 c9                	test   %ecx,%ecx
4000096c:	0f 85 59 fe ff ff    	jne    400007cb <.L25+0x4e>
40000972:	e9 d9 fe ff ff       	jmp    40000850 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
40000977:	83 ec 08             	sub    $0x8,%esp
4000097a:	52                   	push   %edx
4000097b:	8b 5c 24 18          	mov    0x18(%esp),%ebx
4000097f:	8d 8b 41 e0 ff ff    	lea    -0x1fbf(%ebx),%ecx
40000985:	89 54 24 28          	mov    %edx,0x28(%esp)
40000989:	51                   	push   %ecx
4000098a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
4000098e:	e8 ad 02 00 00       	call   40000c40 <strnlen>
40000993:	29 44 24 18          	sub    %eax,0x18(%esp)
40000997:	8b 44 24 18          	mov    0x18(%esp),%eax
4000099b:	83 c4 10             	add    $0x10,%esp
4000099e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400009a2:	85 c0                	test   %eax,%eax
400009a4:	7f 8b                	jg     40000931 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
400009a6:	b9 28 00 00 00       	mov    $0x28,%ecx
400009ab:	b8 28 00 00 00       	mov    $0x28,%eax
400009b0:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400009b4:	89 74 24 40          	mov    %esi,0x40(%esp)
400009b8:	89 d6                	mov    %edx,%esi
400009ba:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400009be:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400009c2:	83 c3 01             	add    $0x1,%ebx
400009c5:	e9 3b fe ff ff       	jmp    40000805 <.L25+0x88>
400009ca:	8b 44 24 18          	mov    0x18(%esp),%eax
400009ce:	0f be 08             	movsbl (%eax),%ecx
400009d1:	89 c8                	mov    %ecx,%eax
400009d3:	85 c9                	test   %ecx,%ecx
400009d5:	75 d9                	jne    400009b0 <.L19+0x10f>
400009d7:	e9 74 fe ff ff       	jmp    40000850 <.L25+0xd3>
400009dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

400009e0 <printfmt>:
{
400009e0:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
400009e3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400009e7:	50                   	push   %eax
400009e8:	ff 74 24 1c          	push   0x1c(%esp)
400009ec:	ff 74 24 1c          	push   0x1c(%esp)
400009f0:	ff 74 24 1c          	push   0x1c(%esp)
400009f4:	e8 d7 fa ff ff       	call   400004d0 <vprintfmt>
}
400009f9:	83 c4 1c             	add    $0x1c,%esp
400009fc:	c3                   	ret
400009fd:	8d 76 00             	lea    0x0(%esi),%esi

40000a00 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a00:	e8 4e 01 00 00       	call   40000b53 <__x86.get_pc_thunk.ax>
40000a05:	05 ef 35 00 00       	add    $0x35ef,%eax
{
40000a0a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a0d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a11:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a18:	ff 
40000a19:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a20:	00 
40000a21:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a25:	ff 74 24 28          	push   0x28(%esp)
40000a29:	ff 74 24 28          	push   0x28(%esp)
40000a2d:	8d 80 bc c4 ff ff    	lea    -0x3b44(%eax),%eax
40000a33:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a37:	52                   	push   %edx
40000a38:	50                   	push   %eax
40000a39:	e8 92 fa ff ff       	call   400004d0 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a3e:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a42:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a45:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a49:	83 c4 2c             	add    $0x2c,%esp
40000a4c:	c3                   	ret
40000a4d:	8d 76 00             	lea    0x0(%esi),%esi

40000a50 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a50:	e8 fe 00 00 00       	call   40000b53 <__x86.get_pc_thunk.ax>
40000a55:	05 9f 35 00 00       	add    $0x359f,%eax
{
40000a5a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a5d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a61:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a68:	ff 
40000a69:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a70:	00 
40000a71:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a75:	8d 54 24 28          	lea    0x28(%esp),%edx
40000a79:	52                   	push   %edx
40000a7a:	ff 74 24 28          	push   0x28(%esp)
40000a7e:	8d 80 bc c4 ff ff    	lea    -0x3b44(%eax),%eax
40000a84:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a88:	52                   	push   %edx
40000a89:	50                   	push   %eax
40000a8a:	e8 41 fa ff ff       	call   400004d0 <vprintfmt>
    *b.buf = '\0';
40000a8f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a93:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
40000a96:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a9a:	83 c4 2c             	add    $0x2c,%esp
40000a9d:	c3                   	ret
40000a9e:	66 90                	xchg   %ax,%ax

40000aa0 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000aa0:	e8 b2 00 00 00       	call   40000b57 <__x86.get_pc_thunk.dx>
40000aa5:	81 c2 4f 35 00 00    	add    $0x354f,%edx
{
40000aab:	83 ec 1c             	sub    $0x1c,%esp
40000aae:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000ab2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000ab6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000abd:	00 
40000abe:	89 44 24 04          	mov    %eax,0x4(%esp)
40000ac2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000ac6:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000aca:	ff 74 24 2c          	push   0x2c(%esp)
40000ace:	ff 74 24 2c          	push   0x2c(%esp)
40000ad2:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000ad6:	50                   	push   %eax
40000ad7:	8d 82 bc c4 ff ff    	lea    -0x3b44(%edx),%eax
40000add:	50                   	push   %eax
40000ade:	e8 ed f9 ff ff       	call   400004d0 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000ae3:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ae7:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000aea:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000aee:	83 c4 2c             	add    $0x2c,%esp
40000af1:	c3                   	ret
40000af2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000af9:	00 
40000afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000b00 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000b00:	e8 52 00 00 00       	call   40000b57 <__x86.get_pc_thunk.dx>
40000b05:	81 c2 ef 34 00 00    	add    $0x34ef,%edx
{
40000b0b:	83 ec 1c             	sub    $0x1c,%esp
40000b0e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000b12:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000b16:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000b1d:	00 
40000b1e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b22:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000b26:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000b2a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000b2e:	50                   	push   %eax
40000b2f:	ff 74 24 2c          	push   0x2c(%esp)
40000b33:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b37:	50                   	push   %eax
40000b38:	8d 82 bc c4 ff ff    	lea    -0x3b44(%edx),%eax
40000b3e:	50                   	push   %eax
40000b3f:	e8 8c f9 ff ff       	call   400004d0 <vprintfmt>
    *b.buf = '\0';
40000b44:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b48:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000b4b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b4f:	83 c4 2c             	add    $0x2c,%esp
40000b52:	c3                   	ret

40000b53 <__x86.get_pc_thunk.ax>:
40000b53:	8b 04 24             	mov    (%esp),%eax
40000b56:	c3                   	ret

40000b57 <__x86.get_pc_thunk.dx>:
40000b57:	8b 14 24             	mov    (%esp),%edx
40000b5a:	c3                   	ret

40000b5b <__x86.get_pc_thunk.cx>:
40000b5b:	8b 0c 24             	mov    (%esp),%ecx
40000b5e:	c3                   	ret
40000b5f:	90                   	nop

40000b60 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000b60:	53                   	push   %ebx
    asm volatile ("int %2"
40000b61:	b8 02 00 00 00       	mov    $0x2,%eax
40000b66:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000b6a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000b6e:	cd 30                	int    $0x30
    return errno ? -1 : pid;
40000b70:	85 c0                	test   %eax,%eax
40000b72:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000b77:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000b7a:	5b                   	pop    %ebx
40000b7b:	c3                   	ret
40000b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b80 <yield>:
    asm volatile ("int %0"
40000b80:	b8 03 00 00 00       	mov    $0x3,%eax
40000b85:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000b87:	c3                   	ret
40000b88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b8f:	00 

40000b90 <produce>:

void produce(int item)
{
40000b90:	53                   	push   %ebx
}

static gcc_inline void sys_produce(unsigned int item)
{
	int errno; 
    asm volatile ("int %1"
40000b91:	b8 0e 00 00 00       	mov    $0xe,%eax
40000b96:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000b9a:	cd 30                	int    $0x30
    sys_produce(item);
}
40000b9c:	5b                   	pop    %ebx
40000b9d:	c3                   	ret
40000b9e:	66 90                	xchg   %ax,%ax

40000ba0 <consume>:

int consume(void)
{
40000ba0:	53                   	push   %ebx

static gcc_inline int sys_consume(void)
{
	int errno, item;

    asm volatile ("int %2"
40000ba1:	b8 0f 00 00 00       	mov    $0xf,%eax
40000ba6:	cd 30                	int    $0x30
    return sys_consume();
40000ba8:	89 d8                	mov    %ebx,%eax
40000baa:	5b                   	pop    %ebx
40000bab:	c3                   	ret
40000bac:	66 90                	xchg   %ax,%ax
40000bae:	66 90                	xchg   %ax,%ax

40000bb0 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000bb0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000bb4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000bba:	c3                   	ret
40000bbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000bc0 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000bc0:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000bc4:	b8 01 00 00 00       	mov    $0x1,%eax
40000bc9:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000bcc:	85 c0                	test   %eax,%eax
40000bce:	74 13                	je     40000be3 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000bd0:	b9 01 00 00 00       	mov    $0x1,%ecx
40000bd5:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000bd8:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000bda:	89 c8                	mov    %ecx,%eax
40000bdc:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000bdf:	85 c0                	test   %eax,%eax
40000be1:	75 f5                	jne    40000bd8 <spinlock_acquire+0x18>
}
40000be3:	c3                   	ret
40000be4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000beb:	00 
40000bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000bf0 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000bf0:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000bf4:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000bf6:	84 c0                	test   %al,%al
40000bf8:	74 05                	je     40000bff <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000bfa:	31 c0                	xor    %eax,%eax
40000bfc:	f0 87 02             	lock xchg %eax,(%edx)
}
40000bff:	c3                   	ret

40000c00 <spinlock_holding>:
    return *lk;
40000c00:	8b 44 24 04          	mov    0x4(%esp),%eax
40000c04:	8b 00                	mov    (%eax),%eax
}
40000c06:	c3                   	ret
40000c07:	66 90                	xchg   %ax,%ax
40000c09:	66 90                	xchg   %ax,%ax
40000c0b:	66 90                	xchg   %ax,%ax
40000c0d:	66 90                	xchg   %ax,%ax
40000c0f:	90                   	nop

40000c10 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000c10:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000c14:	31 c0                	xor    %eax,%eax
40000c16:	80 3a 00             	cmpb   $0x0,(%edx)
40000c19:	74 15                	je     40000c30 <strlen+0x20>
40000c1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000c20:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000c23:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000c27:	75 f7                	jne    40000c20 <strlen+0x10>
40000c29:	c3                   	ret
40000c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000c30:	c3                   	ret
40000c31:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c38:	00 
40000c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c40 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000c40:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c44:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c48:	31 c0                	xor    %eax,%eax
40000c4a:	85 d2                	test   %edx,%edx
40000c4c:	75 09                	jne    40000c57 <strnlen+0x17>
40000c4e:	c3                   	ret
40000c4f:	90                   	nop
        n++;
40000c50:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c53:	39 c2                	cmp    %eax,%edx
40000c55:	74 09                	je     40000c60 <strnlen+0x20>
40000c57:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000c5b:	75 f3                	jne    40000c50 <strnlen+0x10>
40000c5d:	c3                   	ret
40000c5e:	66 90                	xchg   %ax,%ax
    return n;
}
40000c60:	c3                   	ret
40000c61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c68:	00 
40000c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c70 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000c70:	53                   	push   %ebx
40000c71:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000c75:	31 c0                	xor    %eax,%eax
{
40000c77:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000c7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000c80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000c84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000c87:	83 c0 01             	add    $0x1,%eax
40000c8a:	84 d2                	test   %dl,%dl
40000c8c:	75 f2                	jne    40000c80 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000c8e:	89 c8                	mov    %ecx,%eax
40000c90:	5b                   	pop    %ebx
40000c91:	c3                   	ret
40000c92:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c99:	00 
40000c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000ca0 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000ca0:	56                   	push   %esi
40000ca1:	53                   	push   %ebx
40000ca2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000ca6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000caa:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000cae:	85 db                	test   %ebx,%ebx
40000cb0:	74 21                	je     40000cd3 <strncpy+0x33>
40000cb2:	01 f3                	add    %esi,%ebx
40000cb4:	89 f0                	mov    %esi,%eax
40000cb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cbd:	00 
40000cbe:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000cc0:	0f b6 0a             	movzbl (%edx),%ecx
40000cc3:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000cc6:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000cc9:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000ccc:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000ccf:	39 c3                	cmp    %eax,%ebx
40000cd1:	75 ed                	jne    40000cc0 <strncpy+0x20>
    }
    return ret;
}
40000cd3:	89 f0                	mov    %esi,%eax
40000cd5:	5b                   	pop    %ebx
40000cd6:	5e                   	pop    %esi
40000cd7:	c3                   	ret
40000cd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cdf:	00 

40000ce0 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000ce0:	56                   	push   %esi
40000ce1:	53                   	push   %ebx
40000ce2:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ce6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000cea:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000cee:	85 c0                	test   %eax,%eax
40000cf0:	74 29                	je     40000d1b <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000cf2:	89 f2                	mov    %esi,%edx
40000cf4:	83 e8 01             	sub    $0x1,%eax
40000cf7:	74 1f                	je     40000d18 <strlcpy+0x38>
40000cf9:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000cfc:	eb 0f                	jmp    40000d0d <strlcpy+0x2d>
40000cfe:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000d00:	83 c2 01             	add    $0x1,%edx
40000d03:	83 c1 01             	add    $0x1,%ecx
40000d06:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000d09:	39 da                	cmp    %ebx,%edx
40000d0b:	74 07                	je     40000d14 <strlcpy+0x34>
40000d0d:	0f b6 01             	movzbl (%ecx),%eax
40000d10:	84 c0                	test   %al,%al
40000d12:	75 ec                	jne    40000d00 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000d14:	89 d0                	mov    %edx,%eax
40000d16:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000d18:	c6 02 00             	movb   $0x0,(%edx)
}
40000d1b:	5b                   	pop    %ebx
40000d1c:	5e                   	pop    %esi
40000d1d:	c3                   	ret
40000d1e:	66 90                	xchg   %ax,%ax

40000d20 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000d20:	53                   	push   %ebx
40000d21:	8b 54 24 08          	mov    0x8(%esp),%edx
40000d25:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000d29:	0f b6 02             	movzbl (%edx),%eax
40000d2c:	84 c0                	test   %al,%al
40000d2e:	75 18                	jne    40000d48 <strcmp+0x28>
40000d30:	eb 30                	jmp    40000d62 <strcmp+0x42>
40000d32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d38:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000d3c:	83 c2 01             	add    $0x1,%edx
40000d3f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000d42:	84 c0                	test   %al,%al
40000d44:	74 12                	je     40000d58 <strcmp+0x38>
40000d46:	89 d9                	mov    %ebx,%ecx
40000d48:	0f b6 19             	movzbl (%ecx),%ebx
40000d4b:	38 c3                	cmp    %al,%bl
40000d4d:	74 e9                	je     40000d38 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d4f:	29 d8                	sub    %ebx,%eax
}
40000d51:	5b                   	pop    %ebx
40000d52:	c3                   	ret
40000d53:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d58:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000d5c:	31 c0                	xor    %eax,%eax
40000d5e:	29 d8                	sub    %ebx,%eax
}
40000d60:	5b                   	pop    %ebx
40000d61:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d62:	0f b6 19             	movzbl (%ecx),%ebx
40000d65:	31 c0                	xor    %eax,%eax
40000d67:	eb e6                	jmp    40000d4f <strcmp+0x2f>
40000d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000d70 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000d70:	53                   	push   %ebx
40000d71:	8b 54 24 10          	mov    0x10(%esp),%edx
40000d75:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d79:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000d7d:	85 d2                	test   %edx,%edx
40000d7f:	75 16                	jne    40000d97 <strncmp+0x27>
40000d81:	eb 2d                	jmp    40000db0 <strncmp+0x40>
40000d83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d88:	3a 19                	cmp    (%ecx),%bl
40000d8a:	75 12                	jne    40000d9e <strncmp+0x2e>
        n--, p++, q++;
40000d8c:	83 c0 01             	add    $0x1,%eax
40000d8f:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000d92:	83 ea 01             	sub    $0x1,%edx
40000d95:	74 19                	je     40000db0 <strncmp+0x40>
40000d97:	0f b6 18             	movzbl (%eax),%ebx
40000d9a:	84 db                	test   %bl,%bl
40000d9c:	75 ea                	jne    40000d88 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d9e:	0f b6 00             	movzbl (%eax),%eax
40000da1:	0f b6 11             	movzbl (%ecx),%edx
}
40000da4:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000da5:	29 d0                	sub    %edx,%eax
}
40000da7:	c3                   	ret
40000da8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000daf:	00 
        return 0;
40000db0:	31 c0                	xor    %eax,%eax
}
40000db2:	5b                   	pop    %ebx
40000db3:	c3                   	ret
40000db4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dbb:	00 
40000dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000dc0 <strchr>:

char *strchr(const char *s, char c)
{
40000dc0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000dc4:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000dc9:	0f b6 10             	movzbl (%eax),%edx
40000dcc:	84 d2                	test   %dl,%dl
40000dce:	75 13                	jne    40000de3 <strchr+0x23>
40000dd0:	eb 1e                	jmp    40000df0 <strchr+0x30>
40000dd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000dd8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000ddc:	83 c0 01             	add    $0x1,%eax
40000ddf:	84 d2                	test   %dl,%dl
40000de1:	74 0d                	je     40000df0 <strchr+0x30>
        if (*s == c)
40000de3:	38 d1                	cmp    %dl,%cl
40000de5:	75 f1                	jne    40000dd8 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000de7:	c3                   	ret
40000de8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000def:	00 
    return 0;
40000df0:	31 c0                	xor    %eax,%eax
}
40000df2:	c3                   	ret
40000df3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dfa:	00 
40000dfb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000e00 <strfind>:

char *strfind(const char *s, char c)
{
40000e00:	53                   	push   %ebx
40000e01:	8b 44 24 08          	mov    0x8(%esp),%eax
40000e05:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000e09:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000e0c:	38 d3                	cmp    %dl,%bl
40000e0e:	74 1f                	je     40000e2f <strfind+0x2f>
40000e10:	89 d1                	mov    %edx,%ecx
40000e12:	84 db                	test   %bl,%bl
40000e14:	75 0e                	jne    40000e24 <strfind+0x24>
40000e16:	eb 17                	jmp    40000e2f <strfind+0x2f>
40000e18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e1f:	00 
40000e20:	84 d2                	test   %dl,%dl
40000e22:	74 0b                	je     40000e2f <strfind+0x2f>
    for (; *s; s++)
40000e24:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000e28:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000e2b:	38 ca                	cmp    %cl,%dl
40000e2d:	75 f1                	jne    40000e20 <strfind+0x20>
            break;
    return (char *) s;
}
40000e2f:	5b                   	pop    %ebx
40000e30:	c3                   	ret
40000e31:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e38:	00 
40000e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000e40 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000e40:	55                   	push   %ebp
40000e41:	57                   	push   %edi
40000e42:	56                   	push   %esi
40000e43:	53                   	push   %ebx
40000e44:	8b 54 24 14          	mov    0x14(%esp),%edx
40000e48:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000e4c:	0f b6 02             	movzbl (%edx),%eax
40000e4f:	3c 20                	cmp    $0x20,%al
40000e51:	75 10                	jne    40000e63 <strtol+0x23>
40000e53:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e58:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000e5c:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000e5f:	3c 20                	cmp    $0x20,%al
40000e61:	74 f5                	je     40000e58 <strtol+0x18>
40000e63:	3c 09                	cmp    $0x9,%al
40000e65:	74 f1                	je     40000e58 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000e67:	3c 2b                	cmp    $0x2b,%al
40000e69:	0f 84 b1 00 00 00    	je     40000f20 <strtol+0xe0>
    int neg = 0;
40000e6f:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000e71:	3c 2d                	cmp    $0x2d,%al
40000e73:	0f 84 97 00 00 00    	je     40000f10 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000e79:	0f b6 02             	movzbl (%edx),%eax
40000e7c:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000e83:	ff 
40000e84:	75 1d                	jne    40000ea3 <strtol+0x63>
40000e86:	3c 30                	cmp    $0x30,%al
40000e88:	0f 84 a2 00 00 00    	je     40000f30 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000e8e:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000e93:	19 c0                	sbb    %eax,%eax
40000e95:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000e99:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000e9e:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000ea3:	31 c9                	xor    %ecx,%ecx
40000ea5:	eb 1c                	jmp    40000ec3 <strtol+0x83>
40000ea7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000eae:	00 
40000eaf:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000eb0:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000eb3:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000eb7:	7d 2a                	jge    40000ee3 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000eb9:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000ebe:	83 c2 01             	add    $0x1,%edx
40000ec1:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000ec3:	0f be 02             	movsbl (%edx),%eax
40000ec6:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000ec9:	89 eb                	mov    %ebp,%ebx
40000ecb:	80 fb 09             	cmp    $0x9,%bl
40000ece:	76 e0                	jbe    40000eb0 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000ed0:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000ed3:	89 eb                	mov    %ebp,%ebx
40000ed5:	80 fb 19             	cmp    $0x19,%bl
40000ed8:	77 26                	ja     40000f00 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000eda:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000edd:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000ee1:	7c d6                	jl     40000eb9 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000ee3:	85 f6                	test   %esi,%esi
40000ee5:	74 02                	je     40000ee9 <strtol+0xa9>
        *endptr = (char *) s;
40000ee7:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000ee9:	89 c8                	mov    %ecx,%eax
}
40000eeb:	5b                   	pop    %ebx
40000eec:	5e                   	pop    %esi
    return (neg ? -val : val);
40000eed:	f7 d8                	neg    %eax
40000eef:	85 ff                	test   %edi,%edi
}
40000ef1:	5f                   	pop    %edi
40000ef2:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000ef3:	0f 45 c8             	cmovne %eax,%ecx
}
40000ef6:	89 c8                	mov    %ecx,%eax
40000ef8:	c3                   	ret
40000ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000f00:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000f03:	89 eb                	mov    %ebp,%ebx
40000f05:	80 fb 19             	cmp    $0x19,%bl
40000f08:	77 d9                	ja     40000ee3 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000f0a:	83 e8 37             	sub    $0x37,%eax
40000f0d:	eb a4                	jmp    40000eb3 <strtol+0x73>
40000f0f:	90                   	nop
        s++, neg = 1;
40000f10:	83 c2 01             	add    $0x1,%edx
40000f13:	bf 01 00 00 00       	mov    $0x1,%edi
40000f18:	e9 5c ff ff ff       	jmp    40000e79 <strtol+0x39>
40000f1d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000f20:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000f23:	31 ff                	xor    %edi,%edi
40000f25:	e9 4f ff ff ff       	jmp    40000e79 <strtol+0x39>
40000f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000f30:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000f34:	74 25                	je     40000f5b <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000f36:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000f3a:	85 c0                	test   %eax,%eax
40000f3c:	74 0d                	je     40000f4b <strtol+0x10b>
40000f3e:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f45:	00 
40000f46:	e9 58 ff ff ff       	jmp    40000ea3 <strtol+0x63>
        s++, base = 8;
40000f4b:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000f52:	00 
40000f53:	83 c2 01             	add    $0x1,%edx
40000f56:	e9 48 ff ff ff       	jmp    40000ea3 <strtol+0x63>
        s += 2, base = 16;
40000f5b:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f62:	00 
40000f63:	83 c2 02             	add    $0x2,%edx
40000f66:	e9 38 ff ff ff       	jmp    40000ea3 <strtol+0x63>
40000f6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f70 <memset>:

void *memset(void *v, int c, size_t n)
{
40000f70:	57                   	push   %edi
40000f71:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000f75:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000f79:	85 c9                	test   %ecx,%ecx
40000f7b:	74 19                	je     40000f96 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000f7d:	89 f8                	mov    %edi,%eax
40000f7f:	09 c8                	or     %ecx,%eax
40000f81:	a8 03                	test   $0x3,%al
40000f83:	75 1b                	jne    40000fa0 <memset+0x30>
        c &= 0xFF;
40000f85:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000f8a:	c1 e9 02             	shr    $0x2,%ecx
40000f8d:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000f93:	fc                   	cld
40000f94:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000f96:	89 f8                	mov    %edi,%eax
40000f98:	5f                   	pop    %edi
40000f99:	c3                   	ret
40000f9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000fa0:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fa4:	fc                   	cld
40000fa5:	f3 aa                	rep stos %al,%es:(%edi)
}
40000fa7:	89 f8                	mov    %edi,%eax
40000fa9:	5f                   	pop    %edi
40000faa:	c3                   	ret
40000fab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000fb0 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000fb0:	57                   	push   %edi
40000fb1:	56                   	push   %esi
40000fb2:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fb6:	8b 74 24 10          	mov    0x10(%esp),%esi
40000fba:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000fbe:	39 c6                	cmp    %eax,%esi
40000fc0:	73 26                	jae    40000fe8 <memmove+0x38>
40000fc2:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000fc5:	39 d0                	cmp    %edx,%eax
40000fc7:	73 1f                	jae    40000fe8 <memmove+0x38>
        s += n;
        d += n;
40000fc9:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000fcc:	89 fe                	mov    %edi,%esi
40000fce:	09 ce                	or     %ecx,%esi
40000fd0:	09 d6                	or     %edx,%esi
40000fd2:	83 e6 03             	and    $0x3,%esi
40000fd5:	74 39                	je     40001010 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000fd7:	83 ef 01             	sub    $0x1,%edi
40000fda:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000fdd:	fd                   	std
40000fde:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000fe0:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000fe1:	5e                   	pop    %esi
40000fe2:	5f                   	pop    %edi
40000fe3:	c3                   	ret
40000fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000fe8:	89 c2                	mov    %eax,%edx
40000fea:	09 ca                	or     %ecx,%edx
40000fec:	09 f2                	or     %esi,%edx
40000fee:	83 e2 03             	and    $0x3,%edx
40000ff1:	74 0d                	je     40001000 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40000ff3:	89 c7                	mov    %eax,%edi
40000ff5:	fc                   	cld
40000ff6:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40000ff8:	5e                   	pop    %esi
40000ff9:	5f                   	pop    %edi
40000ffa:	c3                   	ret
40000ffb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40001000:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40001003:	89 c7                	mov    %eax,%edi
40001005:	fc                   	cld
40001006:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001008:	eb ee                	jmp    40000ff8 <memmove+0x48>
4000100a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40001010:	83 ef 04             	sub    $0x4,%edi
40001013:	8d 72 fc             	lea    -0x4(%edx),%esi
40001016:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40001019:	fd                   	std
4000101a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
4000101c:	eb c2                	jmp    40000fe0 <memmove+0x30>
4000101e:	66 90                	xchg   %ax,%ax

40001020 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40001020:	eb 8e                	jmp    40000fb0 <memmove>
40001022:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001029:	00 
4000102a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001030 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40001030:	56                   	push   %esi
40001031:	53                   	push   %ebx
40001032:	8b 74 24 14          	mov    0x14(%esp),%esi
40001036:	8b 44 24 0c          	mov    0xc(%esp),%eax
4000103a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
4000103e:	85 f6                	test   %esi,%esi
40001040:	74 2e                	je     40001070 <memcmp+0x40>
40001042:	01 c6                	add    %eax,%esi
40001044:	eb 14                	jmp    4000105a <memcmp+0x2a>
40001046:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000104d:	00 
4000104e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40001050:	83 c0 01             	add    $0x1,%eax
40001053:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40001056:	39 f0                	cmp    %esi,%eax
40001058:	74 16                	je     40001070 <memcmp+0x40>
        if (*s1 != *s2)
4000105a:	0f b6 08             	movzbl (%eax),%ecx
4000105d:	0f b6 1a             	movzbl (%edx),%ebx
40001060:	38 d9                	cmp    %bl,%cl
40001062:	74 ec                	je     40001050 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40001064:	0f b6 c1             	movzbl %cl,%eax
40001067:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40001069:	5b                   	pop    %ebx
4000106a:	5e                   	pop    %esi
4000106b:	c3                   	ret
4000106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
40001070:	31 c0                	xor    %eax,%eax
}
40001072:	5b                   	pop    %ebx
40001073:	5e                   	pop    %esi
40001074:	c3                   	ret
40001075:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000107c:	00 
4000107d:	8d 76 00             	lea    0x0(%esi),%esi

40001080 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40001080:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
40001084:	8b 54 24 0c          	mov    0xc(%esp),%edx
40001088:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
4000108a:	39 d0                	cmp    %edx,%eax
4000108c:	73 1a                	jae    400010a8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000108e:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
40001093:	eb 0a                	jmp    4000109f <memchr+0x1f>
40001095:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
40001098:	83 c0 01             	add    $0x1,%eax
4000109b:	39 c2                	cmp    %eax,%edx
4000109d:	74 09                	je     400010a8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000109f:	38 08                	cmp    %cl,(%eax)
400010a1:	75 f5                	jne    40001098 <memchr+0x18>
            return (void *) s;
    return NULL;
}
400010a3:	c3                   	ret
400010a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
400010a8:	31 c0                	xor    %eax,%eax
}
400010aa:	c3                   	ret
400010ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

400010b0 <memzero>:

void *memzero(void *v, size_t n)
{
400010b0:	57                   	push   %edi
400010b1:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400010b5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
400010b9:	85 c9                	test   %ecx,%ecx
400010bb:	74 0f                	je     400010cc <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
400010bd:	89 f8                	mov    %edi,%eax
400010bf:	09 c8                	or     %ecx,%eax
400010c1:	83 e0 03             	and    $0x3,%eax
400010c4:	75 0a                	jne    400010d0 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
400010c6:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
400010c9:	fc                   	cld
400010ca:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
400010cc:	89 f8                	mov    %edi,%eax
400010ce:	5f                   	pop    %edi
400010cf:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
400010d0:	31 c0                	xor    %eax,%eax
400010d2:	fc                   	cld
400010d3:	f3 aa                	rep stos %al,%es:(%edi)
}
400010d5:	89 f8                	mov    %edi,%eax
400010d7:	5f                   	pop    %edi
400010d8:	c3                   	ret
400010d9:	66 90                	xchg   %ax,%ax
400010db:	66 90                	xchg   %ax,%ax
400010dd:	66 90                	xchg   %ax,%ax
400010df:	90                   	nop

400010e0 <__udivdi3>:
400010e0:	f3 0f 1e fb          	endbr32
400010e4:	55                   	push   %ebp
400010e5:	57                   	push   %edi
400010e6:	56                   	push   %esi
400010e7:	53                   	push   %ebx
400010e8:	83 ec 1c             	sub    $0x1c,%esp
400010eb:	8b 44 24 3c          	mov    0x3c(%esp),%eax
400010ef:	8b 6c 24 30          	mov    0x30(%esp),%ebp
400010f3:	8b 74 24 34          	mov    0x34(%esp),%esi
400010f7:	8b 5c 24 38          	mov    0x38(%esp),%ebx
400010fb:	85 c0                	test   %eax,%eax
400010fd:	75 19                	jne    40001118 <__udivdi3+0x38>
400010ff:	39 de                	cmp    %ebx,%esi
40001101:	73 4d                	jae    40001150 <__udivdi3+0x70>
40001103:	31 ff                	xor    %edi,%edi
40001105:	89 e8                	mov    %ebp,%eax
40001107:	89 f2                	mov    %esi,%edx
40001109:	f7 f3                	div    %ebx
4000110b:	89 fa                	mov    %edi,%edx
4000110d:	83 c4 1c             	add    $0x1c,%esp
40001110:	5b                   	pop    %ebx
40001111:	5e                   	pop    %esi
40001112:	5f                   	pop    %edi
40001113:	5d                   	pop    %ebp
40001114:	c3                   	ret
40001115:	8d 76 00             	lea    0x0(%esi),%esi
40001118:	39 c6                	cmp    %eax,%esi
4000111a:	73 14                	jae    40001130 <__udivdi3+0x50>
4000111c:	31 ff                	xor    %edi,%edi
4000111e:	31 c0                	xor    %eax,%eax
40001120:	89 fa                	mov    %edi,%edx
40001122:	83 c4 1c             	add    $0x1c,%esp
40001125:	5b                   	pop    %ebx
40001126:	5e                   	pop    %esi
40001127:	5f                   	pop    %edi
40001128:	5d                   	pop    %ebp
40001129:	c3                   	ret
4000112a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001130:	0f bd f8             	bsr    %eax,%edi
40001133:	83 f7 1f             	xor    $0x1f,%edi
40001136:	75 48                	jne    40001180 <__udivdi3+0xa0>
40001138:	39 f0                	cmp    %esi,%eax
4000113a:	72 06                	jb     40001142 <__udivdi3+0x62>
4000113c:	31 c0                	xor    %eax,%eax
4000113e:	39 dd                	cmp    %ebx,%ebp
40001140:	72 de                	jb     40001120 <__udivdi3+0x40>
40001142:	b8 01 00 00 00       	mov    $0x1,%eax
40001147:	eb d7                	jmp    40001120 <__udivdi3+0x40>
40001149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001150:	89 d9                	mov    %ebx,%ecx
40001152:	85 db                	test   %ebx,%ebx
40001154:	75 0b                	jne    40001161 <__udivdi3+0x81>
40001156:	b8 01 00 00 00       	mov    $0x1,%eax
4000115b:	31 d2                	xor    %edx,%edx
4000115d:	f7 f3                	div    %ebx
4000115f:	89 c1                	mov    %eax,%ecx
40001161:	31 d2                	xor    %edx,%edx
40001163:	89 f0                	mov    %esi,%eax
40001165:	f7 f1                	div    %ecx
40001167:	89 c6                	mov    %eax,%esi
40001169:	89 e8                	mov    %ebp,%eax
4000116b:	89 f7                	mov    %esi,%edi
4000116d:	f7 f1                	div    %ecx
4000116f:	89 fa                	mov    %edi,%edx
40001171:	83 c4 1c             	add    $0x1c,%esp
40001174:	5b                   	pop    %ebx
40001175:	5e                   	pop    %esi
40001176:	5f                   	pop    %edi
40001177:	5d                   	pop    %ebp
40001178:	c3                   	ret
40001179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001180:	89 f9                	mov    %edi,%ecx
40001182:	ba 20 00 00 00       	mov    $0x20,%edx
40001187:	29 fa                	sub    %edi,%edx
40001189:	d3 e0                	shl    %cl,%eax
4000118b:	89 44 24 08          	mov    %eax,0x8(%esp)
4000118f:	89 d1                	mov    %edx,%ecx
40001191:	89 d8                	mov    %ebx,%eax
40001193:	d3 e8                	shr    %cl,%eax
40001195:	89 c1                	mov    %eax,%ecx
40001197:	8b 44 24 08          	mov    0x8(%esp),%eax
4000119b:	09 c1                	or     %eax,%ecx
4000119d:	89 f0                	mov    %esi,%eax
4000119f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400011a3:	89 f9                	mov    %edi,%ecx
400011a5:	d3 e3                	shl    %cl,%ebx
400011a7:	89 d1                	mov    %edx,%ecx
400011a9:	d3 e8                	shr    %cl,%eax
400011ab:	89 f9                	mov    %edi,%ecx
400011ad:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
400011b1:	89 eb                	mov    %ebp,%ebx
400011b3:	d3 e6                	shl    %cl,%esi
400011b5:	89 d1                	mov    %edx,%ecx
400011b7:	d3 eb                	shr    %cl,%ebx
400011b9:	09 f3                	or     %esi,%ebx
400011bb:	89 c6                	mov    %eax,%esi
400011bd:	89 f2                	mov    %esi,%edx
400011bf:	89 d8                	mov    %ebx,%eax
400011c1:	f7 74 24 08          	divl   0x8(%esp)
400011c5:	89 d6                	mov    %edx,%esi
400011c7:	89 c3                	mov    %eax,%ebx
400011c9:	f7 64 24 0c          	mull   0xc(%esp)
400011cd:	39 d6                	cmp    %edx,%esi
400011cf:	72 1f                	jb     400011f0 <__udivdi3+0x110>
400011d1:	89 f9                	mov    %edi,%ecx
400011d3:	d3 e5                	shl    %cl,%ebp
400011d5:	39 c5                	cmp    %eax,%ebp
400011d7:	73 04                	jae    400011dd <__udivdi3+0xfd>
400011d9:	39 d6                	cmp    %edx,%esi
400011db:	74 13                	je     400011f0 <__udivdi3+0x110>
400011dd:	89 d8                	mov    %ebx,%eax
400011df:	31 ff                	xor    %edi,%edi
400011e1:	e9 3a ff ff ff       	jmp    40001120 <__udivdi3+0x40>
400011e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400011ed:	00 
400011ee:	66 90                	xchg   %ax,%ax
400011f0:	8d 43 ff             	lea    -0x1(%ebx),%eax
400011f3:	31 ff                	xor    %edi,%edi
400011f5:	e9 26 ff ff ff       	jmp    40001120 <__udivdi3+0x40>
400011fa:	66 90                	xchg   %ax,%ax
400011fc:	66 90                	xchg   %ax,%ax
400011fe:	66 90                	xchg   %ax,%ax

40001200 <__umoddi3>:
40001200:	f3 0f 1e fb          	endbr32
40001204:	55                   	push   %ebp
40001205:	57                   	push   %edi
40001206:	56                   	push   %esi
40001207:	53                   	push   %ebx
40001208:	83 ec 1c             	sub    $0x1c,%esp
4000120b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
4000120f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40001213:	8b 74 24 30          	mov    0x30(%esp),%esi
40001217:	8b 7c 24 38          	mov    0x38(%esp),%edi
4000121b:	89 da                	mov    %ebx,%edx
4000121d:	85 c0                	test   %eax,%eax
4000121f:	75 17                	jne    40001238 <__umoddi3+0x38>
40001221:	39 fb                	cmp    %edi,%ebx
40001223:	73 53                	jae    40001278 <__umoddi3+0x78>
40001225:	89 f0                	mov    %esi,%eax
40001227:	f7 f7                	div    %edi
40001229:	89 d0                	mov    %edx,%eax
4000122b:	31 d2                	xor    %edx,%edx
4000122d:	83 c4 1c             	add    $0x1c,%esp
40001230:	5b                   	pop    %ebx
40001231:	5e                   	pop    %esi
40001232:	5f                   	pop    %edi
40001233:	5d                   	pop    %ebp
40001234:	c3                   	ret
40001235:	8d 76 00             	lea    0x0(%esi),%esi
40001238:	89 f1                	mov    %esi,%ecx
4000123a:	39 c3                	cmp    %eax,%ebx
4000123c:	73 12                	jae    40001250 <__umoddi3+0x50>
4000123e:	89 f0                	mov    %esi,%eax
40001240:	83 c4 1c             	add    $0x1c,%esp
40001243:	5b                   	pop    %ebx
40001244:	5e                   	pop    %esi
40001245:	5f                   	pop    %edi
40001246:	5d                   	pop    %ebp
40001247:	c3                   	ret
40001248:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000124f:	00 
40001250:	0f bd e8             	bsr    %eax,%ebp
40001253:	83 f5 1f             	xor    $0x1f,%ebp
40001256:	75 48                	jne    400012a0 <__umoddi3+0xa0>
40001258:	39 d8                	cmp    %ebx,%eax
4000125a:	0f 82 d0 00 00 00    	jb     40001330 <__umoddi3+0x130>
40001260:	39 fe                	cmp    %edi,%esi
40001262:	0f 83 c8 00 00 00    	jae    40001330 <__umoddi3+0x130>
40001268:	89 c8                	mov    %ecx,%eax
4000126a:	83 c4 1c             	add    $0x1c,%esp
4000126d:	5b                   	pop    %ebx
4000126e:	5e                   	pop    %esi
4000126f:	5f                   	pop    %edi
40001270:	5d                   	pop    %ebp
40001271:	c3                   	ret
40001272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001278:	89 f9                	mov    %edi,%ecx
4000127a:	85 ff                	test   %edi,%edi
4000127c:	75 0b                	jne    40001289 <__umoddi3+0x89>
4000127e:	b8 01 00 00 00       	mov    $0x1,%eax
40001283:	31 d2                	xor    %edx,%edx
40001285:	f7 f7                	div    %edi
40001287:	89 c1                	mov    %eax,%ecx
40001289:	89 d8                	mov    %ebx,%eax
4000128b:	31 d2                	xor    %edx,%edx
4000128d:	f7 f1                	div    %ecx
4000128f:	89 f0                	mov    %esi,%eax
40001291:	f7 f1                	div    %ecx
40001293:	89 d0                	mov    %edx,%eax
40001295:	31 d2                	xor    %edx,%edx
40001297:	eb 94                	jmp    4000122d <__umoddi3+0x2d>
40001299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400012a0:	89 e9                	mov    %ebp,%ecx
400012a2:	ba 20 00 00 00       	mov    $0x20,%edx
400012a7:	29 ea                	sub    %ebp,%edx
400012a9:	d3 e0                	shl    %cl,%eax
400012ab:	89 44 24 08          	mov    %eax,0x8(%esp)
400012af:	89 d1                	mov    %edx,%ecx
400012b1:	89 f8                	mov    %edi,%eax
400012b3:	d3 e8                	shr    %cl,%eax
400012b5:	89 54 24 04          	mov    %edx,0x4(%esp)
400012b9:	8b 54 24 04          	mov    0x4(%esp),%edx
400012bd:	89 c1                	mov    %eax,%ecx
400012bf:	8b 44 24 08          	mov    0x8(%esp),%eax
400012c3:	09 c1                	or     %eax,%ecx
400012c5:	89 d8                	mov    %ebx,%eax
400012c7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400012cb:	89 e9                	mov    %ebp,%ecx
400012cd:	d3 e7                	shl    %cl,%edi
400012cf:	89 d1                	mov    %edx,%ecx
400012d1:	d3 e8                	shr    %cl,%eax
400012d3:	89 e9                	mov    %ebp,%ecx
400012d5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
400012d9:	d3 e3                	shl    %cl,%ebx
400012db:	89 c7                	mov    %eax,%edi
400012dd:	89 d1                	mov    %edx,%ecx
400012df:	89 f0                	mov    %esi,%eax
400012e1:	d3 e8                	shr    %cl,%eax
400012e3:	89 fa                	mov    %edi,%edx
400012e5:	89 e9                	mov    %ebp,%ecx
400012e7:	09 d8                	or     %ebx,%eax
400012e9:	d3 e6                	shl    %cl,%esi
400012eb:	f7 74 24 08          	divl   0x8(%esp)
400012ef:	89 d3                	mov    %edx,%ebx
400012f1:	f7 64 24 0c          	mull   0xc(%esp)
400012f5:	89 c7                	mov    %eax,%edi
400012f7:	89 d1                	mov    %edx,%ecx
400012f9:	39 d3                	cmp    %edx,%ebx
400012fb:	72 06                	jb     40001303 <__umoddi3+0x103>
400012fd:	75 10                	jne    4000130f <__umoddi3+0x10f>
400012ff:	39 c6                	cmp    %eax,%esi
40001301:	73 0c                	jae    4000130f <__umoddi3+0x10f>
40001303:	2b 44 24 0c          	sub    0xc(%esp),%eax
40001307:	1b 54 24 08          	sbb    0x8(%esp),%edx
4000130b:	89 d1                	mov    %edx,%ecx
4000130d:	89 c7                	mov    %eax,%edi
4000130f:	89 f2                	mov    %esi,%edx
40001311:	29 fa                	sub    %edi,%edx
40001313:	19 cb                	sbb    %ecx,%ebx
40001315:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
4000131a:	89 d8                	mov    %ebx,%eax
4000131c:	d3 e0                	shl    %cl,%eax
4000131e:	89 e9                	mov    %ebp,%ecx
40001320:	d3 ea                	shr    %cl,%edx
40001322:	d3 eb                	shr    %cl,%ebx
40001324:	09 d0                	or     %edx,%eax
40001326:	89 da                	mov    %ebx,%edx
40001328:	83 c4 1c             	add    $0x1c,%esp
4000132b:	5b                   	pop    %ebx
4000132c:	5e                   	pop    %esi
4000132d:	5f                   	pop    %edi
4000132e:	5d                   	pop    %ebp
4000132f:	c3                   	ret
40001330:	89 da                	mov    %ebx,%edx
40001332:	89 f1                	mov    %esi,%ecx
40001334:	29 f9                	sub    %edi,%ecx
40001336:	19 c2                	sbb    %eax,%edx
40001338:	89 c8                	mov    %ecx,%eax
4000133a:	e9 2b ff ff ff       	jmp    4000126a <__umoddi3+0x6a>
