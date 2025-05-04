
obj/user/fstest/fstest:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:

    printf("=====bigdir ok=====\n\n");
}

int main(int argc, char *argv[])
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	57                   	push   %edi
4000000e:	56                   	push   %esi
4000000f:	e8 d8 33 00 00       	call   400033ec <__x86.get_pc_thunk.si>
40000014:	81 c6 e0 7f 00 00    	add    $0x7fe0,%esi
4000001a:	53                   	push   %ebx
4000001b:	51                   	push   %ecx
4000001c:	83 ec 14             	sub    $0x14,%esp
    printf("*******usertests starting*******\n\n");
4000001f:	8d 86 74 d0 ff ff    	lea    -0x2f8c(%esi),%eax
40000025:	89 f3                	mov    %esi,%ebx

static gcc_inline int sys_open(char *path, int omode)
{
    int errno;
    int fd;
    int len = strlen(path) + 1;
40000027:	8d be 67 ca ff ff    	lea    -0x3599(%esi),%edi
4000002d:	50                   	push   %eax
4000002e:	e8 3d 03 00 00       	call   40000370 <printf>

    printf("=====test file usertests.ran does not exists=====\n");
40000033:	8d 86 98 d0 ff ff    	lea    -0x2f68(%esi),%eax
40000039:	89 04 24             	mov    %eax,(%esp)
4000003c:	e8 2f 03 00 00       	call   40000370 <printf>
40000041:	89 3c 24             	mov    %edi,(%esp)
40000044:	e8 87 0b 00 00       	call   40000bd0 <strlen>

    asm volatile ("int %2"
40000049:	31 c9                	xor    %ecx,%ecx
4000004b:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000004d:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40000050:	b8 04 00 00 00       	mov    $0x4,%eax
40000055:	cd 30                	int    $0x30

    if (open("usertests.ran", O_RDONLY) >= 0) {
40000057:	83 c4 10             	add    $0x10,%esp
4000005a:	85 db                	test   %ebx,%ebx
4000005c:	78 08                	js     40000066 <main+0x66>
4000005e:	85 c0                	test   %eax,%eax
40000060:	0f 84 9c 00 00 00    	je     40000102 <main+0x102>
        printf("already ran user tests (file usertests.ran exists) "
               "-- recreate certikos_disk.img\n");
        exit(1);
    }
    printf("=====test file usertests.ran does not exists: ok\n\n");
40000066:	83 ec 0c             	sub    $0xc,%esp
40000069:	8d 86 20 d1 ff ff    	lea    -0x2ee0(%esi),%eax
4000006f:	89 f3                	mov    %esi,%ebx
40000071:	50                   	push   %eax
40000072:	e8 f9 02 00 00       	call   40000370 <printf>
    int len = strlen(path) + 1;
40000077:	89 3c 24             	mov    %edi,(%esp)
4000007a:	e8 51 0b 00 00       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000007f:	b9 00 02 00 00       	mov    $0x200,%ecx
40000084:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40000086:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40000089:	b8 04 00 00 00       	mov    $0x4,%eax
4000008e:	cd 30                	int    $0x30
                    "b" (path),
                    "c" (omode),
                    "d" (len)
                  : "cc", "memory");

    return errno ? -1 : fd;
40000090:	83 c4 10             	add    $0x10,%esp
40000093:	85 c0                	test   %eax,%eax
40000095:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
4000009a:	0f 45 d8             	cmovne %eax,%ebx
    asm volatile ("int %2"
4000009d:	b8 05 00 00 00       	mov    $0x5,%eax
400000a2:	cd 30                	int    $0x30
    close(open("usertests.ran", O_CREATE));

    smallfile();
400000a4:	e8 f7 0f 00 00       	call   400010a0 <smallfile>
    linktest();
    unlinkread();
    dirfile();
    iref();
    bigdir();  // slow
    printf("*******end of tests*******\n");
400000a9:	89 f3                	mov    %esi,%ebx
    bigfile1();
400000ab:	e8 50 12 00 00       	call   40001300 <bigfile1>
    createtest();
400000b0:	e8 9b 14 00 00       	call   40001550 <createtest>
    rmdot();
400000b5:	e8 96 15 00 00       	call   40001650 <rmdot>
    fourteen();
400000ba:	e8 d1 17 00 00       	call   40001890 <fourteen>
    bigfile2();
400000bf:	e8 bc 19 00 00       	call   40001a80 <bigfile2>
    subdir();
400000c4:	e8 57 1c 00 00       	call   40001d20 <subdir>
    linktest();
400000c9:	e8 a2 26 00 00       	call   40002770 <linktest>
    unlinkread();
400000ce:	e8 fd 29 00 00       	call   40002ad0 <unlinkread>
    dirfile();
400000d3:	e8 48 2c 00 00       	call   40002d20 <dirfile>
    iref();
400000d8:	e8 43 2f 00 00       	call   40003020 <iref>
    bigdir();  // slow
400000dd:	e8 1e 31 00 00       	call   40003200 <bigdir>
    printf("*******end of tests*******\n");
400000e2:	83 ec 0c             	sub    $0xc,%esp
400000e5:	8d 86 75 ca ff ff    	lea    -0x358b(%esi),%eax
400000eb:	50                   	push   %eax
400000ec:	e8 7f 02 00 00       	call   40000370 <printf>
    return 0;
400000f1:	83 c4 10             	add    $0x10,%esp
400000f4:	31 c0                	xor    %eax,%eax
}
400000f6:	8d 65 f0             	lea    -0x10(%ebp),%esp
400000f9:	59                   	pop    %ecx
400000fa:	5b                   	pop    %ebx
400000fb:	5e                   	pop    %esi
400000fc:	5f                   	pop    %edi
400000fd:	5d                   	pop    %ebp
400000fe:	8d 61 fc             	lea    -0x4(%ecx),%esp
40000101:	c3                   	ret
        printf("already ran user tests (file usertests.ran exists) "
40000102:	83 ec 0c             	sub    $0xc,%esp
40000105:	8d 86 cc d0 ff ff    	lea    -0x2f34(%esi),%eax
4000010b:	89 f3                	mov    %esi,%ebx
4000010d:	50                   	push   %eax
4000010e:	e8 5d 02 00 00       	call   40000370 <printf>
        exit(1);
40000113:	83 c4 10             	add    $0x10,%esp
40000116:	b8 01 00 00 00       	mov    $0x1,%eax
4000011b:	eb d9                	jmp    400000f6 <main+0xf6>

4000011d <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
4000011d:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
40000123:	75 04                	jne    40000129 <args_exist>

40000125 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
40000125:	6a 00                	push   $0x0
	pushl	$0
40000127:	6a 00                	push   $0x0

40000129 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
40000129:	e8 d2 fe ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
4000012e:	50                   	push   %eax

4000012f <spin>:
spin:
	jmp	spin
4000012f:	eb fe                	jmp    4000012f <spin>
40000131:	66 90                	xchg   %ax,%ax
40000133:	66 90                	xchg   %ax,%ax
40000135:	66 90                	xchg   %ax,%ax
40000137:	66 90                	xchg   %ax,%ax
40000139:	66 90                	xchg   %ax,%ax
4000013b:	66 90                	xchg   %ax,%ax
4000013d:	66 90                	xchg   %ax,%ax
4000013f:	90                   	nop

40000140 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
40000140:	53                   	push   %ebx
40000141:	e8 c1 00 00 00       	call   40000207 <__x86.get_pc_thunk.bx>
40000146:	81 c3 ae 7e 00 00    	add    $0x7eae,%ebx
4000014c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
4000014f:	ff 74 24 18          	push   0x18(%esp)
40000153:	ff 74 24 18          	push   0x18(%esp)
40000157:	8d 83 0c c0 ff ff    	lea    -0x3ff4(%ebx),%eax
4000015d:	50                   	push   %eax
4000015e:	e8 0d 02 00 00       	call   40000370 <printf>
    vcprintf(fmt, ap);
40000163:	58                   	pop    %eax
40000164:	5a                   	pop    %edx
40000165:	8d 44 24 24          	lea    0x24(%esp),%eax
40000169:	50                   	push   %eax
4000016a:	ff 74 24 24          	push   0x24(%esp)
4000016e:	e8 9d 01 00 00       	call   40000310 <vcprintf>
    va_end(ap);
}
40000173:	83 c4 18             	add    $0x18,%esp
40000176:	5b                   	pop    %ebx
40000177:	c3                   	ret
40000178:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000017f:	00 

40000180 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000180:	53                   	push   %ebx
40000181:	e8 81 00 00 00       	call   40000207 <__x86.get_pc_thunk.bx>
40000186:	81 c3 6e 7e 00 00    	add    $0x7e6e,%ebx
4000018c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
4000018f:	ff 74 24 18          	push   0x18(%esp)
40000193:	ff 74 24 18          	push   0x18(%esp)
40000197:	8d 83 18 c0 ff ff    	lea    -0x3fe8(%ebx),%eax
4000019d:	50                   	push   %eax
4000019e:	e8 cd 01 00 00       	call   40000370 <printf>
    vcprintf(fmt, ap);
400001a3:	58                   	pop    %eax
400001a4:	5a                   	pop    %edx
400001a5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001a9:	50                   	push   %eax
400001aa:	ff 74 24 24          	push   0x24(%esp)
400001ae:	e8 5d 01 00 00       	call   40000310 <vcprintf>
    va_end(ap);
}
400001b3:	83 c4 18             	add    $0x18,%esp
400001b6:	5b                   	pop    %ebx
400001b7:	c3                   	ret
400001b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001bf:	00 

400001c0 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
400001c0:	53                   	push   %ebx
400001c1:	e8 41 00 00 00       	call   40000207 <__x86.get_pc_thunk.bx>
400001c6:	81 c3 2e 7e 00 00    	add    $0x7e2e,%ebx
400001cc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
400001cf:	ff 74 24 18          	push   0x18(%esp)
400001d3:	ff 74 24 18          	push   0x18(%esp)
400001d7:	8d 83 24 c0 ff ff    	lea    -0x3fdc(%ebx),%eax
400001dd:	50                   	push   %eax
400001de:	e8 8d 01 00 00       	call   40000370 <printf>
    vcprintf(fmt, ap);
400001e3:	58                   	pop    %eax
400001e4:	5a                   	pop    %edx
400001e5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001e9:	50                   	push   %eax
400001ea:	ff 74 24 24          	push   0x24(%esp)
400001ee:	e8 1d 01 00 00       	call   40000310 <vcprintf>
400001f3:	83 c4 10             	add    $0x10,%esp
400001f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001fd:	00 
400001fe:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
40000200:	e8 3b 09 00 00       	call   40000b40 <yield>
    while (1)
40000205:	eb f9                	jmp    40000200 <panic+0x40>

40000207 <__x86.get_pc_thunk.bx>:
40000207:	8b 1c 24             	mov    (%esp),%ebx
4000020a:	c3                   	ret
4000020b:	66 90                	xchg   %ax,%ax
4000020d:	66 90                	xchg   %ax,%ax
4000020f:	90                   	nop

40000210 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
40000210:	55                   	push   %ebp
40000211:	57                   	push   %edi
40000212:	56                   	push   %esi
40000213:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
40000214:	8b 44 24 14          	mov    0x14(%esp),%eax
40000218:	0f b6 00             	movzbl (%eax),%eax
4000021b:	3c 2b                	cmp    $0x2b,%al
4000021d:	0f 84 8d 00 00 00    	je     400002b0 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
40000223:	3c 2d                	cmp    $0x2d,%al
40000225:	74 59                	je     40000280 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000227:	8d 50 d0             	lea    -0x30(%eax),%edx
4000022a:	80 fa 09             	cmp    $0x9,%dl
4000022d:	77 71                	ja     400002a0 <atoi+0x90>
    int negative = 0;
4000022f:	31 ff                	xor    %edi,%edi
    int loc = 0;
40000231:	31 f6                	xor    %esi,%esi
        loc++;
40000233:	89 f2                	mov    %esi,%edx
    int acc = 0;
40000235:	31 c9                	xor    %ecx,%ecx
40000237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000023e:	00 
4000023f:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
40000240:	83 e8 30             	sub    $0x30,%eax
40000243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
40000246:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
40000249:	0f be c0             	movsbl %al,%eax
4000024c:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000024f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000253:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
40000257:	8d 68 d0             	lea    -0x30(%eax),%ebp
4000025a:	89 eb                	mov    %ebp,%ebx
4000025c:	80 fb 09             	cmp    $0x9,%bl
4000025f:	76 df                	jbe    40000240 <atoi+0x30>
    }
    if (numstart == loc) {
40000261:	39 f2                	cmp    %esi,%edx
40000263:	74 3b                	je     400002a0 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
40000265:	89 c8                	mov    %ecx,%eax
40000267:	f7 d8                	neg    %eax
40000269:	85 ff                	test   %edi,%edi
4000026b:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
4000026e:	8b 44 24 18          	mov    0x18(%esp),%eax
40000272:	89 08                	mov    %ecx,(%eax)
    return loc;
}
40000274:	89 d0                	mov    %edx,%eax
40000276:	5b                   	pop    %ebx
40000277:	5e                   	pop    %esi
40000278:	5f                   	pop    %edi
40000279:	5d                   	pop    %ebp
4000027a:	c3                   	ret
4000027b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000280:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
40000284:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000289:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000028e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000292:	8d 50 d0             	lea    -0x30(%eax),%edx
40000295:	80 fa 09             	cmp    $0x9,%dl
40000298:	76 99                	jbe    40000233 <atoi+0x23>
4000029a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
400002a0:	31 d2                	xor    %edx,%edx
}
400002a2:	5b                   	pop    %ebx
400002a3:	89 d0                	mov    %edx,%eax
400002a5:	5e                   	pop    %esi
400002a6:	5f                   	pop    %edi
400002a7:	5d                   	pop    %ebp
400002a8:	c3                   	ret
400002a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002b0:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
400002b4:	31 ff                	xor    %edi,%edi
        loc++;
400002b6:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002bb:	0f b6 40 01          	movzbl 0x1(%eax),%eax
400002bf:	8d 50 d0             	lea    -0x30(%eax),%edx
400002c2:	80 fa 09             	cmp    $0x9,%dl
400002c5:	0f 86 68 ff ff ff    	jbe    40000233 <atoi+0x23>
        return 0;
400002cb:	31 d2                	xor    %edx,%edx
400002cd:	eb d3                	jmp    400002a2 <atoi+0x92>
400002cf:	90                   	nop

400002d0 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
400002d0:	53                   	push   %ebx
400002d1:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
400002d5:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
400002da:	8b 02                	mov    (%edx),%eax
400002dc:	8d 48 01             	lea    0x1(%eax),%ecx
400002df:	89 0a                	mov    %ecx,(%edx)
400002e1:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
400002e5:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
400002eb:	75 14                	jne    40000301 <putch+0x31>
        b->buf[b->idx] = 0;
400002ed:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
400002f4:	8d 5a 08             	lea    0x8(%edx),%ebx
    asm volatile ("int %0"
400002f7:	31 c0                	xor    %eax,%eax
400002f9:	cd 30                	int    $0x30
        b->idx = 0;
400002fb:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
40000301:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
40000305:	5b                   	pop    %ebx
40000306:	c3                   	ret
40000307:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000030e:	00 
4000030f:	90                   	nop

40000310 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
40000310:	53                   	push   %ebx
40000311:	e8 f1 fe ff ff       	call   40000207 <__x86.get_pc_thunk.bx>
40000316:	81 c3 de 7c 00 00    	add    $0x7cde,%ebx
4000031c:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
40000322:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000329:	00 
    b.cnt = 0;
4000032a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000331:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
40000332:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000339:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000340:	8d 44 24 10          	lea    0x10(%esp),%eax
40000344:	50                   	push   %eax
40000345:	8d 83 dc 82 ff ff    	lea    -0x7d24(%ebx),%eax
4000034b:	50                   	push   %eax
4000034c:	e8 3f 01 00 00       	call   40000490 <vprintfmt>

    b.buf[b.idx] = 0;
40000351:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000355:	8d 5c 24 20          	lea    0x20(%esp),%ebx
40000359:	31 c0                	xor    %eax,%eax
4000035b:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
40000360:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
40000362:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000366:	81 c4 28 02 00 00    	add    $0x228,%esp
4000036c:	5b                   	pop    %ebx
4000036d:	c3                   	ret
4000036e:	66 90                	xchg   %ax,%ax

40000370 <printf>:

int printf(const char *fmt, ...)
{
40000370:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
40000373:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000377:	50                   	push   %eax
40000378:	ff 74 24 1c          	push   0x1c(%esp)
4000037c:	e8 8f ff ff ff       	call   40000310 <vcprintf>
    va_end(ap);

    return cnt;
}
40000381:	83 c4 1c             	add    $0x1c,%esp
40000384:	c3                   	ret
40000385:	66 90                	xchg   %ax,%ax
40000387:	66 90                	xchg   %ax,%ax
40000389:	66 90                	xchg   %ax,%ax
4000038b:	66 90                	xchg   %ax,%ax
4000038d:	66 90                	xchg   %ax,%ax
4000038f:	90                   	nop

40000390 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000390:	e8 86 07 00 00       	call   40000b1b <__x86.get_pc_thunk.cx>
40000395:	81 c1 5f 7c 00 00    	add    $0x7c5f,%ecx
{
4000039b:	55                   	push   %ebp
4000039c:	57                   	push   %edi
4000039d:	89 d7                	mov    %edx,%edi
4000039f:	56                   	push   %esi
400003a0:	89 c6                	mov    %eax,%esi
400003a2:	53                   	push   %ebx
400003a3:	83 ec 2c             	sub    $0x2c,%esp
400003a6:	8b 44 24 40          	mov    0x40(%esp),%eax
400003aa:	8b 54 24 44          	mov    0x44(%esp),%edx
400003ae:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
400003b2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
400003b9:	00 
{
400003ba:	8b 6c 24 50          	mov    0x50(%esp),%ebp
400003be:	89 44 24 08          	mov    %eax,0x8(%esp)
400003c2:	8b 44 24 48          	mov    0x48(%esp),%eax
400003c6:	89 54 24 0c          	mov    %edx,0xc(%esp)
400003ca:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
400003ce:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400003d2:	39 44 24 08          	cmp    %eax,0x8(%esp)
400003d6:	89 44 24 10          	mov    %eax,0x10(%esp)
400003da:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
400003de:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
400003e1:	73 55                	jae    40000438 <printnum+0xa8>
        while (--width > 0)
400003e3:	83 fa 01             	cmp    $0x1,%edx
400003e6:	7e 17                	jle    400003ff <printnum+0x6f>
400003e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400003ef:	00 
            putch(padc, putdat);
400003f0:	83 ec 08             	sub    $0x8,%esp
400003f3:	57                   	push   %edi
400003f4:	55                   	push   %ebp
400003f5:	ff d6                	call   *%esi
        while (--width > 0)
400003f7:	83 c4 10             	add    $0x10,%esp
400003fa:	83 eb 01             	sub    $0x1,%ebx
400003fd:	75 f1                	jne    400003f0 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
400003ff:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000403:	ff 74 24 14          	push   0x14(%esp)
40000407:	ff 74 24 14          	push   0x14(%esp)
4000040b:	ff 74 24 14          	push   0x14(%esp)
4000040f:	ff 74 24 14          	push   0x14(%esp)
40000413:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
40000417:	e8 04 31 00 00       	call   40003520 <__umoddi3>
4000041c:	0f be 84 03 30 c0 ff 	movsbl -0x3fd0(%ebx,%eax,1),%eax
40000423:	ff 
40000424:	89 44 24 50          	mov    %eax,0x50(%esp)
}
40000428:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
4000042b:	89 f0                	mov    %esi,%eax
}
4000042d:	5b                   	pop    %ebx
4000042e:	5e                   	pop    %esi
4000042f:	5f                   	pop    %edi
40000430:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
40000431:	ff e0                	jmp    *%eax
40000433:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
40000438:	83 ec 0c             	sub    $0xc,%esp
4000043b:	55                   	push   %ebp
4000043c:	53                   	push   %ebx
4000043d:	50                   	push   %eax
4000043e:	83 ec 08             	sub    $0x8,%esp
40000441:	ff 74 24 34          	push   0x34(%esp)
40000445:	ff 74 24 34          	push   0x34(%esp)
40000449:	ff 74 24 34          	push   0x34(%esp)
4000044d:	ff 74 24 34          	push   0x34(%esp)
40000451:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
40000455:	e8 a6 2f 00 00       	call   40003400 <__udivdi3>
4000045a:	83 c4 18             	add    $0x18,%esp
4000045d:	52                   	push   %edx
4000045e:	89 fa                	mov    %edi,%edx
40000460:	50                   	push   %eax
40000461:	89 f0                	mov    %esi,%eax
40000463:	e8 28 ff ff ff       	call   40000390 <printnum>
40000468:	83 c4 20             	add    $0x20,%esp
4000046b:	eb 92                	jmp    400003ff <printnum+0x6f>
4000046d:	8d 76 00             	lea    0x0(%esi),%esi

40000470 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
40000470:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
40000474:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
40000478:	8b 10                	mov    (%eax),%edx
4000047a:	3b 50 04             	cmp    0x4(%eax),%edx
4000047d:	73 0b                	jae    4000048a <sprintputch+0x1a>
        *b->buf++ = ch;
4000047f:	8d 4a 01             	lea    0x1(%edx),%ecx
40000482:	89 08                	mov    %ecx,(%eax)
40000484:	8b 44 24 04          	mov    0x4(%esp),%eax
40000488:	88 02                	mov    %al,(%edx)
}
4000048a:	c3                   	ret
4000048b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000490 <vprintfmt>:
{
40000490:	e8 7e 06 00 00       	call   40000b13 <__x86.get_pc_thunk.ax>
40000495:	05 5f 7b 00 00       	add    $0x7b5f,%eax
4000049a:	55                   	push   %ebp
4000049b:	57                   	push   %edi
4000049c:	56                   	push   %esi
4000049d:	53                   	push   %ebx
4000049e:	83 ec 2c             	sub    $0x2c,%esp
400004a1:	8b 74 24 40          	mov    0x40(%esp),%esi
400004a5:	8b 7c 24 44          	mov    0x44(%esp),%edi
400004a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
400004ad:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
400004b1:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
400004b5:	8d 5d 01             	lea    0x1(%ebp),%ebx
400004b8:	83 f8 25             	cmp    $0x25,%eax
400004bb:	75 19                	jne    400004d6 <vprintfmt+0x46>
400004bd:	eb 29                	jmp    400004e8 <vprintfmt+0x58>
400004bf:	90                   	nop
            putch(ch, putdat);
400004c0:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
400004c3:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
400004c6:	57                   	push   %edi
400004c7:	50                   	push   %eax
400004c8:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
400004ca:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
400004ce:	83 c4 10             	add    $0x10,%esp
400004d1:	83 f8 25             	cmp    $0x25,%eax
400004d4:	74 12                	je     400004e8 <vprintfmt+0x58>
            if (ch == '\0')
400004d6:	85 c0                	test   %eax,%eax
400004d8:	75 e6                	jne    400004c0 <vprintfmt+0x30>
}
400004da:	83 c4 2c             	add    $0x2c,%esp
400004dd:	5b                   	pop    %ebx
400004de:	5e                   	pop    %esi
400004df:	5f                   	pop    %edi
400004e0:	5d                   	pop    %ebp
400004e1:	c3                   	ret
400004e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
400004e8:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
400004ed:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
400004f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
400004f9:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000500:	ff 
        lflag = 0;
40000501:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
40000508:	00 
40000509:	89 54 24 14          	mov    %edx,0x14(%esp)
4000050d:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000511:	0f b6 0b             	movzbl (%ebx),%ecx
40000514:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000517:	8d 41 dd             	lea    -0x23(%ecx),%eax
4000051a:	3c 55                	cmp    $0x55,%al
4000051c:	77 12                	ja     40000530 <.L21>
4000051e:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000522:	0f b6 c0             	movzbl %al,%eax
40000525:	8b b4 82 a8 ca ff ff 	mov    -0x3558(%edx,%eax,4),%esi
4000052c:	01 d6                	add    %edx,%esi
4000052e:	ff e6                	jmp    *%esi

40000530 <.L21>:
            putch('%', putdat);
40000530:	8b 74 24 40          	mov    0x40(%esp),%esi
40000534:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
40000537:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
40000539:	57                   	push   %edi
4000053a:	6a 25                	push   $0x25
4000053c:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
4000053e:	83 c4 10             	add    $0x10,%esp
40000541:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
40000545:	0f 84 66 ff ff ff    	je     400004b1 <vprintfmt+0x21>
4000054b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000550:	83 ed 01             	sub    $0x1,%ebp
40000553:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
40000557:	75 f7                	jne    40000550 <.L21+0x20>
40000559:	e9 53 ff ff ff       	jmp    400004b1 <vprintfmt+0x21>
4000055e:	66 90                	xchg   %ax,%ax

40000560 <.L31>:
                ch = *fmt;
40000560:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
40000564:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
40000567:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
40000569:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
4000056d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000570:	83 f9 09             	cmp    $0x9,%ecx
40000573:	77 28                	ja     4000059d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
40000575:	8b 74 24 40          	mov    0x40(%esp),%esi
40000579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
40000580:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
40000583:	8d 14 92             	lea    (%edx,%edx,4),%edx
40000586:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
4000058a:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
4000058d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000590:	83 f9 09             	cmp    $0x9,%ecx
40000593:	76 eb                	jbe    40000580 <.L31+0x20>
40000595:	89 54 24 14          	mov    %edx,0x14(%esp)
40000599:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000059d:	8b 74 24 08          	mov    0x8(%esp),%esi
400005a1:	85 f6                	test   %esi,%esi
400005a3:	0f 89 68 ff ff ff    	jns    40000511 <vprintfmt+0x81>
                width = precision, precision = -1;
400005a9:	8b 44 24 14          	mov    0x14(%esp),%eax
400005ad:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
400005b4:	ff 
400005b5:	89 44 24 08          	mov    %eax,0x8(%esp)
400005b9:	e9 53 ff ff ff       	jmp    40000511 <vprintfmt+0x81>

400005be <.L35>:
            altflag = 1;
400005be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400005c5:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
400005c7:	e9 45 ff ff ff       	jmp    40000511 <vprintfmt+0x81>

400005cc <.L34>:
            putch(ch, putdat);
400005cc:	8b 74 24 40          	mov    0x40(%esp),%esi
400005d0:	83 ec 08             	sub    $0x8,%esp
400005d3:	57                   	push   %edi
400005d4:	6a 25                	push   $0x25
400005d6:	ff d6                	call   *%esi
            break;
400005d8:	83 c4 10             	add    $0x10,%esp
400005db:	e9 d1 fe ff ff       	jmp    400004b1 <vprintfmt+0x21>

400005e0 <.L33>:
            precision = va_arg(ap, int);
400005e0:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
400005e4:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
400005e6:	8b 00                	mov    (%eax),%eax
400005e8:	89 44 24 14          	mov    %eax,0x14(%esp)
400005ec:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400005f0:	83 c0 04             	add    $0x4,%eax
400005f3:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
400005f7:	eb a4                	jmp    4000059d <.L31+0x3d>

400005f9 <.L32>:
            if (width < 0)
400005f9:	8b 4c 24 08          	mov    0x8(%esp),%ecx
400005fd:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
400005ff:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000601:	85 c9                	test   %ecx,%ecx
40000603:	0f 49 c1             	cmovns %ecx,%eax
40000606:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
4000060a:	e9 02 ff ff ff       	jmp    40000511 <vprintfmt+0x81>

4000060f <.L30>:
            putch(va_arg(ap, int), putdat);
4000060f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000613:	8b 74 24 40          	mov    0x40(%esp),%esi
40000617:	83 ec 08             	sub    $0x8,%esp
4000061a:	57                   	push   %edi
4000061b:	8d 58 04             	lea    0x4(%eax),%ebx
4000061e:	8b 44 24 58          	mov    0x58(%esp),%eax
40000622:	ff 30                	push   (%eax)
40000624:	ff d6                	call   *%esi
40000626:	89 5c 24 5c          	mov    %ebx,0x5c(%esp)
            break;
4000062a:	83 c4 10             	add    $0x10,%esp
4000062d:	e9 7f fe ff ff       	jmp    400004b1 <vprintfmt+0x21>

40000632 <.L24>:
    if (lflag >= 2)
40000632:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000637:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
4000063b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000063f:	0f 8f d8 01 00 00    	jg     4000081d <.L25+0xe0>
        return va_arg(*ap, unsigned long);
40000645:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000649:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
4000064c:	31 db                	xor    %ebx,%ebx
4000064e:	ba 0a 00 00 00       	mov    $0xa,%edx
40000653:	8b 09                	mov    (%ecx),%ecx
40000655:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
40000660:	83 ec 0c             	sub    $0xc,%esp
40000663:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
40000668:	50                   	push   %eax
40000669:	89 f0                	mov    %esi,%eax
4000066b:	ff 74 24 18          	push   0x18(%esp)
4000066f:	52                   	push   %edx
40000670:	89 fa                	mov    %edi,%edx
40000672:	53                   	push   %ebx
40000673:	51                   	push   %ecx
40000674:	e8 17 fd ff ff       	call   40000390 <printnum>
            break;
40000679:	83 c4 20             	add    $0x20,%esp
4000067c:	e9 30 fe ff ff       	jmp    400004b1 <vprintfmt+0x21>

40000681 <.L26>:
            putch('0', putdat);
40000681:	8b 74 24 40          	mov    0x40(%esp),%esi
40000685:	83 ec 08             	sub    $0x8,%esp
40000688:	57                   	push   %edi
40000689:	6a 30                	push   $0x30
4000068b:	ff d6                	call   *%esi
            putch('x', putdat);
4000068d:	59                   	pop    %ecx
4000068e:	5b                   	pop    %ebx
4000068f:	57                   	push   %edi
40000690:	6a 78                	push   $0x78
            num = (unsigned long long)
40000692:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000694:	ff d6                	call   *%esi
            num = (unsigned long long)
40000696:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000069a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000069f:	8b 08                	mov    (%eax),%ecx
            goto number;
400006a1:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
400006a4:	83 c0 04             	add    $0x4,%eax
400006a7:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
400006ab:	eb b3                	jmp    40000660 <.L24+0x2e>

400006ad <.L22>:
    if (lflag >= 2)
400006ad:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006b2:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400006b6:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006ba:	0f 8f 6e 01 00 00    	jg     4000082e <.L25+0xf1>
        return va_arg(*ap, unsigned long);
400006c0:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400006c4:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400006c7:	31 db                	xor    %ebx,%ebx
400006c9:	ba 10 00 00 00       	mov    $0x10,%edx
400006ce:	8b 09                	mov    (%ecx),%ecx
400006d0:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400006d4:	eb 8a                	jmp    40000660 <.L24+0x2e>

400006d6 <.L29>:
    if (lflag >= 2)
400006d6:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006db:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
400006df:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006e3:	0f 8f 5b 01 00 00    	jg     40000844 <.L25+0x107>
        return va_arg(*ap, long);
400006e9:	8b 00                	mov    (%eax),%eax
400006eb:	89 c3                	mov    %eax,%ebx
400006ed:	89 c1                	mov    %eax,%ecx
400006ef:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006f3:	c1 fb 1f             	sar    $0x1f,%ebx
400006f6:	83 c0 04             	add    $0x4,%eax
400006f9:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
400006fd:	85 db                	test   %ebx,%ebx
400006ff:	0f 88 68 01 00 00    	js     4000086d <.L19+0xc>
        return va_arg(*ap, unsigned long long);
40000705:	ba 0a 00 00 00       	mov    $0xa,%edx
4000070a:	e9 51 ff ff ff       	jmp    40000660 <.L24+0x2e>

4000070f <.L28>:
            lflag++;
4000070f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000714:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000716:	e9 f6 fd ff ff       	jmp    40000511 <vprintfmt+0x81>

4000071b <.L27>:
            putch('X', putdat);
4000071b:	8b 74 24 40          	mov    0x40(%esp),%esi
4000071f:	83 ec 08             	sub    $0x8,%esp
40000722:	57                   	push   %edi
40000723:	6a 58                	push   $0x58
40000725:	ff d6                	call   *%esi
            putch('X', putdat);
40000727:	58                   	pop    %eax
40000728:	5a                   	pop    %edx
40000729:	57                   	push   %edi
4000072a:	6a 58                	push   $0x58
4000072c:	ff d6                	call   *%esi
            putch('X', putdat);
4000072e:	59                   	pop    %ecx
4000072f:	5b                   	pop    %ebx
40000730:	57                   	push   %edi
40000731:	6a 58                	push   $0x58
40000733:	ff d6                	call   *%esi
            break;
40000735:	83 c4 10             	add    $0x10,%esp
40000738:	e9 74 fd ff ff       	jmp    400004b1 <vprintfmt+0x21>

4000073d <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
4000073d:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
40000741:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
40000745:	8b 54 24 14          	mov    0x14(%esp),%edx
40000749:	8b 74 24 40          	mov    0x40(%esp),%esi
4000074d:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
40000750:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
40000755:	89 44 24 14          	mov    %eax,0x14(%esp)
40000759:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000075d:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
4000075f:	0f 95 c0             	setne  %al
40000762:	85 c9                	test   %ecx,%ecx
40000764:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
40000767:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
4000076b:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
4000076d:	85 db                	test   %ebx,%ebx
4000076f:	0f 84 21 01 00 00    	je     40000896 <.L19+0x35>
            if (width > 0 && padc != '-')
40000775:	84 c0                	test   %al,%al
40000777:	0f 85 48 01 00 00    	jne    400008c5 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
4000077d:	89 d8                	mov    %ebx,%eax
4000077f:	8d 5b 01             	lea    0x1(%ebx),%ebx
40000782:	0f be 08             	movsbl (%eax),%ecx
40000785:	89 c8                	mov    %ecx,%eax
40000787:	85 c9                	test   %ecx,%ecx
40000789:	74 64                	je     400007ef <.L25+0xb2>
4000078b:	89 74 24 40          	mov    %esi,0x40(%esp)
4000078f:	89 d6                	mov    %edx,%esi
40000791:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000795:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000799:	eb 2a                	jmp    400007c5 <.L25+0x88>
4000079b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
400007a0:	83 e8 20             	sub    $0x20,%eax
400007a3:	83 f8 5e             	cmp    $0x5e,%eax
400007a6:	76 2d                	jbe    400007d5 <.L25+0x98>
                    putch('?', putdat);
400007a8:	83 ec 08             	sub    $0x8,%esp
400007ab:	57                   	push   %edi
400007ac:	6a 3f                	push   $0x3f
400007ae:	ff 54 24 50          	call   *0x50(%esp)
400007b2:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
400007b5:	0f be 03             	movsbl (%ebx),%eax
400007b8:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
400007bb:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
400007be:	0f be c8             	movsbl %al,%ecx
400007c1:	85 c9                	test   %ecx,%ecx
400007c3:	74 1e                	je     400007e3 <.L25+0xa6>
400007c5:	85 f6                	test   %esi,%esi
400007c7:	78 05                	js     400007ce <.L25+0x91>
                                         || --precision >= 0); width--)
400007c9:	83 ee 01             	sub    $0x1,%esi
400007cc:	72 15                	jb     400007e3 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
400007ce:	8b 14 24             	mov    (%esp),%edx
400007d1:	85 d2                	test   %edx,%edx
400007d3:	75 cb                	jne    400007a0 <.L25+0x63>
                    putch(ch, putdat);
400007d5:	83 ec 08             	sub    $0x8,%esp
400007d8:	57                   	push   %edi
400007d9:	51                   	push   %ecx
400007da:	ff 54 24 50          	call   *0x50(%esp)
400007de:	83 c4 10             	add    $0x10,%esp
400007e1:	eb d2                	jmp    400007b5 <.L25+0x78>
400007e3:	89 6c 24 08          	mov    %ebp,0x8(%esp)
400007e7:	8b 74 24 40          	mov    0x40(%esp),%esi
400007eb:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
400007ef:	8b 44 24 08          	mov    0x8(%esp),%eax
400007f3:	85 c0                	test   %eax,%eax
400007f5:	7e 19                	jle    40000810 <.L25+0xd3>
400007f7:	89 c3                	mov    %eax,%ebx
400007f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
40000800:	83 ec 08             	sub    $0x8,%esp
40000803:	57                   	push   %edi
40000804:	6a 20                	push   $0x20
40000806:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000808:	83 c4 10             	add    $0x10,%esp
4000080b:	83 eb 01             	sub    $0x1,%ebx
4000080e:	75 f0                	jne    40000800 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
40000810:	8b 44 24 14          	mov    0x14(%esp),%eax
40000814:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000818:	e9 94 fc ff ff       	jmp    400004b1 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
4000081d:	8b 08                	mov    (%eax),%ecx
4000081f:	8b 58 04             	mov    0x4(%eax),%ebx
40000822:	83 c0 08             	add    $0x8,%eax
40000825:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000829:	e9 d7 fe ff ff       	jmp    40000705 <.L29+0x2f>
4000082e:	8b 08                	mov    (%eax),%ecx
40000830:	8b 58 04             	mov    0x4(%eax),%ebx
40000833:	83 c0 08             	add    $0x8,%eax
40000836:	ba 10 00 00 00       	mov    $0x10,%edx
4000083b:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000083f:	e9 1c fe ff ff       	jmp    40000660 <.L24+0x2e>
        return va_arg(*ap, long long);
40000844:	8b 08                	mov    (%eax),%ecx
40000846:	8b 58 04             	mov    0x4(%eax),%ebx
40000849:	83 c0 08             	add    $0x8,%eax
4000084c:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000850:	e9 a8 fe ff ff       	jmp    400006fd <.L29+0x27>

40000855 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
40000855:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
4000085a:	89 eb                	mov    %ebp,%ebx
4000085c:	e9 b0 fc ff ff       	jmp    40000511 <vprintfmt+0x81>

40000861 <.L19>:
            padc = '-';
40000861:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000866:	89 eb                	mov    %ebp,%ebx
40000868:	e9 a4 fc ff ff       	jmp    40000511 <vprintfmt+0x81>
4000086d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
40000871:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
40000874:	31 db                	xor    %ebx,%ebx
40000876:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
4000087a:	57                   	push   %edi
4000087b:	6a 2d                	push   $0x2d
4000087d:	ff d6                	call   *%esi
                num = -(long long) num;
4000087f:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000883:	ba 0a 00 00 00       	mov    $0xa,%edx
40000888:	f7 d9                	neg    %ecx
4000088a:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
4000088e:	83 c4 10             	add    $0x10,%esp
40000891:	e9 ca fd ff ff       	jmp    40000660 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000896:	84 c0                	test   %al,%al
40000898:	0f 85 99 00 00 00    	jne    40000937 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000089e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
400008a2:	89 74 24 40          	mov    %esi,0x40(%esp)
400008a6:	b9 28 00 00 00       	mov    $0x28,%ecx
400008ab:	89 d6                	mov    %edx,%esi
400008ad:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400008b1:	b8 28 00 00 00       	mov    $0x28,%eax
400008b6:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400008ba:	8d 9b 42 c0 ff ff    	lea    -0x3fbe(%ebx),%ebx
400008c0:	e9 00 ff ff ff       	jmp    400007c5 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
400008c5:	83 ec 08             	sub    $0x8,%esp
400008c8:	52                   	push   %edx
400008c9:	89 54 24 28          	mov    %edx,0x28(%esp)
400008cd:	ff 74 24 24          	push   0x24(%esp)
400008d1:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400008d5:	e8 26 03 00 00       	call   40000c00 <strnlen>
400008da:	29 44 24 18          	sub    %eax,0x18(%esp)
400008de:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400008e2:	83 c4 10             	add    $0x10,%esp
400008e5:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400008e9:	85 c9                	test   %ecx,%ecx
400008eb:	0f 8e 99 00 00 00    	jle    4000098a <.L19+0x129>
                    putch(padc, putdat);
400008f1:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
400008f6:	89 54 24 10          	mov    %edx,0x10(%esp)
400008fa:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400008fe:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000902:	83 ec 08             	sub    $0x8,%esp
40000905:	57                   	push   %edi
40000906:	53                   	push   %ebx
40000907:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
40000909:	83 c4 10             	add    $0x10,%esp
4000090c:	83 ed 01             	sub    $0x1,%ebp
4000090f:	75 f1                	jne    40000902 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
40000911:	8b 44 24 18          	mov    0x18(%esp),%eax
40000915:	8b 54 24 10          	mov    0x10(%esp),%edx
40000919:	89 6c 24 08          	mov    %ebp,0x8(%esp)
4000091d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000921:	8d 58 01             	lea    0x1(%eax),%ebx
40000924:	0f be 00             	movsbl (%eax),%eax
40000927:	0f be c8             	movsbl %al,%ecx
4000092a:	85 c9                	test   %ecx,%ecx
4000092c:	0f 85 59 fe ff ff    	jne    4000078b <.L25+0x4e>
40000932:	e9 d9 fe ff ff       	jmp    40000810 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
40000937:	83 ec 08             	sub    $0x8,%esp
4000093a:	52                   	push   %edx
4000093b:	8b 5c 24 18          	mov    0x18(%esp),%ebx
4000093f:	8d 8b 41 c0 ff ff    	lea    -0x3fbf(%ebx),%ecx
40000945:	89 54 24 28          	mov    %edx,0x28(%esp)
40000949:	51                   	push   %ecx
4000094a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
4000094e:	e8 ad 02 00 00       	call   40000c00 <strnlen>
40000953:	29 44 24 18          	sub    %eax,0x18(%esp)
40000957:	8b 44 24 18          	mov    0x18(%esp),%eax
4000095b:	83 c4 10             	add    $0x10,%esp
4000095e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000962:	85 c0                	test   %eax,%eax
40000964:	7f 8b                	jg     400008f1 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
40000966:	b9 28 00 00 00       	mov    $0x28,%ecx
4000096b:	b8 28 00 00 00       	mov    $0x28,%eax
40000970:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000974:	89 74 24 40          	mov    %esi,0x40(%esp)
40000978:	89 d6                	mov    %edx,%esi
4000097a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000097e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000982:	83 c3 01             	add    $0x1,%ebx
40000985:	e9 3b fe ff ff       	jmp    400007c5 <.L25+0x88>
4000098a:	8b 44 24 18          	mov    0x18(%esp),%eax
4000098e:	0f be 08             	movsbl (%eax),%ecx
40000991:	89 c8                	mov    %ecx,%eax
40000993:	85 c9                	test   %ecx,%ecx
40000995:	75 d9                	jne    40000970 <.L19+0x10f>
40000997:	e9 74 fe ff ff       	jmp    40000810 <.L25+0xd3>
4000099c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

400009a0 <printfmt>:
{
400009a0:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
400009a3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400009a7:	50                   	push   %eax
400009a8:	ff 74 24 1c          	push   0x1c(%esp)
400009ac:	ff 74 24 1c          	push   0x1c(%esp)
400009b0:	ff 74 24 1c          	push   0x1c(%esp)
400009b4:	e8 d7 fa ff ff       	call   40000490 <vprintfmt>
}
400009b9:	83 c4 1c             	add    $0x1c,%esp
400009bc:	c3                   	ret
400009bd:	8d 76 00             	lea    0x0(%esi),%esi

400009c0 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400009c0:	e8 4e 01 00 00       	call   40000b13 <__x86.get_pc_thunk.ax>
400009c5:	05 2f 76 00 00       	add    $0x762f,%eax
{
400009ca:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400009cd:	8b 54 24 20          	mov    0x20(%esp),%edx
400009d1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400009d8:	ff 
400009d9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009e0:	00 
400009e1:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
400009e5:	ff 74 24 28          	push   0x28(%esp)
400009e9:	ff 74 24 28          	push   0x28(%esp)
400009ed:	8d 80 7c 84 ff ff    	lea    -0x7b84(%eax),%eax
400009f3:	8d 54 24 0c          	lea    0xc(%esp),%edx
400009f7:	52                   	push   %edx
400009f8:	50                   	push   %eax
400009f9:	e8 92 fa ff ff       	call   40000490 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
400009fe:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a02:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a05:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a09:	83 c4 2c             	add    $0x2c,%esp
40000a0c:	c3                   	ret
40000a0d:	8d 76 00             	lea    0x0(%esi),%esi

40000a10 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a10:	e8 fe 00 00 00       	call   40000b13 <__x86.get_pc_thunk.ax>
40000a15:	05 df 75 00 00       	add    $0x75df,%eax
{
40000a1a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a1d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a21:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a28:	ff 
40000a29:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a30:	00 
40000a31:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a35:	8d 54 24 28          	lea    0x28(%esp),%edx
40000a39:	52                   	push   %edx
40000a3a:	ff 74 24 28          	push   0x28(%esp)
40000a3e:	8d 80 7c 84 ff ff    	lea    -0x7b84(%eax),%eax
40000a44:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a48:	52                   	push   %edx
40000a49:	50                   	push   %eax
40000a4a:	e8 41 fa ff ff       	call   40000490 <vprintfmt>
    *b.buf = '\0';
40000a4f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a53:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
40000a56:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a5a:	83 c4 2c             	add    $0x2c,%esp
40000a5d:	c3                   	ret
40000a5e:	66 90                	xchg   %ax,%ax

40000a60 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a60:	e8 b2 00 00 00       	call   40000b17 <__x86.get_pc_thunk.dx>
40000a65:	81 c2 8f 75 00 00    	add    $0x758f,%edx
{
40000a6b:	83 ec 1c             	sub    $0x1c,%esp
40000a6e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a72:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000a76:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a7d:	00 
40000a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000a82:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000a86:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a8a:	ff 74 24 2c          	push   0x2c(%esp)
40000a8e:	ff 74 24 2c          	push   0x2c(%esp)
40000a92:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a96:	50                   	push   %eax
40000a97:	8d 82 7c 84 ff ff    	lea    -0x7b84(%edx),%eax
40000a9d:	50                   	push   %eax
40000a9e:	e8 ed f9 ff ff       	call   40000490 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000aa3:	8b 44 24 14          	mov    0x14(%esp),%eax
40000aa7:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000aaa:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000aae:	83 c4 2c             	add    $0x2c,%esp
40000ab1:	c3                   	ret
40000ab2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ab9:	00 
40000aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000ac0 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000ac0:	e8 52 00 00 00       	call   40000b17 <__x86.get_pc_thunk.dx>
40000ac5:	81 c2 2f 75 00 00    	add    $0x752f,%edx
{
40000acb:	83 ec 1c             	sub    $0x1c,%esp
40000ace:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000ad2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000ad6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000add:	00 
40000ade:	89 44 24 04          	mov    %eax,0x4(%esp)
40000ae2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000ae6:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000aea:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000aee:	50                   	push   %eax
40000aef:	ff 74 24 2c          	push   0x2c(%esp)
40000af3:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000af7:	50                   	push   %eax
40000af8:	8d 82 7c 84 ff ff    	lea    -0x7b84(%edx),%eax
40000afe:	50                   	push   %eax
40000aff:	e8 8c f9 ff ff       	call   40000490 <vprintfmt>
    *b.buf = '\0';
40000b04:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b08:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000b0b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b0f:	83 c4 2c             	add    $0x2c,%esp
40000b12:	c3                   	ret

40000b13 <__x86.get_pc_thunk.ax>:
40000b13:	8b 04 24             	mov    (%esp),%eax
40000b16:	c3                   	ret

40000b17 <__x86.get_pc_thunk.dx>:
40000b17:	8b 14 24             	mov    (%esp),%edx
40000b1a:	c3                   	ret

40000b1b <__x86.get_pc_thunk.cx>:
40000b1b:	8b 0c 24             	mov    (%esp),%ecx
40000b1e:	c3                   	ret
40000b1f:	90                   	nop

40000b20 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000b20:	53                   	push   %ebx
    asm volatile ("int %2"
40000b21:	b8 02 00 00 00       	mov    $0x2,%eax
40000b26:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000b2a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000b2e:	cd 30                	int    $0x30
    return errno ? -1 : pid;
40000b30:	85 c0                	test   %eax,%eax
40000b32:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000b37:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000b3a:	5b                   	pop    %ebx
40000b3b:	c3                   	ret
40000b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b40 <yield>:
    asm volatile ("int %0"
40000b40:	b8 03 00 00 00       	mov    $0x3,%eax
40000b45:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000b47:	c3                   	ret
40000b48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b4f:	00 

40000b50 <produce>:

void produce(int item)
{
40000b50:	53                   	push   %ebx
}

static gcc_inline void sys_produce(unsigned int item)
{
	int errno; 
    asm volatile ("int %1"
40000b51:	b8 0e 00 00 00       	mov    $0xe,%eax
40000b56:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000b5a:	cd 30                	int    $0x30
    sys_produce(item);
}
40000b5c:	5b                   	pop    %ebx
40000b5d:	c3                   	ret
40000b5e:	66 90                	xchg   %ax,%ax

40000b60 <consume>:

int consume(void)
{
40000b60:	53                   	push   %ebx

static gcc_inline int sys_consume(void)
{
	int errno, item;

    asm volatile ("int %2"
40000b61:	b8 0f 00 00 00       	mov    $0xf,%eax
40000b66:	cd 30                	int    $0x30
    return sys_consume();
40000b68:	89 d8                	mov    %ebx,%eax
40000b6a:	5b                   	pop    %ebx
40000b6b:	c3                   	ret
40000b6c:	66 90                	xchg   %ax,%ax
40000b6e:	66 90                	xchg   %ax,%ax

40000b70 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000b70:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b74:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000b7a:	c3                   	ret
40000b7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000b80 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000b80:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000b84:	b8 01 00 00 00       	mov    $0x1,%eax
40000b89:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b8c:	85 c0                	test   %eax,%eax
40000b8e:	74 13                	je     40000ba3 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000b90:	b9 01 00 00 00       	mov    $0x1,%ecx
40000b95:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000b98:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000b9a:	89 c8                	mov    %ecx,%eax
40000b9c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b9f:	85 c0                	test   %eax,%eax
40000ba1:	75 f5                	jne    40000b98 <spinlock_acquire+0x18>
}
40000ba3:	c3                   	ret
40000ba4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bab:	00 
40000bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000bb0 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000bb0:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000bb4:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000bb6:	84 c0                	test   %al,%al
40000bb8:	74 05                	je     40000bbf <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000bba:	31 c0                	xor    %eax,%eax
40000bbc:	f0 87 02             	lock xchg %eax,(%edx)
}
40000bbf:	c3                   	ret

40000bc0 <spinlock_holding>:
    return *lk;
40000bc0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000bc4:	8b 00                	mov    (%eax),%eax
}
40000bc6:	c3                   	ret
40000bc7:	66 90                	xchg   %ax,%ax
40000bc9:	66 90                	xchg   %ax,%ax
40000bcb:	66 90                	xchg   %ax,%ax
40000bcd:	66 90                	xchg   %ax,%ax
40000bcf:	90                   	nop

40000bd0 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000bd0:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000bd4:	31 c0                	xor    %eax,%eax
40000bd6:	80 3a 00             	cmpb   $0x0,(%edx)
40000bd9:	74 15                	je     40000bf0 <strlen+0x20>
40000bdb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000be0:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000be3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000be7:	75 f7                	jne    40000be0 <strlen+0x10>
40000be9:	c3                   	ret
40000bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000bf0:	c3                   	ret
40000bf1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bf8:	00 
40000bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c00 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000c00:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c04:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c08:	31 c0                	xor    %eax,%eax
40000c0a:	85 d2                	test   %edx,%edx
40000c0c:	75 09                	jne    40000c17 <strnlen+0x17>
40000c0e:	c3                   	ret
40000c0f:	90                   	nop
        n++;
40000c10:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c13:	39 c2                	cmp    %eax,%edx
40000c15:	74 09                	je     40000c20 <strnlen+0x20>
40000c17:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000c1b:	75 f3                	jne    40000c10 <strnlen+0x10>
40000c1d:	c3                   	ret
40000c1e:	66 90                	xchg   %ax,%ax
    return n;
}
40000c20:	c3                   	ret
40000c21:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c28:	00 
40000c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c30 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000c30:	53                   	push   %ebx
40000c31:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000c35:	31 c0                	xor    %eax,%eax
{
40000c37:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000c3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000c40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000c44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000c47:	83 c0 01             	add    $0x1,%eax
40000c4a:	84 d2                	test   %dl,%dl
40000c4c:	75 f2                	jne    40000c40 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000c4e:	89 c8                	mov    %ecx,%eax
40000c50:	5b                   	pop    %ebx
40000c51:	c3                   	ret
40000c52:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c59:	00 
40000c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000c60 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000c60:	56                   	push   %esi
40000c61:	53                   	push   %ebx
40000c62:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000c66:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c6a:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000c6e:	85 db                	test   %ebx,%ebx
40000c70:	74 21                	je     40000c93 <strncpy+0x33>
40000c72:	01 f3                	add    %esi,%ebx
40000c74:	89 f0                	mov    %esi,%eax
40000c76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c7d:	00 
40000c7e:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000c80:	0f b6 0a             	movzbl (%edx),%ecx
40000c83:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000c86:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000c89:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000c8c:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000c8f:	39 c3                	cmp    %eax,%ebx
40000c91:	75 ed                	jne    40000c80 <strncpy+0x20>
    }
    return ret;
}
40000c93:	89 f0                	mov    %esi,%eax
40000c95:	5b                   	pop    %ebx
40000c96:	5e                   	pop    %esi
40000c97:	c3                   	ret
40000c98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c9f:	00 

40000ca0 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000ca0:	56                   	push   %esi
40000ca1:	53                   	push   %ebx
40000ca2:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ca6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000caa:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000cae:	85 c0                	test   %eax,%eax
40000cb0:	74 29                	je     40000cdb <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000cb2:	89 f2                	mov    %esi,%edx
40000cb4:	83 e8 01             	sub    $0x1,%eax
40000cb7:	74 1f                	je     40000cd8 <strlcpy+0x38>
40000cb9:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000cbc:	eb 0f                	jmp    40000ccd <strlcpy+0x2d>
40000cbe:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000cc0:	83 c2 01             	add    $0x1,%edx
40000cc3:	83 c1 01             	add    $0x1,%ecx
40000cc6:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000cc9:	39 da                	cmp    %ebx,%edx
40000ccb:	74 07                	je     40000cd4 <strlcpy+0x34>
40000ccd:	0f b6 01             	movzbl (%ecx),%eax
40000cd0:	84 c0                	test   %al,%al
40000cd2:	75 ec                	jne    40000cc0 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000cd4:	89 d0                	mov    %edx,%eax
40000cd6:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000cd8:	c6 02 00             	movb   $0x0,(%edx)
}
40000cdb:	5b                   	pop    %ebx
40000cdc:	5e                   	pop    %esi
40000cdd:	c3                   	ret
40000cde:	66 90                	xchg   %ax,%ax

40000ce0 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000ce0:	53                   	push   %ebx
40000ce1:	8b 54 24 08          	mov    0x8(%esp),%edx
40000ce5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000ce9:	0f b6 02             	movzbl (%edx),%eax
40000cec:	84 c0                	test   %al,%al
40000cee:	75 18                	jne    40000d08 <strcmp+0x28>
40000cf0:	eb 30                	jmp    40000d22 <strcmp+0x42>
40000cf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000cf8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000cfc:	83 c2 01             	add    $0x1,%edx
40000cff:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000d02:	84 c0                	test   %al,%al
40000d04:	74 12                	je     40000d18 <strcmp+0x38>
40000d06:	89 d9                	mov    %ebx,%ecx
40000d08:	0f b6 19             	movzbl (%ecx),%ebx
40000d0b:	38 c3                	cmp    %al,%bl
40000d0d:	74 e9                	je     40000cf8 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d0f:	29 d8                	sub    %ebx,%eax
}
40000d11:	5b                   	pop    %ebx
40000d12:	c3                   	ret
40000d13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d18:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000d1c:	31 c0                	xor    %eax,%eax
40000d1e:	29 d8                	sub    %ebx,%eax
}
40000d20:	5b                   	pop    %ebx
40000d21:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d22:	0f b6 19             	movzbl (%ecx),%ebx
40000d25:	31 c0                	xor    %eax,%eax
40000d27:	eb e6                	jmp    40000d0f <strcmp+0x2f>
40000d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000d30 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000d30:	53                   	push   %ebx
40000d31:	8b 54 24 10          	mov    0x10(%esp),%edx
40000d35:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d39:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000d3d:	85 d2                	test   %edx,%edx
40000d3f:	75 16                	jne    40000d57 <strncmp+0x27>
40000d41:	eb 2d                	jmp    40000d70 <strncmp+0x40>
40000d43:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d48:	3a 19                	cmp    (%ecx),%bl
40000d4a:	75 12                	jne    40000d5e <strncmp+0x2e>
        n--, p++, q++;
40000d4c:	83 c0 01             	add    $0x1,%eax
40000d4f:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000d52:	83 ea 01             	sub    $0x1,%edx
40000d55:	74 19                	je     40000d70 <strncmp+0x40>
40000d57:	0f b6 18             	movzbl (%eax),%ebx
40000d5a:	84 db                	test   %bl,%bl
40000d5c:	75 ea                	jne    40000d48 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d5e:	0f b6 00             	movzbl (%eax),%eax
40000d61:	0f b6 11             	movzbl (%ecx),%edx
}
40000d64:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d65:	29 d0                	sub    %edx,%eax
}
40000d67:	c3                   	ret
40000d68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d6f:	00 
        return 0;
40000d70:	31 c0                	xor    %eax,%eax
}
40000d72:	5b                   	pop    %ebx
40000d73:	c3                   	ret
40000d74:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d7b:	00 
40000d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000d80 <strchr>:

char *strchr(const char *s, char c)
{
40000d80:	8b 44 24 04          	mov    0x4(%esp),%eax
40000d84:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000d89:	0f b6 10             	movzbl (%eax),%edx
40000d8c:	84 d2                	test   %dl,%dl
40000d8e:	75 13                	jne    40000da3 <strchr+0x23>
40000d90:	eb 1e                	jmp    40000db0 <strchr+0x30>
40000d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d98:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d9c:	83 c0 01             	add    $0x1,%eax
40000d9f:	84 d2                	test   %dl,%dl
40000da1:	74 0d                	je     40000db0 <strchr+0x30>
        if (*s == c)
40000da3:	38 d1                	cmp    %dl,%cl
40000da5:	75 f1                	jne    40000d98 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000da7:	c3                   	ret
40000da8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000daf:	00 
    return 0;
40000db0:	31 c0                	xor    %eax,%eax
}
40000db2:	c3                   	ret
40000db3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dba:	00 
40000dbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000dc0 <strfind>:

char *strfind(const char *s, char c)
{
40000dc0:	53                   	push   %ebx
40000dc1:	8b 44 24 08          	mov    0x8(%esp),%eax
40000dc5:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000dc9:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000dcc:	38 d3                	cmp    %dl,%bl
40000dce:	74 1f                	je     40000def <strfind+0x2f>
40000dd0:	89 d1                	mov    %edx,%ecx
40000dd2:	84 db                	test   %bl,%bl
40000dd4:	75 0e                	jne    40000de4 <strfind+0x24>
40000dd6:	eb 17                	jmp    40000def <strfind+0x2f>
40000dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ddf:	00 
40000de0:	84 d2                	test   %dl,%dl
40000de2:	74 0b                	je     40000def <strfind+0x2f>
    for (; *s; s++)
40000de4:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000de8:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000deb:	38 ca                	cmp    %cl,%dl
40000ded:	75 f1                	jne    40000de0 <strfind+0x20>
            break;
    return (char *) s;
}
40000def:	5b                   	pop    %ebx
40000df0:	c3                   	ret
40000df1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000df8:	00 
40000df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000e00 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000e00:	55                   	push   %ebp
40000e01:	57                   	push   %edi
40000e02:	56                   	push   %esi
40000e03:	53                   	push   %ebx
40000e04:	8b 54 24 14          	mov    0x14(%esp),%edx
40000e08:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000e0c:	0f b6 02             	movzbl (%edx),%eax
40000e0f:	3c 20                	cmp    $0x20,%al
40000e11:	75 10                	jne    40000e23 <strtol+0x23>
40000e13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e18:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000e1c:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000e1f:	3c 20                	cmp    $0x20,%al
40000e21:	74 f5                	je     40000e18 <strtol+0x18>
40000e23:	3c 09                	cmp    $0x9,%al
40000e25:	74 f1                	je     40000e18 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000e27:	3c 2b                	cmp    $0x2b,%al
40000e29:	0f 84 b1 00 00 00    	je     40000ee0 <strtol+0xe0>
    int neg = 0;
40000e2f:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000e31:	3c 2d                	cmp    $0x2d,%al
40000e33:	0f 84 97 00 00 00    	je     40000ed0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000e39:	0f b6 02             	movzbl (%edx),%eax
40000e3c:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000e43:	ff 
40000e44:	75 1d                	jne    40000e63 <strtol+0x63>
40000e46:	3c 30                	cmp    $0x30,%al
40000e48:	0f 84 a2 00 00 00    	je     40000ef0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000e4e:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000e53:	19 c0                	sbb    %eax,%eax
40000e55:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000e59:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000e5e:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000e63:	31 c9                	xor    %ecx,%ecx
40000e65:	eb 1c                	jmp    40000e83 <strtol+0x83>
40000e67:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e6e:	00 
40000e6f:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000e70:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000e73:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e77:	7d 2a                	jge    40000ea3 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000e79:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000e7e:	83 c2 01             	add    $0x1,%edx
40000e81:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000e83:	0f be 02             	movsbl (%edx),%eax
40000e86:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000e89:	89 eb                	mov    %ebp,%ebx
40000e8b:	80 fb 09             	cmp    $0x9,%bl
40000e8e:	76 e0                	jbe    40000e70 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000e90:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000e93:	89 eb                	mov    %ebp,%ebx
40000e95:	80 fb 19             	cmp    $0x19,%bl
40000e98:	77 26                	ja     40000ec0 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000e9a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000e9d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000ea1:	7c d6                	jl     40000e79 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000ea3:	85 f6                	test   %esi,%esi
40000ea5:	74 02                	je     40000ea9 <strtol+0xa9>
        *endptr = (char *) s;
40000ea7:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000ea9:	89 c8                	mov    %ecx,%eax
}
40000eab:	5b                   	pop    %ebx
40000eac:	5e                   	pop    %esi
    return (neg ? -val : val);
40000ead:	f7 d8                	neg    %eax
40000eaf:	85 ff                	test   %edi,%edi
}
40000eb1:	5f                   	pop    %edi
40000eb2:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000eb3:	0f 45 c8             	cmovne %eax,%ecx
}
40000eb6:	89 c8                	mov    %ecx,%eax
40000eb8:	c3                   	ret
40000eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000ec0:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000ec3:	89 eb                	mov    %ebp,%ebx
40000ec5:	80 fb 19             	cmp    $0x19,%bl
40000ec8:	77 d9                	ja     40000ea3 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000eca:	83 e8 37             	sub    $0x37,%eax
40000ecd:	eb a4                	jmp    40000e73 <strtol+0x73>
40000ecf:	90                   	nop
        s++, neg = 1;
40000ed0:	83 c2 01             	add    $0x1,%edx
40000ed3:	bf 01 00 00 00       	mov    $0x1,%edi
40000ed8:	e9 5c ff ff ff       	jmp    40000e39 <strtol+0x39>
40000edd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000ee0:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000ee3:	31 ff                	xor    %edi,%edi
40000ee5:	e9 4f ff ff ff       	jmp    40000e39 <strtol+0x39>
40000eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000ef0:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000ef4:	74 25                	je     40000f1b <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000ef6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000efa:	85 c0                	test   %eax,%eax
40000efc:	74 0d                	je     40000f0b <strtol+0x10b>
40000efe:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f05:	00 
40000f06:	e9 58 ff ff ff       	jmp    40000e63 <strtol+0x63>
        s++, base = 8;
40000f0b:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000f12:	00 
40000f13:	83 c2 01             	add    $0x1,%edx
40000f16:	e9 48 ff ff ff       	jmp    40000e63 <strtol+0x63>
        s += 2, base = 16;
40000f1b:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f22:	00 
40000f23:	83 c2 02             	add    $0x2,%edx
40000f26:	e9 38 ff ff ff       	jmp    40000e63 <strtol+0x63>
40000f2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f30 <memset>:

void *memset(void *v, int c, size_t n)
{
40000f30:	57                   	push   %edi
40000f31:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000f35:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000f39:	85 c9                	test   %ecx,%ecx
40000f3b:	74 19                	je     40000f56 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000f3d:	89 f8                	mov    %edi,%eax
40000f3f:	09 c8                	or     %ecx,%eax
40000f41:	a8 03                	test   $0x3,%al
40000f43:	75 1b                	jne    40000f60 <memset+0x30>
        c &= 0xFF;
40000f45:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000f4a:	c1 e9 02             	shr    $0x2,%ecx
40000f4d:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000f53:	fc                   	cld
40000f54:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000f56:	89 f8                	mov    %edi,%eax
40000f58:	5f                   	pop    %edi
40000f59:	c3                   	ret
40000f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000f60:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f64:	fc                   	cld
40000f65:	f3 aa                	rep stos %al,%es:(%edi)
}
40000f67:	89 f8                	mov    %edi,%eax
40000f69:	5f                   	pop    %edi
40000f6a:	c3                   	ret
40000f6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f70 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000f70:	57                   	push   %edi
40000f71:	56                   	push   %esi
40000f72:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f76:	8b 74 24 10          	mov    0x10(%esp),%esi
40000f7a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000f7e:	39 c6                	cmp    %eax,%esi
40000f80:	73 26                	jae    40000fa8 <memmove+0x38>
40000f82:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000f85:	39 d0                	cmp    %edx,%eax
40000f87:	73 1f                	jae    40000fa8 <memmove+0x38>
        s += n;
        d += n;
40000f89:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f8c:	89 fe                	mov    %edi,%esi
40000f8e:	09 ce                	or     %ecx,%esi
40000f90:	09 d6                	or     %edx,%esi
40000f92:	83 e6 03             	and    $0x3,%esi
40000f95:	74 39                	je     40000fd0 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000f97:	83 ef 01             	sub    $0x1,%edi
40000f9a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000f9d:	fd                   	std
40000f9e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000fa0:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000fa1:	5e                   	pop    %esi
40000fa2:	5f                   	pop    %edi
40000fa3:	c3                   	ret
40000fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000fa8:	89 c2                	mov    %eax,%edx
40000faa:	09 ca                	or     %ecx,%edx
40000fac:	09 f2                	or     %esi,%edx
40000fae:	83 e2 03             	and    $0x3,%edx
40000fb1:	74 0d                	je     40000fc0 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40000fb3:	89 c7                	mov    %eax,%edi
40000fb5:	fc                   	cld
40000fb6:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40000fb8:	5e                   	pop    %esi
40000fb9:	5f                   	pop    %edi
40000fba:	c3                   	ret
40000fbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40000fc0:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40000fc3:	89 c7                	mov    %eax,%edi
40000fc5:	fc                   	cld
40000fc6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000fc8:	eb ee                	jmp    40000fb8 <memmove+0x48>
40000fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40000fd0:	83 ef 04             	sub    $0x4,%edi
40000fd3:	8d 72 fc             	lea    -0x4(%edx),%esi
40000fd6:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40000fd9:	fd                   	std
40000fda:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000fdc:	eb c2                	jmp    40000fa0 <memmove+0x30>
40000fde:	66 90                	xchg   %ax,%ax

40000fe0 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40000fe0:	eb 8e                	jmp    40000f70 <memmove>
40000fe2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fe9:	00 
40000fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000ff0 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40000ff0:	56                   	push   %esi
40000ff1:	53                   	push   %ebx
40000ff2:	8b 74 24 14          	mov    0x14(%esp),%esi
40000ff6:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ffa:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
40000ffe:	85 f6                	test   %esi,%esi
40001000:	74 2e                	je     40001030 <memcmp+0x40>
40001002:	01 c6                	add    %eax,%esi
40001004:	eb 14                	jmp    4000101a <memcmp+0x2a>
40001006:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000100d:	00 
4000100e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40001010:	83 c0 01             	add    $0x1,%eax
40001013:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40001016:	39 f0                	cmp    %esi,%eax
40001018:	74 16                	je     40001030 <memcmp+0x40>
        if (*s1 != *s2)
4000101a:	0f b6 08             	movzbl (%eax),%ecx
4000101d:	0f b6 1a             	movzbl (%edx),%ebx
40001020:	38 d9                	cmp    %bl,%cl
40001022:	74 ec                	je     40001010 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40001024:	0f b6 c1             	movzbl %cl,%eax
40001027:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40001029:	5b                   	pop    %ebx
4000102a:	5e                   	pop    %esi
4000102b:	c3                   	ret
4000102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
40001030:	31 c0                	xor    %eax,%eax
}
40001032:	5b                   	pop    %ebx
40001033:	5e                   	pop    %esi
40001034:	c3                   	ret
40001035:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000103c:	00 
4000103d:	8d 76 00             	lea    0x0(%esi),%esi

40001040 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40001040:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
40001044:	8b 54 24 0c          	mov    0xc(%esp),%edx
40001048:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
4000104a:	39 d0                	cmp    %edx,%eax
4000104c:	73 1a                	jae    40001068 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000104e:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
40001053:	eb 0a                	jmp    4000105f <memchr+0x1f>
40001055:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
40001058:	83 c0 01             	add    $0x1,%eax
4000105b:	39 c2                	cmp    %eax,%edx
4000105d:	74 09                	je     40001068 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000105f:	38 08                	cmp    %cl,(%eax)
40001061:	75 f5                	jne    40001058 <memchr+0x18>
            return (void *) s;
    return NULL;
}
40001063:	c3                   	ret
40001064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
40001068:	31 c0                	xor    %eax,%eax
}
4000106a:	c3                   	ret
4000106b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001070 <memzero>:

void *memzero(void *v, size_t n)
{
40001070:	57                   	push   %edi
40001071:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40001075:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40001079:	85 c9                	test   %ecx,%ecx
4000107b:	74 0f                	je     4000108c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
4000107d:	89 f8                	mov    %edi,%eax
4000107f:	09 c8                	or     %ecx,%eax
40001081:	83 e0 03             	and    $0x3,%eax
40001084:	75 0a                	jne    40001090 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40001086:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40001089:	fc                   	cld
4000108a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
4000108c:	89 f8                	mov    %edi,%eax
4000108e:	5f                   	pop    %edi
4000108f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001090:	31 c0                	xor    %eax,%eax
40001092:	fc                   	cld
40001093:	f3 aa                	rep stos %al,%es:(%edi)
}
40001095:	89 f8                	mov    %edi,%eax
40001097:	5f                   	pop    %edi
40001098:	c3                   	ret
40001099:	66 90                	xchg   %ax,%ax
4000109b:	66 90                	xchg   %ax,%ax
4000109d:	66 90                	xchg   %ax,%ax
4000109f:	90                   	nop

400010a0 <smallfile>:
{
400010a0:	55                   	push   %ebp
400010a1:	57                   	push   %edi
400010a2:	56                   	push   %esi
400010a3:	e8 44 23 00 00       	call   400033ec <__x86.get_pc_thunk.si>
400010a8:	81 c6 4c 6f 00 00    	add    $0x6f4c,%esi
400010ae:	53                   	push   %ebx
400010af:	83 ec 28             	sub    $0x28,%esp
    printf("=====small file test=====\n");
400010b2:	8d 86 48 c0 ff ff    	lea    -0x3fb8(%esi),%eax
400010b8:	89 74 24 14          	mov    %esi,0x14(%esp)
400010bc:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400010be:	8d be 63 c0 ff ff    	lea    -0x3f9d(%esi),%edi
400010c4:	50                   	push   %eax
400010c5:	e8 a6 f2 ff ff       	call   40000370 <printf>
400010ca:	89 3c 24             	mov    %edi,(%esp)
400010cd:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
400010d1:	e8 fa fa ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400010d6:	b9 02 02 00 00       	mov    $0x202,%ecx
400010db:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
400010dd:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400010e0:	b8 04 00 00 00       	mov    $0x4,%eax
400010e5:	cd 30                	int    $0x30
    return errno ? -1 : fd;
400010e7:	83 c4 10             	add    $0x10,%esp
    if (fd >= 0) {
400010ea:	85 c0                	test   %eax,%eax
400010ec:	0f 85 96 00 00 00    	jne    40001188 <smallfile+0xe8>
400010f2:	89 dd                	mov    %ebx,%ebp
400010f4:	85 db                	test   %ebx,%ebx
400010f6:	0f 88 8c 00 00 00    	js     40001188 <smallfile+0xe8>
        printf("create small succeeded; ok, fd: %d\n", fd);
400010fc:	83 ec 08             	sub    $0x8,%esp
400010ff:	8d 86 00 cc ff ff    	lea    -0x3400(%esi),%eax
    for (i = 0; i < 100; i++) {
40001105:	31 ff                	xor    %edi,%edi
        printf("create small succeeded; ok, fd: %d\n", fd);
40001107:	53                   	push   %ebx
40001108:	89 f3                	mov    %esi,%ebx
4000110a:	50                   	push   %eax
4000110b:	e8 60 f2 ff ff       	call   40000370 <printf>
40001110:	83 c4 10             	add    $0x10,%esp
40001113:	8d 96 86 c0 ff ff    	lea    -0x3f7a(%esi),%edx
    asm volatile ("int %2"
40001119:	be 07 00 00 00       	mov    $0x7,%esi
4000111e:	8d 83 91 c0 ff ff    	lea    -0x3f6f(%ebx),%eax
40001124:	89 14 24             	mov    %edx,(%esp)
40001127:	89 44 24 04          	mov    %eax,0x4(%esp)
4000112b:	eb 26                	jmp    40001153 <smallfile+0xb3>
4000112d:	8d 76 00             	lea    0x0(%esi),%esi
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001130:	85 c0                	test   %eax,%eax
40001132:	75 32                	jne    40001166 <smallfile+0xc6>
40001134:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40001138:	89 f0                	mov    %esi,%eax
4000113a:	89 eb                	mov    %ebp,%ebx
4000113c:	cd 30                	int    $0x30
        if (write(fd, "bbbbbbbbbb", 10) != 10) {
4000113e:	83 fb 0a             	cmp    $0xa,%ebx
40001141:	75 6d                	jne    400011b0 <smallfile+0x110>
40001143:	85 c0                	test   %eax,%eax
40001145:	75 69                	jne    400011b0 <smallfile+0x110>
    for (i = 0; i < 100; i++) {
40001147:	83 c7 01             	add    $0x1,%edi
4000114a:	83 ff 64             	cmp    $0x64,%edi
4000114d:	0f 84 7c 00 00 00    	je     400011cf <smallfile+0x12f>
40001153:	8b 0c 24             	mov    (%esp),%ecx
40001156:	ba 0a 00 00 00       	mov    $0xa,%edx
4000115b:	89 f0                	mov    %esi,%eax
4000115d:	89 eb                	mov    %ebp,%ebx
4000115f:	cd 30                	int    $0x30
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001161:	83 fb 0a             	cmp    $0xa,%ebx
40001164:	74 ca                	je     40001130 <smallfile+0x90>
            printf("error: write aa %d new file failed\n", i);
40001166:	83 ec 08             	sub    $0x8,%esp
40001169:	57                   	push   %edi
4000116a:	8b 5c 24 14          	mov    0x14(%esp),%ebx
4000116e:	8d 83 24 cc ff ff    	lea    -0x33dc(%ebx),%eax
40001174:	50                   	push   %eax
40001175:	e8 f6 f1 ff ff       	call   40000370 <printf>
            exit();
4000117a:	83 c4 10             	add    $0x10,%esp
}
4000117d:	83 c4 1c             	add    $0x1c,%esp
40001180:	5b                   	pop    %ebx
40001181:	5e                   	pop    %esi
40001182:	5f                   	pop    %edi
40001183:	5d                   	pop    %ebp
40001184:	c3                   	ret
40001185:	8d 76 00             	lea    0x0(%esi),%esi
        printf("error: create small failed!\n");
40001188:	83 ec 0c             	sub    $0xc,%esp
4000118b:	8b 5c 24 14          	mov    0x14(%esp),%ebx
4000118f:	8d 83 69 c0 ff ff    	lea    -0x3f97(%ebx),%eax
40001195:	50                   	push   %eax
40001196:	e8 d5 f1 ff ff       	call   40000370 <printf>
        exit();
4000119b:	83 c4 10             	add    $0x10,%esp
}
4000119e:	83 c4 1c             	add    $0x1c,%esp
400011a1:	5b                   	pop    %ebx
400011a2:	5e                   	pop    %esi
400011a3:	5f                   	pop    %edi
400011a4:	5d                   	pop    %ebp
400011a5:	c3                   	ret
400011a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400011ad:	00 
400011ae:	66 90                	xchg   %ax,%ax
            printf("error: write bb %d new file failed\n", i);
400011b0:	83 ec 08             	sub    $0x8,%esp
400011b3:	57                   	push   %edi
400011b4:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400011b8:	8d 83 48 cc ff ff    	lea    -0x33b8(%ebx),%eax
400011be:	50                   	push   %eax
400011bf:	e8 ac f1 ff ff       	call   40000370 <printf>
            exit();
400011c4:	83 c4 10             	add    $0x10,%esp
}
400011c7:	83 c4 1c             	add    $0x1c,%esp
400011ca:	5b                   	pop    %ebx
400011cb:	5e                   	pop    %esi
400011cc:	5f                   	pop    %edi
400011cd:	5d                   	pop    %ebp
400011ce:	c3                   	ret
    printf("writes ok\n");
400011cf:	83 ec 0c             	sub    $0xc,%esp
400011d2:	8b 7c 24 14          	mov    0x14(%esp),%edi
400011d6:	8d 87 9c c0 ff ff    	lea    -0x3f64(%edi),%eax
400011dc:	89 fb                	mov    %edi,%ebx
400011de:	50                   	push   %eax
400011df:	e8 8c f1 ff ff       	call   40000370 <printf>
    asm volatile ("int %2"
400011e4:	b8 05 00 00 00       	mov    $0x5,%eax
400011e9:	89 eb                	mov    %ebp,%ebx
400011eb:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
400011ed:	8b 74 24 1c          	mov    0x1c(%esp),%esi
400011f1:	89 fb                	mov    %edi,%ebx
400011f3:	89 34 24             	mov    %esi,(%esp)
400011f6:	e8 d5 f9 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400011fb:	31 c9                	xor    %ecx,%ecx
400011fd:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400011ff:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001202:	b8 04 00 00 00       	mov    $0x4,%eax
40001207:	cd 30                	int    $0x30
40001209:	89 de                	mov    %ebx,%esi
    if (fd >= 0) {
4000120b:	83 c4 10             	add    $0x10,%esp
4000120e:	85 db                	test   %ebx,%ebx
40001210:	0f 88 94 00 00 00    	js     400012aa <smallfile+0x20a>
40001216:	85 c0                	test   %eax,%eax
40001218:	0f 85 8c 00 00 00    	jne    400012aa <smallfile+0x20a>
        printf("open small succeeded ok\n");
4000121e:	83 ec 0c             	sub    $0xc,%esp
40001221:	8d 87 a7 c0 ff ff    	lea    -0x3f59(%edi),%eax
40001227:	89 fb                	mov    %edi,%ebx
40001229:	50                   	push   %eax
4000122a:	e8 41 f1 ff ff       	call   40000370 <printf>
    asm volatile ("int %2"
4000122f:	b8 06 00 00 00       	mov    $0x6,%eax
40001234:	8d 8f 4c 00 00 00    	lea    0x4c(%edi),%ecx
4000123a:	89 f3                	mov    %esi,%ebx
4000123c:	ba d0 07 00 00       	mov    $0x7d0,%edx
40001241:	cd 30                	int    $0x30
    if (i == 2000) {
40001243:	83 c4 10             	add    $0x10,%esp
40001246:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
4000124c:	75 77                	jne    400012c5 <smallfile+0x225>
4000124e:	85 c0                	test   %eax,%eax
40001250:	75 73                	jne    400012c5 <smallfile+0x225>
        printf("read succeeded ok\n");
40001252:	83 ec 0c             	sub    $0xc,%esp
40001255:	8b 7c 24 14          	mov    0x14(%esp),%edi
40001259:	8d 87 db c0 ff ff    	lea    -0x3f25(%edi),%eax
4000125f:	89 fb                	mov    %edi,%ebx
40001261:	50                   	push   %eax
40001262:	e8 09 f1 ff ff       	call   40000370 <printf>
    asm volatile ("int %2"
40001267:	b8 05 00 00 00       	mov    $0x5,%eax
4000126c:	89 f3                	mov    %esi,%ebx
4000126e:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001270:	8b 74 24 1c          	mov    0x1c(%esp),%esi
40001274:	89 fb                	mov    %edi,%ebx
40001276:	89 34 24             	mov    %esi,(%esp)
40001279:	e8 52 f9 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000127e:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001280:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001283:	b8 0b 00 00 00       	mov    $0xb,%eax
40001288:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000128a:	83 c4 10             	add    $0x10,%esp
4000128d:	85 c0                	test   %eax,%eax
4000128f:	75 4f                	jne    400012e0 <smallfile+0x240>
    printf("=====small file test ok=====\n\n");
40001291:	83 ec 0c             	sub    $0xc,%esp
40001294:	8d 87 6c cc ff ff    	lea    -0x3394(%edi),%eax
4000129a:	89 fb                	mov    %edi,%ebx
4000129c:	50                   	push   %eax
4000129d:	e8 ce f0 ff ff       	call   40000370 <printf>
400012a2:	83 c4 10             	add    $0x10,%esp
400012a5:	e9 d3 fe ff ff       	jmp    4000117d <smallfile+0xdd>
        printf("error: open small failed!\n");
400012aa:	83 ec 0c             	sub    $0xc,%esp
400012ad:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400012b1:	8d 83 c0 c0 ff ff    	lea    -0x3f40(%ebx),%eax
400012b7:	50                   	push   %eax
400012b8:	e8 b3 f0 ff ff       	call   40000370 <printf>
        exit();
400012bd:	83 c4 10             	add    $0x10,%esp
400012c0:	e9 b8 fe ff ff       	jmp    4000117d <smallfile+0xdd>
        printf("read failed\n");
400012c5:	83 ec 0c             	sub    $0xc,%esp
400012c8:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400012cc:	8d 83 09 c8 ff ff    	lea    -0x37f7(%ebx),%eax
400012d2:	50                   	push   %eax
400012d3:	e8 98 f0 ff ff       	call   40000370 <printf>
        exit();
400012d8:	83 c4 10             	add    $0x10,%esp
400012db:	e9 9d fe ff ff       	jmp    4000117d <smallfile+0xdd>
        printf("unlink small failed\n");
400012e0:	83 ec 0c             	sub    $0xc,%esp
400012e3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400012e7:	8d 83 ee c0 ff ff    	lea    -0x3f12(%ebx),%eax
400012ed:	50                   	push   %eax
400012ee:	e8 7d f0 ff ff       	call   40000370 <printf>
        exit();
400012f3:	83 c4 10             	add    $0x10,%esp
400012f6:	e9 82 fe ff ff       	jmp    4000117d <smallfile+0xdd>
400012fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001300 <bigfile1>:
{
40001300:	55                   	push   %ebp
40001301:	e8 ee 20 00 00       	call   400033f4 <__x86.get_pc_thunk.bp>
40001306:	81 c5 ee 6c 00 00    	add    $0x6cee,%ebp
4000130c:	57                   	push   %edi
4000130d:	56                   	push   %esi
4000130e:	53                   	push   %ebx
4000130f:	83 ec 28             	sub    $0x28,%esp
    printf("=====big files test=====\n");
40001312:	8d 85 03 c1 ff ff    	lea    -0x3efd(%ebp),%eax
40001318:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
4000131a:	8d b5 88 c1 ff ff    	lea    -0x3e78(%ebp),%esi
40001320:	50                   	push   %eax
40001321:	e8 4a f0 ff ff       	call   40000370 <printf>
40001326:	89 34 24             	mov    %esi,(%esp)
40001329:	89 74 24 1c          	mov    %esi,0x1c(%esp)
4000132d:	e8 9e f8 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001332:	b9 02 02 00 00       	mov    $0x202,%ecx
40001337:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001339:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000133c:	b8 04 00 00 00       	mov    $0x4,%eax
40001341:	cd 30                	int    $0x30
    if (fd < 0) {
40001343:	83 c4 10             	add    $0x10,%esp
40001346:	85 db                	test   %ebx,%ebx
40001348:	78 76                	js     400013c0 <bigfile1+0xc0>
4000134a:	8d 8d 4c 00 00 00    	lea    0x4c(%ebp),%ecx
    for (i = 0; i < MAXFILE; i++) {
40001350:	31 ff                	xor    %edi,%edi
    asm volatile ("int %2"
40001352:	be 00 02 00 00       	mov    $0x200,%esi
40001357:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    if (fd < 0) {
4000135b:	85 c0                	test   %eax,%eax
4000135d:	75 61                	jne    400013c0 <bigfile1+0xc0>
4000135f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
40001363:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40001367:	eb 1a                	jmp    40001383 <bigfile1+0x83>
40001369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (write(fd, buf, 512) != 512) {
40001370:	81 fb 00 02 00 00    	cmp    $0x200,%ebx
40001376:	75 22                	jne    4000139a <bigfile1+0x9a>
    for (i = 0; i < MAXFILE; i++) {
40001378:	83 c7 01             	add    $0x1,%edi
4000137b:	81 ff 8c 00 00 00    	cmp    $0x8c,%edi
40001381:	74 59                	je     400013dc <bigfile1+0xdc>
        ((int *) buf)[0] = i;
40001383:	89 bd 4c 00 00 00    	mov    %edi,0x4c(%ebp)
40001389:	8b 5c 24 04          	mov    0x4(%esp),%ebx
4000138d:	b8 07 00 00 00       	mov    $0x7,%eax
40001392:	89 f2                	mov    %esi,%edx
40001394:	cd 30                	int    $0x30
        if (write(fd, buf, 512) != 512) {
40001396:	85 c0                	test   %eax,%eax
40001398:	74 d6                	je     40001370 <bigfile1+0x70>
            printf("error: write big file failed\n", i);
4000139a:	83 ec 08             	sub    $0x8,%esp
4000139d:	8d 85 38 c1 ff ff    	lea    -0x3ec8(%ebp),%eax
400013a3:	89 eb                	mov    %ebp,%ebx
400013a5:	57                   	push   %edi
400013a6:	50                   	push   %eax
400013a7:	e8 c4 ef ff ff       	call   40000370 <printf>
            exit();
400013ac:	83 c4 10             	add    $0x10,%esp
}
400013af:	83 c4 1c             	add    $0x1c,%esp
400013b2:	5b                   	pop    %ebx
400013b3:	5e                   	pop    %esi
400013b4:	5f                   	pop    %edi
400013b5:	5d                   	pop    %ebp
400013b6:	c3                   	ret
400013b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400013be:	00 
400013bf:	90                   	nop
        printf("error: create big failed!\n");
400013c0:	83 ec 0c             	sub    $0xc,%esp
400013c3:	8d 85 1d c1 ff ff    	lea    -0x3ee3(%ebp),%eax
400013c9:	89 eb                	mov    %ebp,%ebx
400013cb:	50                   	push   %eax
400013cc:	e8 9f ef ff ff       	call   40000370 <printf>
        exit();
400013d1:	83 c4 10             	add    $0x10,%esp
}
400013d4:	83 c4 1c             	add    $0x1c,%esp
400013d7:	5b                   	pop    %ebx
400013d8:	5e                   	pop    %esi
400013d9:	5f                   	pop    %edi
400013da:	5d                   	pop    %ebp
400013db:	c3                   	ret
    asm volatile ("int %2"
400013dc:	8b 54 24 04          	mov    0x4(%esp),%edx
400013e0:	b8 05 00 00 00       	mov    $0x5,%eax
400013e5:	89 d3                	mov    %edx,%ebx
400013e7:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
400013e9:	83 ec 0c             	sub    $0xc,%esp
400013ec:	89 eb                	mov    %ebp,%ebx
400013ee:	8b 7c 24 18          	mov    0x18(%esp),%edi
400013f2:	57                   	push   %edi
400013f3:	e8 d8 f7 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400013f8:	31 c9                	xor    %ecx,%ecx
400013fa:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
400013fc:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400013ff:	b8 04 00 00 00       	mov    $0x4,%eax
40001404:	cd 30                	int    $0x30
40001406:	89 df                	mov    %ebx,%edi
    if (fd < 0) {
40001408:	83 c4 10             	add    $0x10,%esp
4000140b:	85 db                	test   %ebx,%ebx
4000140d:	0f 88 ab 00 00 00    	js     400014be <bigfile1+0x1be>
40001413:	85 c0                	test   %eax,%eax
40001415:	0f 85 a3 00 00 00    	jne    400014be <bigfile1+0x1be>
    asm volatile ("int %2"
4000141b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000141f:	b8 06 00 00 00       	mov    $0x6,%eax
40001424:	89 f2                	mov    %esi,%edx
40001426:	cd 30                	int    $0x30
40001428:	89 da                	mov    %ebx,%edx
4000142a:	89 c6                	mov    %eax,%esi
    return errno ? -1 : ret;
4000142c:	85 c0                	test   %eax,%eax
4000142e:	74 34                	je     40001464 <bigfile1+0x164>
40001430:	e9 a2 00 00 00       	jmp    400014d7 <bigfile1+0x1d7>
40001435:	8d 76 00             	lea    0x0(%esi),%esi
        } else if (i != 512) {
40001438:	81 fa 00 02 00 00    	cmp    $0x200,%edx
4000143e:	0f 85 98 00 00 00    	jne    400014dc <bigfile1+0x1dc>
        if (((int *) buf)[0] != n) {
40001444:	8b 85 4c 00 00 00    	mov    0x4c(%ebp),%eax
4000144a:	39 f0                	cmp    %esi,%eax
4000144c:	0f 85 a4 00 00 00    	jne    400014f6 <bigfile1+0x1f6>
        n++;
40001452:	83 c6 01             	add    $0x1,%esi
    asm volatile ("int %2"
40001455:	b8 06 00 00 00       	mov    $0x6,%eax
4000145a:	89 fb                	mov    %edi,%ebx
4000145c:	cd 30                	int    $0x30
4000145e:	89 da                	mov    %ebx,%edx
    return errno ? -1 : ret;
40001460:	85 c0                	test   %eax,%eax
40001462:	75 73                	jne    400014d7 <bigfile1+0x1d7>
40001464:	89 d0                	mov    %edx,%eax
        if (i == 0) {
40001466:	85 d2                	test   %edx,%edx
40001468:	75 ce                	jne    40001438 <bigfile1+0x138>
            if (n == MAXFILE - 1) {
4000146a:	81 fe 8b 00 00 00    	cmp    $0x8b,%esi
40001470:	0f 84 9b 00 00 00    	je     40001511 <bigfile1+0x211>
    asm volatile ("int %2"
40001476:	b8 05 00 00 00       	mov    $0x5,%eax
4000147b:	89 fb                	mov    %edi,%ebx
4000147d:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
4000147f:	83 ec 0c             	sub    $0xc,%esp
40001482:	89 eb                	mov    %ebp,%ebx
40001484:	8b 74 24 18          	mov    0x18(%esp),%esi
40001488:	56                   	push   %esi
40001489:	e8 42 f7 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000148e:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001490:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001493:	b8 0b 00 00 00       	mov    $0xb,%eax
40001498:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000149a:	83 c4 10             	add    $0x10,%esp
4000149d:	85 c0                	test   %eax,%eax
4000149f:	0f 85 8a 00 00 00    	jne    4000152f <bigfile1+0x22f>
    printf("=====big files ok=====\n\n");
400014a5:	83 ec 0c             	sub    $0xc,%esp
400014a8:	8d 85 9c c1 ff ff    	lea    -0x3e64(%ebp),%eax
400014ae:	89 eb                	mov    %ebp,%ebx
400014b0:	50                   	push   %eax
400014b1:	e8 ba ee ff ff       	call   40000370 <printf>
400014b6:	83 c4 10             	add    $0x10,%esp
400014b9:	e9 f1 fe ff ff       	jmp    400013af <bigfile1+0xaf>
        printf("error: open big failed!\n");
400014be:	83 ec 0c             	sub    $0xc,%esp
400014c1:	8d 85 56 c1 ff ff    	lea    -0x3eaa(%ebp),%eax
400014c7:	89 eb                	mov    %ebp,%ebx
400014c9:	50                   	push   %eax
400014ca:	e8 a1 ee ff ff       	call   40000370 <printf>
        exit();
400014cf:	83 c4 10             	add    $0x10,%esp
400014d2:	e9 d8 fe ff ff       	jmp    400013af <bigfile1+0xaf>
    return errno ? -1 : ret;
400014d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
            printf("read failed %d\n", i);
400014dc:	83 ec 08             	sub    $0x8,%esp
400014df:	89 eb                	mov    %ebp,%ebx
400014e1:	50                   	push   %eax
400014e2:	8d 85 8c c1 ff ff    	lea    -0x3e74(%ebp),%eax
400014e8:	50                   	push   %eax
400014e9:	e8 82 ee ff ff       	call   40000370 <printf>
            exit();
400014ee:	83 c4 10             	add    $0x10,%esp
400014f1:	e9 b9 fe ff ff       	jmp    400013af <bigfile1+0xaf>
            printf("read content of block %d is %d\n", n, ((int *) buf)[0]);
400014f6:	83 ec 04             	sub    $0x4,%esp
400014f9:	89 eb                	mov    %ebp,%ebx
400014fb:	50                   	push   %eax
400014fc:	8d 85 8c cc ff ff    	lea    -0x3374(%ebp),%eax
40001502:	56                   	push   %esi
40001503:	50                   	push   %eax
40001504:	e8 67 ee ff ff       	call   40000370 <printf>
            exit();
40001509:	83 c4 10             	add    $0x10,%esp
4000150c:	e9 9e fe ff ff       	jmp    400013af <bigfile1+0xaf>
                printf("read only %d blocks from big", n);
40001511:	83 ec 08             	sub    $0x8,%esp
40001514:	8d 85 6f c1 ff ff    	lea    -0x3e91(%ebp),%eax
4000151a:	89 eb                	mov    %ebp,%ebx
4000151c:	68 8b 00 00 00       	push   $0x8b
40001521:	50                   	push   %eax
40001522:	e8 49 ee ff ff       	call   40000370 <printf>
                exit();
40001527:	83 c4 10             	add    $0x10,%esp
4000152a:	e9 80 fe ff ff       	jmp    400013af <bigfile1+0xaf>
        printf("unlink big failed\n");
4000152f:	83 ec 0c             	sub    $0xc,%esp
40001532:	8d 85 b5 c1 ff ff    	lea    -0x3e4b(%ebp),%eax
40001538:	89 eb                	mov    %ebp,%ebx
4000153a:	50                   	push   %eax
4000153b:	e8 30 ee ff ff       	call   40000370 <printf>
        exit();
40001540:	83 c4 10             	add    $0x10,%esp
40001543:	e9 67 fe ff ff       	jmp    400013af <bigfile1+0xaf>
40001548:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000154f:	00 

40001550 <createtest>:
{
40001550:	55                   	push   %ebp
    name[2] = '\0';
40001551:	bd 30 00 00 00       	mov    $0x30,%ebp
{
40001556:	57                   	push   %edi
40001557:	e8 94 1e 00 00       	call   400033f0 <__x86.get_pc_thunk.di>
4000155c:	81 c7 98 6a 00 00    	add    $0x6a98,%edi
40001562:	56                   	push   %esi
40001563:	53                   	push   %ebx
40001564:	83 ec 28             	sub    $0x28,%esp
    printf("=====many creates, followed by unlink test=====\n");
40001567:	8d 87 ac cc ff ff    	lea    -0x3354(%edi),%eax
4000156d:	89 fb                	mov    %edi,%ebx
4000156f:	8d b7 36 00 00 00    	lea    0x36(%edi),%esi
40001575:	50                   	push   %eax
40001576:	e8 f5 ed ff ff       	call   40000370 <printf>
    name[2] = '\0';
4000157b:	83 c4 10             	add    $0x10,%esp
4000157e:	8d 05 36 00 00 00    	lea    0x36,%eax
    name[0] = 'a';
40001584:	c6 87 36 00 00 00 61 	movb   $0x61,0x36(%edi)
    name[2] = '\0';
4000158b:	c6 87 38 00 00 00 00 	movb   $0x0,0x38(%edi)
    for (i = 0; i < 52; i++) {
40001592:	89 44 24 0c          	mov    %eax,0xc(%esp)
40001596:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000159d:	00 
4000159e:	66 90                	xchg   %ax,%ax
        name[1] = '0' + i;
400015a0:	8b 54 24 0c          	mov    0xc(%esp),%edx
400015a4:	89 e8                	mov    %ebp,%eax
    int len = strlen(path) + 1;
400015a6:	83 ec 0c             	sub    $0xc,%esp
400015a9:	89 fb                	mov    %edi,%ebx
400015ab:	88 44 3a 01          	mov    %al,0x1(%edx,%edi,1)
400015af:	56                   	push   %esi
400015b0:	e8 1b f6 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400015b5:	89 f3                	mov    %esi,%ebx
400015b7:	b9 02 02 00 00       	mov    $0x202,%ecx
    int len = strlen(path) + 1;
400015bc:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400015bf:	b8 04 00 00 00       	mov    $0x4,%eax
400015c4:	cd 30                	int    $0x30
    return errno ? -1 : fd;
400015c6:	83 c4 10             	add    $0x10,%esp
400015c9:	85 c0                	test   %eax,%eax
400015cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
400015d0:	0f 45 d8             	cmovne %eax,%ebx
    asm volatile ("int %2"
400015d3:	b8 05 00 00 00       	mov    $0x5,%eax
400015d8:	cd 30                	int    $0x30
    for (i = 0; i < 52; i++) {
400015da:	83 c5 01             	add    $0x1,%ebp
400015dd:	89 e8                	mov    %ebp,%eax
400015df:	3c 64                	cmp    $0x64,%al
400015e1:	75 bd                	jne    400015a0 <createtest+0x50>
    name[0] = 'a';
400015e3:	c6 87 36 00 00 00 61 	movb   $0x61,0x36(%edi)
    name[2] = '\0';
400015ea:	bd 30 00 00 00       	mov    $0x30,%ebp
400015ef:	c6 87 38 00 00 00 00 	movb   $0x0,0x38(%edi)
    for (i = 0; i < 52; i++) {
400015f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400015fd:	00 
400015fe:	66 90                	xchg   %ax,%ax
        name[1] = '0' + i;
40001600:	8b 54 24 0c          	mov    0xc(%esp),%edx
40001604:	89 e8                	mov    %ebp,%eax
    int len = strlen(path) + 1;
40001606:	83 ec 0c             	sub    $0xc,%esp
40001609:	89 fb                	mov    %edi,%ebx
4000160b:	88 44 3a 01          	mov    %al,0x1(%edx,%edi,1)
4000160f:	56                   	push   %esi
40001610:	e8 bb f5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001615:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001617:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000161a:	b8 0b 00 00 00       	mov    $0xb,%eax
4000161f:	cd 30                	int    $0x30
    for (i = 0; i < 52; i++) {
40001621:	83 c5 01             	add    $0x1,%ebp
40001624:	83 c4 10             	add    $0x10,%esp
40001627:	89 e8                	mov    %ebp,%eax
40001629:	3c 64                	cmp    $0x64,%al
4000162b:	75 d3                	jne    40001600 <createtest+0xb0>
    printf("=====many creates, followed by unlink; ok=====\n\n");
4000162d:	83 ec 0c             	sub    $0xc,%esp
40001630:	8d 87 e0 cc ff ff    	lea    -0x3320(%edi),%eax
40001636:	89 fb                	mov    %edi,%ebx
40001638:	50                   	push   %eax
40001639:	e8 32 ed ff ff       	call   40000370 <printf>
}
4000163e:	83 c4 2c             	add    $0x2c,%esp
40001641:	5b                   	pop    %ebx
40001642:	5e                   	pop    %esi
40001643:	5f                   	pop    %edi
40001644:	5d                   	pop    %ebp
40001645:	c3                   	ret
40001646:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000164d:	00 
4000164e:	66 90                	xchg   %ax,%ax

40001650 <rmdot>:
{
40001650:	55                   	push   %ebp
40001651:	57                   	push   %edi
40001652:	56                   	push   %esi
40001653:	e8 94 1d 00 00       	call   400033ec <__x86.get_pc_thunk.si>
40001658:	81 c6 9c 69 00 00    	add    $0x699c,%esi
4000165e:	53                   	push   %ebx
4000165f:	83 ec 28             	sub    $0x28,%esp
    printf("=====rmdot test=====\n");
40001662:	8d 86 c8 c1 ff ff    	lea    -0x3e38(%esi),%eax
40001668:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000166a:	8d be de c1 ff ff    	lea    -0x3e22(%esi),%edi
40001670:	50                   	push   %eax
40001671:	e8 fa ec ff ff       	call   40000370 <printf>
40001676:	89 3c 24             	mov    %edi,(%esp)
40001679:	e8 52 f5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000167e:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001680:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001683:	b8 08 00 00 00       	mov    $0x8,%eax
40001688:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000168a:	83 c4 10             	add    $0x10,%esp
4000168d:	85 c0                	test   %eax,%eax
4000168f:	75 67                	jne    400016f8 <rmdot+0xa8>
    int len = strlen(path) + 1;
40001691:	83 ec 0c             	sub    $0xc,%esp
40001694:	89 f3                	mov    %esi,%ebx
40001696:	57                   	push   %edi
40001697:	e8 34 f5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000169c:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000169e:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400016a1:	b8 09 00 00 00       	mov    $0x9,%eax
400016a6:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400016a8:	83 c4 10             	add    $0x10,%esp
400016ab:	85 c0                	test   %eax,%eax
400016ad:	75 61                	jne    40001710 <rmdot+0xc0>
    int len = strlen(path) + 1;
400016af:	83 ec 0c             	sub    $0xc,%esp
400016b2:	8d ae 14 c5 ff ff    	lea    -0x3aec(%esi),%ebp
400016b8:	89 f3                	mov    %esi,%ebx
400016ba:	55                   	push   %ebp
400016bb:	e8 10 f5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400016c0:	ba 0b 00 00 00       	mov    $0xb,%edx
400016c5:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400016c7:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400016ca:	89 d0                	mov    %edx,%eax
400016cc:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400016ce:	83 c4 10             	add    $0x10,%esp
400016d1:	85 c0                	test   %eax,%eax
400016d3:	75 5b                	jne    40001730 <rmdot+0xe0>
        printf("rm . worked!\n");
400016d5:	83 ec 0c             	sub    $0xc,%esp
400016d8:	8d 86 09 c2 ff ff    	lea    -0x3df7(%esi),%eax
400016de:	89 f3                	mov    %esi,%ebx
400016e0:	50                   	push   %eax
400016e1:	e8 8a ec ff ff       	call   40000370 <printf>
        exit();
400016e6:	83 c4 10             	add    $0x10,%esp
}
400016e9:	83 c4 1c             	add    $0x1c,%esp
400016ec:	5b                   	pop    %ebx
400016ed:	5e                   	pop    %esi
400016ee:	5f                   	pop    %edi
400016ef:	5d                   	pop    %ebp
400016f0:	c3                   	ret
400016f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf("mkdir dots failed\n");
400016f8:	83 ec 0c             	sub    $0xc,%esp
400016fb:	8d 86 e3 c1 ff ff    	lea    -0x3e1d(%esi),%eax
40001701:	89 f3                	mov    %esi,%ebx
40001703:	50                   	push   %eax
40001704:	e8 67 ec ff ff       	call   40000370 <printf>
        exit();
40001709:	83 c4 10             	add    $0x10,%esp
4000170c:	eb db                	jmp    400016e9 <rmdot+0x99>
4000170e:	66 90                	xchg   %ax,%ax
        printf("chdir dots failed\n");
40001710:	83 ec 0c             	sub    $0xc,%esp
40001713:	8d 86 f6 c1 ff ff    	lea    -0x3e0a(%esi),%eax
40001719:	89 f3                	mov    %esi,%ebx
4000171b:	50                   	push   %eax
4000171c:	e8 4f ec ff ff       	call   40000370 <printf>
        exit();
40001721:	83 c4 10             	add    $0x10,%esp
40001724:	eb c3                	jmp    400016e9 <rmdot+0x99>
40001726:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000172d:	00 
4000172e:	66 90                	xchg   %ax,%ax
40001730:	89 54 24 0c          	mov    %edx,0xc(%esp)
    int len = strlen(path) + 1;
40001734:	8d ae 13 c5 ff ff    	lea    -0x3aed(%esi),%ebp
4000173a:	83 ec 0c             	sub    $0xc,%esp
4000173d:	89 f3                	mov    %esi,%ebx
4000173f:	55                   	push   %ebp
40001740:	e8 8b f4 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001745:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40001749:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
4000174b:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000174e:	89 d0                	mov    %edx,%eax
40001750:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001752:	83 c4 10             	add    $0x10,%esp
40001755:	85 c0                	test   %eax,%eax
40001757:	75 19                	jne    40001772 <rmdot+0x122>
        printf("rm .. worked!\n");
40001759:	83 ec 0c             	sub    $0xc,%esp
4000175c:	8d 86 17 c2 ff ff    	lea    -0x3de9(%esi),%eax
40001762:	89 f3                	mov    %esi,%ebx
40001764:	50                   	push   %eax
40001765:	e8 06 ec ff ff       	call   40000370 <printf>
        exit();
4000176a:	83 c4 10             	add    $0x10,%esp
4000176d:	e9 77 ff ff ff       	jmp    400016e9 <rmdot+0x99>
40001772:	89 54 24 0c          	mov    %edx,0xc(%esp)
    int len = strlen(path) + 1;
40001776:	8d ae 26 c2 ff ff    	lea    -0x3dda(%esi),%ebp
4000177c:	83 ec 0c             	sub    $0xc,%esp
4000177f:	89 f3                	mov    %esi,%ebx
40001781:	55                   	push   %ebp
40001782:	e8 49 f4 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001787:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40001789:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000178c:	b8 09 00 00 00       	mov    $0x9,%eax
40001791:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001793:	83 c4 10             	add    $0x10,%esp
40001796:	85 c0                	test   %eax,%eax
40001798:	75 3e                	jne    400017d8 <rmdot+0x188>
    int len = strlen(path) + 1;
4000179a:	83 ec 0c             	sub    $0xc,%esp
4000179d:	8d ae 28 c2 ff ff    	lea    -0x3dd8(%esi),%ebp
400017a3:	89 f3                	mov    %esi,%ebx
400017a5:	55                   	push   %ebp
400017a6:	e8 25 f4 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400017ab:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400017af:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400017b1:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400017b4:	89 d0                	mov    %edx,%eax
400017b6:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400017b8:	83 c4 10             	add    $0x10,%esp
400017bb:	85 c0                	test   %eax,%eax
400017bd:	75 32                	jne    400017f1 <rmdot+0x1a1>
        printf("unlink dots/. worked!\n");
400017bf:	83 ec 0c             	sub    $0xc,%esp
400017c2:	8d 86 41 c2 ff ff    	lea    -0x3dbf(%esi),%eax
400017c8:	89 f3                	mov    %esi,%ebx
400017ca:	50                   	push   %eax
400017cb:	e8 a0 eb ff ff       	call   40000370 <printf>
        exit();
400017d0:	83 c4 10             	add    $0x10,%esp
400017d3:	e9 11 ff ff ff       	jmp    400016e9 <rmdot+0x99>
        printf("chdir '/' failed\n");
400017d8:	83 ec 0c             	sub    $0xc,%esp
400017db:	8d 86 2f c2 ff ff    	lea    -0x3dd1(%esi),%eax
400017e1:	89 f3                	mov    %esi,%ebx
400017e3:	50                   	push   %eax
400017e4:	e8 87 eb ff ff       	call   40000370 <printf>
        exit();
400017e9:	83 c4 10             	add    $0x10,%esp
400017ec:	e9 f8 fe ff ff       	jmp    400016e9 <rmdot+0x99>
400017f1:	89 54 24 0c          	mov    %edx,0xc(%esp)
    int len = strlen(path) + 1;
400017f5:	8d ae 58 c2 ff ff    	lea    -0x3da8(%esi),%ebp
400017fb:	83 ec 0c             	sub    $0xc,%esp
400017fe:	89 f3                	mov    %esi,%ebx
40001800:	55                   	push   %ebp
40001801:	e8 ca f3 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001806:	8b 54 24 1c          	mov    0x1c(%esp),%edx
4000180a:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
4000180c:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000180f:	89 d0                	mov    %edx,%eax
40001811:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001813:	83 c4 10             	add    $0x10,%esp
40001816:	85 c0                	test   %eax,%eax
40001818:	75 19                	jne    40001833 <rmdot+0x1e3>
        printf("unlink dots/.. worked!\n");
4000181a:	83 ec 0c             	sub    $0xc,%esp
4000181d:	8d 86 60 c2 ff ff    	lea    -0x3da0(%esi),%eax
40001823:	89 f3                	mov    %esi,%ebx
40001825:	50                   	push   %eax
40001826:	e8 45 eb ff ff       	call   40000370 <printf>
        exit();
4000182b:	83 c4 10             	add    $0x10,%esp
4000182e:	e9 b6 fe ff ff       	jmp    400016e9 <rmdot+0x99>
40001833:	89 54 24 0c          	mov    %edx,0xc(%esp)
    int len = strlen(path) + 1;
40001837:	83 ec 0c             	sub    $0xc,%esp
4000183a:	89 f3                	mov    %esi,%ebx
4000183c:	57                   	push   %edi
4000183d:	e8 8e f3 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001842:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001844:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001847:	8b 44 24 1c          	mov    0x1c(%esp),%eax
4000184b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000184d:	83 c4 10             	add    $0x10,%esp
40001850:	85 c0                	test   %eax,%eax
40001852:	75 19                	jne    4000186d <rmdot+0x21d>
    printf("=====rmdot ok=====\n\n");
40001854:	83 ec 0c             	sub    $0xc,%esp
40001857:	8d 86 78 c2 ff ff    	lea    -0x3d88(%esi),%eax
4000185d:	89 f3                	mov    %esi,%ebx
4000185f:	50                   	push   %eax
40001860:	e8 0b eb ff ff       	call   40000370 <printf>
40001865:	83 c4 10             	add    $0x10,%esp
40001868:	e9 7c fe ff ff       	jmp    400016e9 <rmdot+0x99>
        printf("unlink dots failed!\n");
4000186d:	83 ec 0c             	sub    $0xc,%esp
40001870:	8d 86 8d c2 ff ff    	lea    -0x3d73(%esi),%eax
40001876:	89 f3                	mov    %esi,%ebx
40001878:	50                   	push   %eax
40001879:	e8 f2 ea ff ff       	call   40000370 <printf>
        exit();
4000187e:	83 c4 10             	add    $0x10,%esp
40001881:	e9 63 fe ff ff       	jmp    400016e9 <rmdot+0x99>
40001886:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000188d:	00 
4000188e:	66 90                	xchg   %ax,%ax

40001890 <fourteen>:
{
40001890:	55                   	push   %ebp
40001891:	57                   	push   %edi
40001892:	56                   	push   %esi
40001893:	e8 54 1b 00 00       	call   400033ec <__x86.get_pc_thunk.si>
40001898:	81 c6 5c 67 00 00    	add    $0x675c,%esi
4000189e:	53                   	push   %ebx
4000189f:	83 ec 28             	sub    $0x28,%esp
    printf("=====fourteen test=====\n");
400018a2:	8d 86 a2 c2 ff ff    	lea    -0x3d5e(%esi),%eax
400018a8:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400018aa:	8d be e7 c2 ff ff    	lea    -0x3d19(%esi),%edi
400018b0:	50                   	push   %eax
400018b1:	e8 ba ea ff ff       	call   40000370 <printf>
400018b6:	89 3c 24             	mov    %edi,(%esp)
400018b9:	e8 12 f3 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400018be:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
400018c0:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400018c3:	b8 08 00 00 00       	mov    $0x8,%eax
400018c8:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400018ca:	83 c4 10             	add    $0x10,%esp
400018cd:	85 c0                	test   %eax,%eax
400018cf:	0f 85 23 01 00 00    	jne    400019f8 <fourteen+0x168>
    int len = strlen(path) + 1;
400018d5:	83 ec 0c             	sub    $0xc,%esp
400018d8:	8d ae 14 cd ff ff    	lea    -0x32ec(%esi),%ebp
400018de:	89 f3                	mov    %esi,%ebx
400018e0:	55                   	push   %ebp
400018e1:	e8 ea f2 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400018e6:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400018e8:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400018eb:	b8 08 00 00 00       	mov    $0x8,%eax
400018f0:	cd 30                	int    $0x30
400018f2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    return errno ? -1 : 0;
400018f6:	83 c4 10             	add    $0x10,%esp
400018f9:	85 c0                	test   %eax,%eax
400018fb:	0f 85 0f 01 00 00    	jne    40001a10 <fourteen+0x180>
    int len = strlen(path) + 1;
40001901:	83 ec 0c             	sub    $0xc,%esp
40001904:	8d be 34 cd ff ff    	lea    -0x32cc(%esi),%edi
4000190a:	89 f3                	mov    %esi,%ebx
4000190c:	57                   	push   %edi
4000190d:	e8 be f2 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001912:	b9 00 02 00 00       	mov    $0x200,%ecx
40001917:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001919:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000191c:	b8 04 00 00 00       	mov    $0x4,%eax
40001921:	cd 30                	int    $0x30
    if (fd < 0) {
40001923:	83 c4 10             	add    $0x10,%esp
40001926:	85 db                	test   %ebx,%ebx
40001928:	0f 88 aa 00 00 00    	js     400019d8 <fourteen+0x148>
4000192e:	85 c0                	test   %eax,%eax
40001930:	0f 85 a2 00 00 00    	jne    400019d8 <fourteen+0x148>
    asm volatile ("int %2"
40001936:	b8 05 00 00 00       	mov    $0x5,%eax
4000193b:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
4000193d:	83 ec 0c             	sub    $0xc,%esp
40001940:	8d be d4 cd ff ff    	lea    -0x322c(%esi),%edi
40001946:	89 f3                	mov    %esi,%ebx
40001948:	57                   	push   %edi
40001949:	e8 82 f2 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000194e:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
40001952:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001954:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001957:	b8 04 00 00 00       	mov    $0x4,%eax
4000195c:	cd 30                	int    $0x30
    if (fd < 0) {
4000195e:	83 c4 10             	add    $0x10,%esp
40001961:	85 db                	test   %ebx,%ebx
40001963:	78 53                	js     400019b8 <fourteen+0x128>
40001965:	85 c0                	test   %eax,%eax
40001967:	75 4f                	jne    400019b8 <fourteen+0x128>
    asm volatile ("int %2"
40001969:	b8 05 00 00 00       	mov    $0x5,%eax
4000196e:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001970:	83 ec 0c             	sub    $0xc,%esp
40001973:	8d be d8 c2 ff ff    	lea    -0x3d28(%esi),%edi
40001979:	89 f3                	mov    %esi,%ebx
4000197b:	57                   	push   %edi
4000197c:	e8 4f f2 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001981:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001983:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001986:	b8 08 00 00 00       	mov    $0x8,%eax
4000198b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000198d:	83 c4 10             	add    $0x10,%esp
40001990:	85 c0                	test   %eax,%eax
40001992:	0f 85 91 00 00 00    	jne    40001a29 <fourteen+0x199>
        printf("mkdir 12345678901234/12345678901234 succeeded!\n");
40001998:	83 ec 0c             	sub    $0xc,%esp
4000199b:	8d 86 40 ce ff ff    	lea    -0x31c0(%esi),%eax
400019a1:	89 f3                	mov    %esi,%ebx
400019a3:	50                   	push   %eax
400019a4:	e8 c7 e9 ff ff       	call   40000370 <printf>
        exit();
400019a9:	83 c4 10             	add    $0x10,%esp
}
400019ac:	83 c4 1c             	add    $0x1c,%esp
400019af:	5b                   	pop    %ebx
400019b0:	5e                   	pop    %esi
400019b1:	5f                   	pop    %edi
400019b2:	5d                   	pop    %ebp
400019b3:	c3                   	ret
400019b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf
400019b8:	83 ec 0c             	sub    $0xc,%esp
400019bb:	8d 86 04 ce ff ff    	lea    -0x31fc(%esi),%eax
400019c1:	89 f3                	mov    %esi,%ebx
400019c3:	50                   	push   %eax
400019c4:	e8 a7 e9 ff ff       	call   40000370 <printf>
        exit();
400019c9:	83 c4 10             	add    $0x10,%esp
}
400019cc:	83 c4 1c             	add    $0x1c,%esp
400019cf:	5b                   	pop    %ebx
400019d0:	5e                   	pop    %esi
400019d1:	5f                   	pop    %edi
400019d2:	5d                   	pop    %ebp
400019d3:	c3                   	ret
400019d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf
400019d8:	83 ec 0c             	sub    $0xc,%esp
400019db:	8d 86 94 cd ff ff    	lea    -0x326c(%esi),%eax
400019e1:	89 f3                	mov    %esi,%ebx
400019e3:	50                   	push   %eax
400019e4:	e8 87 e9 ff ff       	call   40000370 <printf>
        exit();
400019e9:	83 c4 10             	add    $0x10,%esp
}
400019ec:	83 c4 1c             	add    $0x1c,%esp
400019ef:	5b                   	pop    %ebx
400019f0:	5e                   	pop    %esi
400019f1:	5f                   	pop    %edi
400019f2:	5d                   	pop    %ebp
400019f3:	c3                   	ret
400019f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("mkdir 12345678901234 failed\n");
400019f8:	83 ec 0c             	sub    $0xc,%esp
400019fb:	8d 86 bb c2 ff ff    	lea    -0x3d45(%esi),%eax
40001a01:	89 f3                	mov    %esi,%ebx
40001a03:	50                   	push   %eax
40001a04:	e8 67 e9 ff ff       	call   40000370 <printf>
        exit();
40001a09:	83 c4 10             	add    $0x10,%esp
40001a0c:	eb 9e                	jmp    400019ac <fourteen+0x11c>
40001a0e:	66 90                	xchg   %ax,%ax
        printf("mkdir 12345678901234/123456789012345 failed\n");
40001a10:	83 ec 0c             	sub    $0xc,%esp
40001a13:	8d 86 64 cd ff ff    	lea    -0x329c(%esi),%eax
40001a19:	89 f3                	mov    %esi,%ebx
40001a1b:	50                   	push   %eax
40001a1c:	e8 4f e9 ff ff       	call   40000370 <printf>
        exit();
40001a21:	83 c4 10             	add    $0x10,%esp
40001a24:	e9 83 ff ff ff       	jmp    400019ac <fourteen+0x11c>
    int len = strlen(path) + 1;
40001a29:	83 ec 0c             	sub    $0xc,%esp
40001a2c:	89 f3                	mov    %esi,%ebx
40001a2e:	55                   	push   %ebp
40001a2f:	e8 9c f1 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001a34:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40001a36:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001a39:	b8 08 00 00 00       	mov    $0x8,%eax
40001a3e:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001a40:	83 c4 10             	add    $0x10,%esp
40001a43:	85 c0                	test   %eax,%eax
40001a45:	75 19                	jne    40001a60 <fourteen+0x1d0>
        printf("mkdir 12345678901234/123456789012345 succeeded!\n");
40001a47:	83 ec 0c             	sub    $0xc,%esp
40001a4a:	8d 86 70 ce ff ff    	lea    -0x3190(%esi),%eax
40001a50:	89 f3                	mov    %esi,%ebx
40001a52:	50                   	push   %eax
40001a53:	e8 18 e9 ff ff       	call   40000370 <printf>
        exit();
40001a58:	83 c4 10             	add    $0x10,%esp
40001a5b:	e9 4c ff ff ff       	jmp    400019ac <fourteen+0x11c>
    printf("=====fourteen ok=====\n\n");
40001a60:	83 ec 0c             	sub    $0xc,%esp
40001a63:	8d 86 f6 c2 ff ff    	lea    -0x3d0a(%esi),%eax
40001a69:	89 f3                	mov    %esi,%ebx
40001a6b:	50                   	push   %eax
40001a6c:	e8 ff e8 ff ff       	call   40000370 <printf>
40001a71:	83 c4 10             	add    $0x10,%esp
40001a74:	e9 33 ff ff ff       	jmp    400019ac <fourteen+0x11c>
40001a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40001a80 <bigfile2>:
{
40001a80:	55                   	push   %ebp
40001a81:	57                   	push   %edi
40001a82:	56                   	push   %esi
40001a83:	e8 64 19 00 00       	call   400033ec <__x86.get_pc_thunk.si>
40001a88:	81 c6 6c 65 00 00    	add    $0x656c,%esi
40001a8e:	53                   	push   %ebx
40001a8f:	83 ec 28             	sub    $0x28,%esp
    printf("=====bigfile test=====\n");
40001a92:	8d 86 0e c3 ff ff    	lea    -0x3cf2(%esi),%eax
40001a98:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001a9a:	8d be 34 c3 ff ff    	lea    -0x3ccc(%esi),%edi
40001aa0:	50                   	push   %eax
40001aa1:	e8 ca e8 ff ff       	call   40000370 <printf>
40001aa6:	89 3c 24             	mov    %edi,(%esp)
40001aa9:	e8 22 f1 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001aae:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
40001ab2:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001ab4:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001ab7:	b8 0b 00 00 00       	mov    $0xb,%eax
40001abc:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001abe:	89 f3                	mov    %esi,%ebx
40001ac0:	89 3c 24             	mov    %edi,(%esp)
40001ac3:	e8 08 f1 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001ac8:	b9 02 02 00 00       	mov    $0x202,%ecx
40001acd:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001acf:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001ad2:	b8 04 00 00 00       	mov    $0x4,%eax
40001ad7:	cd 30                	int    $0x30
    return errno ? -1 : fd;
40001ad9:	83 c4 10             	add    $0x10,%esp
    if (fd < 0) {
40001adc:	85 c0                	test   %eax,%eax
40001ade:	0f 85 5c 01 00 00    	jne    40001c40 <bigfile2+0x1c0>
    for (i = 0; i < 20; i++) {
40001ae4:	31 ff                	xor    %edi,%edi
40001ae6:	8d ae 4c 00 00 00    	lea    0x4c(%esi),%ebp
    if (fd < 0) {
40001aec:	85 db                	test   %ebx,%ebx
40001aee:	0f 88 4c 01 00 00    	js     40001c40 <bigfile2+0x1c0>
40001af4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
40001af8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001aff:	00 
        memset(buf, i, 600);
40001b00:	83 ec 04             	sub    $0x4,%esp
40001b03:	89 f3                	mov    %esi,%ebx
40001b05:	68 58 02 00 00       	push   $0x258
40001b0a:	57                   	push   %edi
40001b0b:	55                   	push   %ebp
40001b0c:	e8 1f f4 ff ff       	call   40000f30 <memset>
    asm volatile ("int %2"
40001b11:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001b15:	b8 07 00 00 00       	mov    $0x7,%eax
40001b1a:	89 e9                	mov    %ebp,%ecx
40001b1c:	ba 58 02 00 00       	mov    $0x258,%edx
40001b21:	cd 30                	int    $0x30
        if (write(fd, buf, 600) != 600) {
40001b23:	83 c4 10             	add    $0x10,%esp
40001b26:	81 fb 58 02 00 00    	cmp    $0x258,%ebx
40001b2c:	0f 85 ee 00 00 00    	jne    40001c20 <bigfile2+0x1a0>
40001b32:	85 c0                	test   %eax,%eax
40001b34:	0f 85 e6 00 00 00    	jne    40001c20 <bigfile2+0x1a0>
    for (i = 0; i < 20; i++) {
40001b3a:	83 c7 01             	add    $0x1,%edi
40001b3d:	83 ff 14             	cmp    $0x14,%edi
40001b40:	75 be                	jne    40001b00 <bigfile2+0x80>
    asm volatile ("int %2"
40001b42:	8b 54 24 04          	mov    0x4(%esp),%edx
40001b46:	b8 05 00 00 00       	mov    $0x5,%eax
40001b4b:	89 d3                	mov    %edx,%ebx
40001b4d:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001b4f:	83 ec 0c             	sub    $0xc,%esp
40001b52:	89 f3                	mov    %esi,%ebx
40001b54:	8b 7c 24 18          	mov    0x18(%esp),%edi
40001b58:	57                   	push   %edi
40001b59:	e8 72 f0 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001b5e:	31 c9                	xor    %ecx,%ecx
40001b60:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001b62:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001b65:	b8 04 00 00 00       	mov    $0x4,%eax
40001b6a:	cd 30                	int    $0x30
40001b6c:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    if (fd < 0) {
40001b70:	83 c4 10             	add    $0x10,%esp
40001b73:	85 db                	test   %ebx,%ebx
40001b75:	0f 88 e5 00 00 00    	js     40001c60 <bigfile2+0x1e0>
40001b7b:	85 c0                	test   %eax,%eax
40001b7d:	0f 85 dd 00 00 00    	jne    40001c60 <bigfile2+0x1e0>
    asm volatile ("int %2"
40001b83:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001b87:	b8 06 00 00 00       	mov    $0x6,%eax
40001b8c:	ba 2c 01 00 00       	mov    $0x12c,%edx
40001b91:	89 e9                	mov    %ebp,%ecx
40001b93:	cd 30                	int    $0x30
40001b95:	89 da                	mov    %ebx,%edx
40001b97:	89 c1                	mov    %eax,%ecx
    return errno ? -1 : ret;
40001b99:	85 c0                	test   %eax,%eax
40001b9b:	75 65                	jne    40001c02 <bigfile2+0x182>
        if (buf[0] != i / 2 || buf[299] != i / 2) {
40001b9d:	8d 05 4c 00 00 00    	lea    0x4c,%eax
    asm volatile ("int %2"
40001ba3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    for (i = 0;; i++) {
40001ba7:	31 ff                	xor    %edi,%edi
40001ba9:	89 e9                	mov    %ebp,%ecx
40001bab:	89 c5                	mov    %eax,%ebp
40001bad:	eb 4f                	jmp    40001bfe <bigfile2+0x17e>
40001baf:	90                   	nop
        if (cc == 0)
40001bb0:	0f 84 e0 00 00 00    	je     40001c96 <bigfile2+0x216>
        if (cc != 300) {
40001bb6:	81 fa 2c 01 00 00    	cmp    $0x12c,%edx
40001bbc:	0f 85 04 01 00 00    	jne    40001cc6 <bigfile2+0x246>
        if (buf[0] != i / 2 || buf[299] != i / 2) {
40001bc2:	89 fb                	mov    %edi,%ebx
40001bc4:	0f be 04 2e          	movsbl (%esi,%ebp,1),%eax
40001bc8:	d1 fb                	sar    $1,%ebx
40001bca:	39 d8                	cmp    %ebx,%eax
40001bcc:	0f 85 ae 00 00 00    	jne    40001c80 <bigfile2+0x200>
40001bd2:	0f be 9c 2e 2b 01 00 	movsbl 0x12b(%esi,%ebp,1),%ebx
40001bd9:	00 
40001bda:	39 d8                	cmp    %ebx,%eax
40001bdc:	0f 85 9e 00 00 00    	jne    40001c80 <bigfile2+0x200>
        total += cc;
40001be2:	81 44 24 08 2c 01 00 	addl   $0x12c,0x8(%esp)
40001be9:	00 
40001bea:	8b 5c 24 04          	mov    0x4(%esp),%ebx
    for (i = 0;; i++) {
40001bee:	83 c7 01             	add    $0x1,%edi
40001bf1:	b8 06 00 00 00       	mov    $0x6,%eax
40001bf6:	cd 30                	int    $0x30
40001bf8:	89 da                	mov    %ebx,%edx
    return errno ? -1 : ret;
40001bfa:	85 c0                	test   %eax,%eax
40001bfc:	75 04                	jne    40001c02 <bigfile2+0x182>
        if (cc < 0) {
40001bfe:	85 d2                	test   %edx,%edx
40001c00:	79 ae                	jns    40001bb0 <bigfile2+0x130>
            printf("read bigfile failed\n");
40001c02:	83 ec 0c             	sub    $0xc,%esp
40001c05:	8d 86 67 c3 ff ff    	lea    -0x3c99(%esi),%eax
40001c0b:	89 f3                	mov    %esi,%ebx
40001c0d:	50                   	push   %eax
40001c0e:	e8 5d e7 ff ff       	call   40000370 <printf>
            exit();
40001c13:	83 c4 10             	add    $0x10,%esp
40001c16:	eb 1c                	jmp    40001c34 <bigfile2+0x1b4>
40001c18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001c1f:	00 
            printf("write bigfile failed\n");
40001c20:	83 ec 0c             	sub    $0xc,%esp
40001c23:	8d 86 3c c3 ff ff    	lea    -0x3cc4(%esi),%eax
40001c29:	89 f3                	mov    %esi,%ebx
40001c2b:	50                   	push   %eax
40001c2c:	e8 3f e7 ff ff       	call   40000370 <printf>
            exit();
40001c31:	83 c4 10             	add    $0x10,%esp
}
40001c34:	83 c4 1c             	add    $0x1c,%esp
40001c37:	5b                   	pop    %ebx
40001c38:	5e                   	pop    %esi
40001c39:	5f                   	pop    %edi
40001c3a:	5d                   	pop    %ebp
40001c3b:	c3                   	ret
40001c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("cannot create bigfile");
40001c40:	83 ec 0c             	sub    $0xc,%esp
40001c43:	8d 86 26 c3 ff ff    	lea    -0x3cda(%esi),%eax
40001c49:	89 f3                	mov    %esi,%ebx
40001c4b:	50                   	push   %eax
40001c4c:	e8 1f e7 ff ff       	call   40000370 <printf>
        exit();
40001c51:	83 c4 10             	add    $0x10,%esp
}
40001c54:	83 c4 1c             	add    $0x1c,%esp
40001c57:	5b                   	pop    %ebx
40001c58:	5e                   	pop    %esi
40001c59:	5f                   	pop    %edi
40001c5a:	5d                   	pop    %ebp
40001c5b:	c3                   	ret
40001c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("cannot open bigfile\n");
40001c60:	83 ec 0c             	sub    $0xc,%esp
40001c63:	8d 86 52 c3 ff ff    	lea    -0x3cae(%esi),%eax
40001c69:	89 f3                	mov    %esi,%ebx
40001c6b:	50                   	push   %eax
40001c6c:	e8 ff e6 ff ff       	call   40000370 <printf>
        exit();
40001c71:	83 c4 10             	add    $0x10,%esp
40001c74:	eb be                	jmp    40001c34 <bigfile2+0x1b4>
40001c76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001c7d:	00 
40001c7e:	66 90                	xchg   %ax,%ax
            printf("read bigfile wrong data\n");
40001c80:	83 ec 0c             	sub    $0xc,%esp
40001c83:	8d 86 90 c3 ff ff    	lea    -0x3c70(%esi),%eax
40001c89:	89 f3                	mov    %esi,%ebx
40001c8b:	50                   	push   %eax
40001c8c:	e8 df e6 ff ff       	call   40000370 <printf>
            exit();
40001c91:	83 c4 10             	add    $0x10,%esp
40001c94:	eb 9e                	jmp    40001c34 <bigfile2+0x1b4>
    asm volatile ("int %2"
40001c96:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40001c9a:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001c9e:	b8 05 00 00 00       	mov    $0x5,%eax
40001ca3:	cd 30                	int    $0x30
    if (total != 20 * 600) {
40001ca5:	81 f9 e0 2e 00 00    	cmp    $0x2ee0,%ecx
40001cab:	74 32                	je     40001cdf <bigfile2+0x25f>
        printf("read bigfile wrong total\n");
40001cad:	83 ec 0c             	sub    $0xc,%esp
40001cb0:	8d 86 a9 c3 ff ff    	lea    -0x3c57(%esi),%eax
40001cb6:	89 f3                	mov    %esi,%ebx
40001cb8:	50                   	push   %eax
40001cb9:	e8 b2 e6 ff ff       	call   40000370 <printf>
        exit();
40001cbe:	83 c4 10             	add    $0x10,%esp
40001cc1:	e9 6e ff ff ff       	jmp    40001c34 <bigfile2+0x1b4>
            printf("short read bigfile\n");
40001cc6:	83 ec 0c             	sub    $0xc,%esp
40001cc9:	8d 86 7c c3 ff ff    	lea    -0x3c84(%esi),%eax
40001ccf:	89 f3                	mov    %esi,%ebx
40001cd1:	50                   	push   %eax
40001cd2:	e8 99 e6 ff ff       	call   40000370 <printf>
            exit();
40001cd7:	83 c4 10             	add    $0x10,%esp
40001cda:	e9 55 ff ff ff       	jmp    40001c34 <bigfile2+0x1b4>
    int len = strlen(path) + 1;
40001cdf:	83 ec 0c             	sub    $0xc,%esp
40001ce2:	89 f3                	mov    %esi,%ebx
40001ce4:	8b 7c 24 18          	mov    0x18(%esp),%edi
40001ce8:	57                   	push   %edi
40001ce9:	e8 e2 ee ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001cee:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001cf0:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001cf3:	b8 0b 00 00 00       	mov    $0xb,%eax
40001cf8:	cd 30                	int    $0x30
    printf("=====bigfile test ok=====\n\n");
40001cfa:	8d 86 c3 c3 ff ff    	lea    -0x3c3d(%esi),%eax
40001d00:	89 f3                	mov    %esi,%ebx
40001d02:	89 04 24             	mov    %eax,(%esp)
40001d05:	e8 66 e6 ff ff       	call   40000370 <printf>
40001d0a:	83 c4 10             	add    $0x10,%esp
40001d0d:	e9 22 ff ff ff       	jmp    40001c34 <bigfile2+0x1b4>
40001d12:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001d19:	00 
40001d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001d20 <subdir>:
{
40001d20:	55                   	push   %ebp
40001d21:	e8 ce 16 00 00       	call   400033f4 <__x86.get_pc_thunk.bp>
40001d26:	81 c5 ce 62 00 00    	add    $0x62ce,%ebp
40001d2c:	57                   	push   %edi
40001d2d:	56                   	push   %esi
40001d2e:	53                   	push   %ebx
40001d2f:	83 ec 38             	sub    $0x38,%esp
    printf("=====subdir test=====\n");
40001d32:	8d 85 df c3 ff ff    	lea    -0x3c21(%ebp),%eax
40001d38:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40001d3a:	8d bd 71 c4 ff ff    	lea    -0x3b8f(%ebp),%edi
40001d40:	50                   	push   %eax
40001d41:	e8 2a e6 ff ff       	call   40000370 <printf>
40001d46:	89 3c 24             	mov    %edi,(%esp)
40001d49:	e8 82 ee ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001d4e:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001d50:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001d53:	b8 0b 00 00 00       	mov    $0xb,%eax
40001d58:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001d5a:	8d b5 f4 c4 ff ff    	lea    -0x3b0c(%ebp),%esi
40001d60:	89 eb                	mov    %ebp,%ebx
40001d62:	89 34 24             	mov    %esi,(%esp)
40001d65:	89 74 24 18          	mov    %esi,0x18(%esp)
40001d69:	e8 62 ee ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001d6e:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001d70:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001d73:	b8 08 00 00 00       	mov    $0x8,%eax
40001d78:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001d7a:	83 c4 10             	add    $0x10,%esp
40001d7d:	85 c0                	test   %eax,%eax
40001d7f:	0f 85 ab 00 00 00    	jne    40001e30 <subdir+0x110>
    int len = strlen(path) + 1;
40001d85:	83 ec 0c             	sub    $0xc,%esp
40001d88:	8d b5 2c c4 ff ff    	lea    -0x3bd4(%ebp),%esi
40001d8e:	89 eb                	mov    %ebp,%ebx
40001d90:	89 74 24 18          	mov    %esi,0x18(%esp)
40001d94:	56                   	push   %esi
40001d95:	e8 36 ee ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001d9a:	89 f3                	mov    %esi,%ebx
40001d9c:	b9 02 02 00 00       	mov    $0x202,%ecx
    int len = strlen(path) + 1;
40001da1:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001da4:	b8 04 00 00 00       	mov    $0x4,%eax
40001da9:	cd 30                	int    $0x30
40001dab:	89 de                	mov    %ebx,%esi
    if (fd < 0) {
40001dad:	83 c4 10             	add    $0x10,%esp
40001db0:	85 db                	test   %ebx,%ebx
40001db2:	78 5c                	js     40001e10 <subdir+0xf0>
40001db4:	85 c0                	test   %eax,%eax
40001db6:	75 58                	jne    40001e10 <subdir+0xf0>
    asm volatile ("int %2"
40001db8:	b8 07 00 00 00       	mov    $0x7,%eax
40001dbd:	89 f9                	mov    %edi,%ecx
40001dbf:	ba 02 00 00 00       	mov    $0x2,%edx
40001dc4:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001dc6:	bf 05 00 00 00       	mov    $0x5,%edi
40001dcb:	89 f3                	mov    %esi,%ebx
40001dcd:	89 f8                	mov    %edi,%eax
40001dcf:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001dd1:	83 ec 0c             	sub    $0xc,%esp
40001dd4:	89 eb                	mov    %ebp,%ebx
40001dd6:	8b 74 24 14          	mov    0x14(%esp),%esi
40001dda:	56                   	push   %esi
40001ddb:	e8 f0 ed ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001de0:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001de2:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001de5:	b8 0b 00 00 00       	mov    $0xb,%eax
40001dea:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001dec:	83 c4 10             	add    $0x10,%esp
40001def:	85 c0                	test   %eax,%eax
40001df1:	75 5d                	jne    40001e50 <subdir+0x130>
        printf("unlink dd (non-empty dir) succeeded!\n");
40001df3:	83 ec 0c             	sub    $0xc,%esp
40001df6:	8d 85 a4 ce ff ff    	lea    -0x315c(%ebp),%eax
40001dfc:	89 eb                	mov    %ebp,%ebx
40001dfe:	50                   	push   %eax
40001dff:	e8 6c e5 ff ff       	call   40000370 <printf>
        exit();
40001e04:	83 c4 10             	add    $0x10,%esp
}
40001e07:	83 c4 2c             	add    $0x2c,%esp
40001e0a:	5b                   	pop    %ebx
40001e0b:	5e                   	pop    %esi
40001e0c:	5f                   	pop    %edi
40001e0d:	5d                   	pop    %ebp
40001e0e:	c3                   	ret
40001e0f:	90                   	nop
        printf("create dd/ff failed\n");
40001e10:	83 ec 0c             	sub    $0xc,%esp
40001e13:	8d 85 0e c4 ff ff    	lea    -0x3bf2(%ebp),%eax
40001e19:	89 eb                	mov    %ebp,%ebx
40001e1b:	50                   	push   %eax
40001e1c:	e8 4f e5 ff ff       	call   40000370 <printf>
        exit();
40001e21:	83 c4 10             	add    $0x10,%esp
}
40001e24:	83 c4 2c             	add    $0x2c,%esp
40001e27:	5b                   	pop    %ebx
40001e28:	5e                   	pop    %esi
40001e29:	5f                   	pop    %edi
40001e2a:	5d                   	pop    %ebp
40001e2b:	c3                   	ret
40001e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("subdir mkdir dd failed\n");
40001e30:	83 ec 0c             	sub    $0xc,%esp
40001e33:	8d 85 f6 c3 ff ff    	lea    -0x3c0a(%ebp),%eax
40001e39:	89 eb                	mov    %ebp,%ebx
40001e3b:	50                   	push   %eax
40001e3c:	e8 2f e5 ff ff       	call   40000370 <printf>
        exit();
40001e41:	83 c4 10             	add    $0x10,%esp
40001e44:	eb c1                	jmp    40001e07 <subdir+0xe7>
40001e46:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001e4d:	00 
40001e4e:	66 90                	xchg   %ax,%ax
    int len = strlen(path) + 1;
40001e50:	83 ec 0c             	sub    $0xc,%esp
40001e53:	8d b5 23 c4 ff ff    	lea    -0x3bdd(%ebp),%esi
40001e59:	89 eb                	mov    %ebp,%ebx
40001e5b:	89 74 24 24          	mov    %esi,0x24(%esp)
40001e5f:	56                   	push   %esi
40001e60:	e8 6b ed ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001e65:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001e67:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001e6a:	b8 08 00 00 00       	mov    $0x8,%eax
40001e6f:	cd 30                	int    $0x30
40001e71:	89 44 24 20          	mov    %eax,0x20(%esp)
    return errno ? -1 : 0;
40001e75:	83 c4 10             	add    $0x10,%esp
40001e78:	85 c0                	test   %eax,%eax
40001e7a:	0f 85 36 04 00 00    	jne    400022b6 <subdir+0x596>
    int len = strlen(path) + 1;
40001e80:	83 ec 0c             	sub    $0xc,%esp
40001e83:	8d b5 29 c4 ff ff    	lea    -0x3bd7(%ebp),%esi
40001e89:	89 eb                	mov    %ebp,%ebx
40001e8b:	89 74 24 20          	mov    %esi,0x20(%esp)
40001e8f:	56                   	push   %esi
40001e90:	e8 3b ed ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001e95:	89 f3                	mov    %esi,%ebx
40001e97:	b9 02 02 00 00       	mov    $0x202,%ecx
    int len = strlen(path) + 1;
40001e9c:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001e9f:	b8 04 00 00 00       	mov    $0x4,%eax
40001ea4:	cd 30                	int    $0x30
40001ea6:	89 de                	mov    %ebx,%esi
    if (fd < 0) {
40001ea8:	83 c4 10             	add    $0x10,%esp
40001eab:	85 db                	test   %ebx,%ebx
40001ead:	0f 88 8f 00 00 00    	js     40001f42 <subdir+0x222>
40001eb3:	85 c0                	test   %eax,%eax
40001eb5:	0f 85 87 00 00 00    	jne    40001f42 <subdir+0x222>
    asm volatile ("int %2"
40001ebb:	8d 8d 65 c4 ff ff    	lea    -0x3b9b(%ebp),%ecx
40001ec1:	b8 07 00 00 00       	mov    $0x7,%eax
40001ec6:	ba 02 00 00 00       	mov    $0x2,%edx
40001ecb:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001ecd:	89 f8                	mov    %edi,%eax
40001ecf:	89 f3                	mov    %esi,%ebx
40001ed1:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001ed3:	83 ec 0c             	sub    $0xc,%esp
40001ed6:	8d b5 68 c4 ff ff    	lea    -0x3b98(%ebp),%esi
40001edc:	89 eb                	mov    %ebp,%ebx
40001ede:	56                   	push   %esi
40001edf:	e8 ec ec ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001ee4:	8b 4c 24 20          	mov    0x20(%esp),%ecx
40001ee8:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001eea:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001eed:	b8 04 00 00 00       	mov    $0x4,%eax
40001ef2:	cd 30                	int    $0x30
40001ef4:	89 de                	mov    %ebx,%esi
    if (fd < 0) {
40001ef6:	83 c4 10             	add    $0x10,%esp
40001ef9:	85 db                	test   %ebx,%ebx
40001efb:	78 5e                	js     40001f5b <subdir+0x23b>
40001efd:	85 c0                	test   %eax,%eax
40001eff:	75 5a                	jne    40001f5b <subdir+0x23b>
    asm volatile ("int %2"
40001f01:	8d 8d 4c 00 00 00    	lea    0x4c(%ebp),%ecx
40001f07:	b8 06 00 00 00       	mov    $0x6,%eax
40001f0c:	ba 00 20 00 00       	mov    $0x2000,%edx
40001f11:	89 4c 24 10          	mov    %ecx,0x10(%esp)
40001f15:	cd 30                	int    $0x30
    if (cc != 2 || buf[0] != 'f') {
40001f17:	83 fb 02             	cmp    $0x2,%ebx
40001f1a:	75 0d                	jne    40001f29 <subdir+0x209>
40001f1c:	85 c0                	test   %eax,%eax
40001f1e:	75 09                	jne    40001f29 <subdir+0x209>
40001f20:	80 bd 4c 00 00 00 66 	cmpb   $0x66,0x4c(%ebp)
40001f27:	74 4b                	je     40001f74 <subdir+0x254>
        printf("dd/dd/../ff wrong content\n");
40001f29:	83 ec 0c             	sub    $0xc,%esp
40001f2c:	8d 85 8d c4 ff ff    	lea    -0x3b73(%ebp),%eax
40001f32:	89 eb                	mov    %ebp,%ebx
40001f34:	50                   	push   %eax
40001f35:	e8 36 e4 ff ff       	call   40000370 <printf>
        exit();
40001f3a:	83 c4 10             	add    $0x10,%esp
40001f3d:	e9 c5 fe ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("create dd/dd/ff failed\n");
40001f42:	83 ec 0c             	sub    $0xc,%esp
40001f45:	8d 85 4d c4 ff ff    	lea    -0x3bb3(%ebp),%eax
40001f4b:	89 eb                	mov    %ebp,%ebx
40001f4d:	50                   	push   %eax
40001f4e:	e8 1d e4 ff ff       	call   40000370 <printf>
        exit();
40001f53:	83 c4 10             	add    $0x10,%esp
40001f56:	e9 ac fe ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("open dd/dd/../ff failed\n");
40001f5b:	83 ec 0c             	sub    $0xc,%esp
40001f5e:	8d 85 74 c4 ff ff    	lea    -0x3b8c(%ebp),%eax
40001f64:	89 eb                	mov    %ebp,%ebx
40001f66:	50                   	push   %eax
40001f67:	e8 04 e4 ff ff       	call   40000370 <printf>
        exit();
40001f6c:	83 c4 10             	add    $0x10,%esp
40001f6f:	e9 93 fe ff ff       	jmp    40001e07 <subdir+0xe7>
    asm volatile ("int %2"
40001f74:	b8 05 00 00 00       	mov    $0x5,%eax
40001f79:	89 f3                	mov    %esi,%ebx
40001f7b:	cd 30                	int    $0x30
    int oldlen = strlen(old) + 1;
40001f7d:	83 ec 0c             	sub    $0xc,%esp
40001f80:	89 eb                	mov    %ebp,%ebx
    int newlen = strlen(new) + 1;
40001f82:	8d bd a8 c4 ff ff    	lea    -0x3b58(%ebp),%edi
    int oldlen = strlen(old) + 1;
40001f88:	ff 74 24 20          	push   0x20(%esp)
40001f8c:	e8 3f ec ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
40001f91:	89 3c 24             	mov    %edi,(%esp)
    int oldlen = strlen(old) + 1;
40001f94:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
40001f96:	e8 35 ec ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
40001f9b:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
40001f9e:	8b 5c 24 24          	mov    0x24(%esp),%ebx
40001fa2:	89 f9                	mov    %edi,%ecx
    int newlen = strlen(new) + 1;
40001fa4:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40001fa7:	b8 0a 00 00 00       	mov    $0xa,%eax
40001fac:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001fae:	83 c4 10             	add    $0x10,%esp
40001fb1:	85 c0                	test   %eax,%eax
40001fb3:	0f 85 c7 04 00 00    	jne    40002480 <subdir+0x760>
    int len = strlen(path) + 1;
40001fb9:	83 ec 0c             	sub    $0xc,%esp
40001fbc:	89 eb                	mov    %ebp,%ebx
40001fbe:	8b 74 24 20          	mov    0x20(%esp),%esi
40001fc2:	56                   	push   %esi
40001fc3:	e8 08 ec ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001fc8:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001fca:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001fcd:	b8 0b 00 00 00       	mov    $0xb,%eax
40001fd2:	cd 30                	int    $0x30
40001fd4:	89 c6                	mov    %eax,%esi
    return errno ? -1 : 0;
40001fd6:	83 c4 10             	add    $0x10,%esp
40001fd9:	85 c0                	test   %eax,%eax
40001fdb:	0f 85 86 04 00 00    	jne    40002467 <subdir+0x747>
    int len = strlen(path) + 1;
40001fe1:	83 ec 0c             	sub    $0xc,%esp
40001fe4:	89 eb                	mov    %ebp,%ebx
40001fe6:	ff 74 24 20          	push   0x20(%esp)
40001fea:	e8 e1 eb ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40001fef:	8b 5c 24 24          	mov    0x24(%esp),%ebx
40001ff3:	89 f1                	mov    %esi,%ecx
    int len = strlen(path) + 1;
40001ff5:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001ff8:	b8 04 00 00 00       	mov    $0x4,%eax
40001ffd:	cd 30                	int    $0x30
    if (open("dd/dd/ff", O_RDONLY) >= 0) {
40001fff:	83 c4 10             	add    $0x10,%esp
40002002:	85 db                	test   %ebx,%ebx
40002004:	78 08                	js     4000200e <subdir+0x2ee>
40002006:	85 c0                	test   %eax,%eax
40002008:	0f 84 c1 02 00 00    	je     400022cf <subdir+0x5af>
    int len = strlen(path) + 1;
4000200e:	83 ec 0c             	sub    $0xc,%esp
40002011:	89 eb                	mov    %ebp,%ebx
    asm volatile ("int %2"
40002013:	be 09 00 00 00       	mov    $0x9,%esi
    int len = strlen(path) + 1;
40002018:	ff 74 24 14          	push   0x14(%esp)
4000201c:	e8 af eb ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002021:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    int len = strlen(path) + 1;
40002025:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002028:	89 f0                	mov    %esi,%eax
4000202a:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000202c:	83 c4 10             	add    $0x10,%esp
4000202f:	85 c0                	test   %eax,%eax
40002031:	0f 85 fe 03 00 00    	jne    40002435 <subdir+0x715>
    int len = strlen(path) + 1;
40002037:	83 ec 0c             	sub    $0xc,%esp
4000203a:	8d 95 cb c4 ff ff    	lea    -0x3b35(%ebp),%edx
40002040:	89 eb                	mov    %ebp,%ebx
40002042:	52                   	push   %edx
40002043:	89 54 24 2c          	mov    %edx,0x2c(%esp)
40002047:	e8 84 eb ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000204c:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
    int len = strlen(path) + 1;
40002050:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002053:	89 f0                	mov    %esi,%eax
40002055:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002057:	83 c4 10             	add    $0x10,%esp
4000205a:	85 c0                	test   %eax,%eax
4000205c:	0f 85 ba 03 00 00    	jne    4000241c <subdir+0x6fc>
    int len = strlen(path) + 1;
40002062:	83 ec 0c             	sub    $0xc,%esp
40002065:	8d 95 e8 c4 ff ff    	lea    -0x3b18(%ebp),%edx
4000206b:	89 eb                	mov    %ebp,%ebx
4000206d:	52                   	push   %edx
4000206e:	89 54 24 2c          	mov    %edx,0x2c(%esp)
40002072:	e8 59 eb ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002077:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
    int len = strlen(path) + 1;
4000207b:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000207e:	89 f0                	mov    %esi,%eax
40002080:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002082:	83 c4 10             	add    $0x10,%esp
40002085:	85 c0                	test   %eax,%eax
40002087:	0f 85 8f 03 00 00    	jne    4000241c <subdir+0x6fc>
    int len = strlen(path) + 1;
4000208d:	83 ec 0c             	sub    $0xc,%esp
40002090:	8d 95 11 c5 ff ff    	lea    -0x3aef(%ebp),%edx
40002096:	89 eb                	mov    %ebp,%ebx
40002098:	52                   	push   %edx
40002099:	89 54 24 2c          	mov    %edx,0x2c(%esp)
4000209d:	e8 2e eb ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400020a2:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
    int len = strlen(path) + 1;
400020a6:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400020a9:	89 f0                	mov    %esi,%eax
400020ab:	cd 30                	int    $0x30
400020ad:	89 c6                	mov    %eax,%esi
    return errno ? -1 : 0;
400020af:	83 c4 10             	add    $0x10,%esp
400020b2:	85 c0                	test   %eax,%eax
400020b4:	0f 85 49 03 00 00    	jne    40002403 <subdir+0x6e3>
    int len = strlen(path) + 1;
400020ba:	83 ec 0c             	sub    $0xc,%esp
400020bd:	89 eb                	mov    %ebp,%ebx
400020bf:	57                   	push   %edi
400020c0:	e8 0b eb ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400020c5:	89 fb                	mov    %edi,%ebx
400020c7:	89 f1                	mov    %esi,%ecx
    int len = strlen(path) + 1;
400020c9:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400020cc:	b8 04 00 00 00       	mov    $0x4,%eax
400020d1:	cd 30                	int    $0x30
400020d3:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
    if (fd < 0) {
400020d7:	83 c4 10             	add    $0x10,%esp
400020da:	85 db                	test   %ebx,%ebx
400020dc:	0f 88 06 02 00 00    	js     400022e8 <subdir+0x5c8>
400020e2:	85 c0                	test   %eax,%eax
400020e4:	0f 85 fe 01 00 00    	jne    400022e8 <subdir+0x5c8>
    asm volatile ("int %2"
400020ea:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400020ee:	8b 4c 24 10          	mov    0x10(%esp),%ecx
400020f2:	b8 06 00 00 00       	mov    $0x6,%eax
400020f7:	ba 00 20 00 00       	mov    $0x2000,%edx
400020fc:	cd 30                	int    $0x30
    if (read(fd, buf, sizeof(buf)) != 2) {
400020fe:	83 fb 02             	cmp    $0x2,%ebx
40002101:	0f 85 96 01 00 00    	jne    4000229d <subdir+0x57d>
40002107:	85 c0                	test   %eax,%eax
40002109:	0f 85 8e 01 00 00    	jne    4000229d <subdir+0x57d>
    asm volatile ("int %2"
4000210f:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40002113:	b8 05 00 00 00       	mov    $0x5,%eax
40002118:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
4000211a:	83 ec 0c             	sub    $0xc,%esp
4000211d:	89 eb                	mov    %ebp,%ebx
4000211f:	ff 74 24 20          	push   0x20(%esp)
40002123:	e8 a8 ea ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002128:	8b 5c 24 24          	mov    0x24(%esp),%ebx
4000212c:	89 f1                	mov    %esi,%ecx
    int len = strlen(path) + 1;
4000212e:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002131:	b8 04 00 00 00       	mov    $0x4,%eax
40002136:	cd 30                	int    $0x30
    if (open("dd/dd/ff", O_RDONLY) >= 0) {
40002138:	83 c4 10             	add    $0x10,%esp
4000213b:	85 db                	test   %ebx,%ebx
4000213d:	78 08                	js     40002147 <subdir+0x427>
4000213f:	85 c0                	test   %eax,%eax
40002141:	0f 84 07 03 00 00    	je     4000244e <subdir+0x72e>
    int len = strlen(path) + 1;
40002147:	8d 9d 5c c5 ff ff    	lea    -0x3aa4(%ebp),%ebx
4000214d:	83 ec 0c             	sub    $0xc,%esp
40002150:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
40002154:	89 de                	mov    %ebx,%esi
40002156:	53                   	push   %ebx
40002157:	89 eb                	mov    %ebp,%ebx
40002159:	e8 72 ea ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000215e:	b9 02 02 00 00       	mov    $0x202,%ecx
40002163:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002165:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002168:	b8 04 00 00 00       	mov    $0x4,%eax
4000216d:	cd 30                	int    $0x30
    if (open("dd/ff/ff", O_CREATE | O_RDWR) >= 0) {
4000216f:	83 c4 10             	add    $0x10,%esp
40002172:	85 db                	test   %ebx,%ebx
40002174:	78 08                	js     4000217e <subdir+0x45e>
40002176:	85 c0                	test   %eax,%eax
40002178:	0f 84 eb 01 00 00    	je     40002369 <subdir+0x649>
    int len = strlen(path) + 1;
4000217e:	8d 9d 81 c5 ff ff    	lea    -0x3a7f(%ebp),%ebx
40002184:	83 ec 0c             	sub    $0xc,%esp
40002187:	89 5c 24 20          	mov    %ebx,0x20(%esp)
4000218b:	89 de                	mov    %ebx,%esi
4000218d:	53                   	push   %ebx
4000218e:	89 eb                	mov    %ebp,%ebx
40002190:	e8 3b ea ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002195:	b9 02 02 00 00       	mov    $0x202,%ecx
4000219a:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000219c:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000219f:	b8 04 00 00 00       	mov    $0x4,%eax
400021a4:	cd 30                	int    $0x30
    if (open("dd/xx/ff", O_CREATE | O_RDWR) >= 0) {
400021a6:	83 c4 10             	add    $0x10,%esp
400021a9:	85 db                	test   %ebx,%ebx
400021ab:	78 08                	js     400021b5 <subdir+0x495>
400021ad:	85 c0                	test   %eax,%eax
400021af:	0f 84 cd 01 00 00    	je     40002382 <subdir+0x662>
    int len = strlen(path) + 1;
400021b5:	83 ec 0c             	sub    $0xc,%esp
400021b8:	89 eb                	mov    %ebp,%ebx
400021ba:	8b 74 24 14          	mov    0x14(%esp),%esi
400021be:	56                   	push   %esi
400021bf:	e8 0c ea ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400021c4:	b9 00 02 00 00       	mov    $0x200,%ecx
400021c9:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400021cb:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400021ce:	b8 04 00 00 00       	mov    $0x4,%eax
400021d3:	cd 30                	int    $0x30
    if (open("dd", O_CREATE) >= 0) {
400021d5:	83 c4 10             	add    $0x10,%esp
400021d8:	85 db                	test   %ebx,%ebx
400021da:	78 08                	js     400021e4 <subdir+0x4c4>
400021dc:	85 c0                	test   %eax,%eax
400021de:	0f 84 06 02 00 00    	je     400023ea <subdir+0x6ca>
    int len = strlen(path) + 1;
400021e4:	83 ec 0c             	sub    $0xc,%esp
400021e7:	89 eb                	mov    %ebp,%ebx
400021e9:	8b 74 24 14          	mov    0x14(%esp),%esi
400021ed:	56                   	push   %esi
400021ee:	e8 dd e9 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400021f3:	b9 02 00 00 00       	mov    $0x2,%ecx
400021f8:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400021fa:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400021fd:	b8 04 00 00 00       	mov    $0x4,%eax
40002202:	cd 30                	int    $0x30
    if (open("dd", O_RDWR) >= 0) {
40002204:	83 c4 10             	add    $0x10,%esp
40002207:	85 db                	test   %ebx,%ebx
40002209:	78 08                	js     40002213 <subdir+0x4f3>
4000220b:	85 c0                	test   %eax,%eax
4000220d:	0f 84 86 02 00 00    	je     40002499 <subdir+0x779>
    int len = strlen(path) + 1;
40002213:	83 ec 0c             	sub    $0xc,%esp
40002216:	89 eb                	mov    %ebp,%ebx
40002218:	8b 74 24 14          	mov    0x14(%esp),%esi
4000221c:	56                   	push   %esi
4000221d:	e8 ae e9 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002222:	b9 01 00 00 00       	mov    $0x1,%ecx
40002227:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002229:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000222c:	b8 04 00 00 00       	mov    $0x4,%eax
40002231:	cd 30                	int    $0x30
    if (open("dd", O_WRONLY) >= 0) {
40002233:	83 c4 10             	add    $0x10,%esp
40002236:	85 db                	test   %ebx,%ebx
40002238:	78 08                	js     40002242 <subdir+0x522>
4000223a:	85 c0                	test   %eax,%eax
4000223c:	0f 84 bf 00 00 00    	je     40002301 <subdir+0x5e1>
    int oldlen = strlen(old) + 1;
40002242:	83 ec 0c             	sub    $0xc,%esp
40002245:	89 eb                	mov    %ebp,%ebx
40002247:	ff 74 24 1c          	push   0x1c(%esp)
4000224b:	e8 80 e9 ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
40002250:	8d 8d f0 c5 ff ff    	lea    -0x3a10(%ebp),%ecx
40002256:	89 0c 24             	mov    %ecx,(%esp)
    int oldlen = strlen(old) + 1;
40002259:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
4000225b:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
4000225f:	e8 6c e9 ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
40002264:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
40002267:	8b 5c 24 20          	mov    0x20(%esp),%ebx
4000226b:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    int newlen = strlen(new) + 1;
4000226f:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40002272:	b8 0a 00 00 00       	mov    $0xa,%eax
40002277:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002279:	83 c4 10             	add    $0x10,%esp
4000227c:	85 c0                	test   %eax,%eax
4000227e:	0f 85 96 00 00 00    	jne    4000231a <subdir+0x5fa>
        printf("link dd/ff/ff dd/dd/xx succeeded!\n");
40002284:	83 ec 0c             	sub    $0xc,%esp
40002287:	8d 85 3c cf ff ff    	lea    -0x30c4(%ebp),%eax
4000228d:	89 eb                	mov    %ebp,%ebx
4000228f:	50                   	push   %eax
40002290:	e8 db e0 ff ff       	call   40000370 <printf>
        exit();
40002295:	83 c4 10             	add    $0x10,%esp
40002298:	e9 6a fb ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("read dd/dd/ffff wrong len\n");
4000229d:	83 ec 0c             	sub    $0xc,%esp
400022a0:	8d 85 41 c5 ff ff    	lea    -0x3abf(%ebp),%eax
400022a6:	89 eb                	mov    %ebp,%ebx
400022a8:	50                   	push   %eax
400022a9:	e8 c2 e0 ff ff       	call   40000370 <printf>
        exit();
400022ae:	83 c4 10             	add    $0x10,%esp
400022b1:	e9 51 fb ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("subdir mkdir dd/dd failed\n");
400022b6:	83 ec 0c             	sub    $0xc,%esp
400022b9:	8d 85 32 c4 ff ff    	lea    -0x3bce(%ebp),%eax
400022bf:	89 eb                	mov    %ebp,%ebx
400022c1:	50                   	push   %eax
400022c2:	e8 a9 e0 ff ff       	call   40000370 <printf>
        exit();
400022c7:	83 c4 10             	add    $0x10,%esp
400022ca:	e9 38 fb ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("open (unlinked) dd/dd/ff succeeded\n");
400022cf:	83 ec 0c             	sub    $0xc,%esp
400022d2:	8d 85 f0 ce ff ff    	lea    -0x3110(%ebp),%eax
400022d8:	89 eb                	mov    %ebp,%ebx
400022da:	50                   	push   %eax
400022db:	e8 90 e0 ff ff       	call   40000370 <printf>
        exit();
400022e0:	83 c4 10             	add    $0x10,%esp
400022e3:	e9 1f fb ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("open dd/dd/ffff failed\n");
400022e8:	83 ec 0c             	sub    $0xc,%esp
400022eb:	8d 85 29 c5 ff ff    	lea    -0x3ad7(%ebp),%eax
400022f1:	89 eb                	mov    %ebp,%ebx
400022f3:	50                   	push   %eax
400022f4:	e8 77 e0 ff ff       	call   40000370 <printf>
        exit();
400022f9:	83 c4 10             	add    $0x10,%esp
400022fc:	e9 06 fb ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("open dd wronly succeeded!\n");
40002301:	83 ec 0c             	sub    $0xc,%esp
40002304:	8d 85 d5 c5 ff ff    	lea    -0x3a2b(%ebp),%eax
4000230a:	89 eb                	mov    %ebp,%ebx
4000230c:	50                   	push   %eax
4000230d:	e8 5e e0 ff ff       	call   40000370 <printf>
        exit();
40002312:	83 c4 10             	add    $0x10,%esp
40002315:	e9 ed fa ff ff       	jmp    40001e07 <subdir+0xe7>
    int oldlen = strlen(old) + 1;
4000231a:	83 ec 0c             	sub    $0xc,%esp
4000231d:	89 eb                	mov    %ebp,%ebx
4000231f:	ff 74 24 20          	push   0x20(%esp)
40002323:	e8 a8 e8 ff ff       	call   40000bd0 <strlen>
40002328:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
4000232a:	58                   	pop    %eax
4000232b:	ff 74 24 28          	push   0x28(%esp)
4000232f:	e8 9c e8 ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
40002334:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
40002337:	8b 5c 24 24          	mov    0x24(%esp),%ebx
4000233b:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    int newlen = strlen(new) + 1;
4000233f:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40002342:	b8 0a 00 00 00       	mov    $0xa,%eax
40002347:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002349:	83 c4 10             	add    $0x10,%esp
4000234c:	85 c0                	test   %eax,%eax
4000234e:	75 4b                	jne    4000239b <subdir+0x67b>
        printf("link dd/xx/ff dd/dd/xx succeeded!\n");
40002350:	83 ec 0c             	sub    $0xc,%esp
40002353:	8d 85 60 cf ff ff    	lea    -0x30a0(%ebp),%eax
40002359:	89 eb                	mov    %ebp,%ebx
4000235b:	50                   	push   %eax
4000235c:	e8 0f e0 ff ff       	call   40000370 <printf>
        exit();
40002361:	83 c4 10             	add    $0x10,%esp
40002364:	e9 9e fa ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("create dd/ff/ff succeeded!\n");
40002369:	83 ec 0c             	sub    $0xc,%esp
4000236c:	8d 85 65 c5 ff ff    	lea    -0x3a9b(%ebp),%eax
40002372:	89 eb                	mov    %ebp,%ebx
40002374:	50                   	push   %eax
40002375:	e8 f6 df ff ff       	call   40000370 <printf>
        exit();
4000237a:	83 c4 10             	add    $0x10,%esp
4000237d:	e9 85 fa ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("create dd/xx/ff succeeded!\n");
40002382:	83 ec 0c             	sub    $0xc,%esp
40002385:	8d 85 8a c5 ff ff    	lea    -0x3a76(%ebp),%eax
4000238b:	89 eb                	mov    %ebp,%ebx
4000238d:	50                   	push   %eax
4000238e:	e8 dd df ff ff       	call   40000370 <printf>
        exit();
40002393:	83 c4 10             	add    $0x10,%esp
40002396:	e9 6c fa ff ff       	jmp    40001e07 <subdir+0xe7>
    int oldlen = strlen(old) + 1;
4000239b:	83 ec 0c             	sub    $0xc,%esp
4000239e:	89 eb                	mov    %ebp,%ebx
400023a0:	ff 74 24 18          	push   0x18(%esp)
400023a4:	e8 27 e8 ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
400023a9:	89 3c 24             	mov    %edi,(%esp)
    int oldlen = strlen(old) + 1;
400023ac:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
400023ae:	e8 1d e8 ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
400023b3:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
400023b6:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400023ba:	89 f9                	mov    %edi,%ecx
    int newlen = strlen(new) + 1;
400023bc:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
400023bf:	b8 0a 00 00 00       	mov    $0xa,%eax
400023c4:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400023c6:	83 c4 10             	add    $0x10,%esp
400023c9:	85 c0                	test   %eax,%eax
400023cb:	0f 85 e1 00 00 00    	jne    400024b2 <subdir+0x792>
        printf("link dd/ff dd/dd/ffff succeeded!\n");
400023d1:	83 ec 0c             	sub    $0xc,%esp
400023d4:	8d 85 84 cf ff ff    	lea    -0x307c(%ebp),%eax
400023da:	89 eb                	mov    %ebp,%ebx
400023dc:	50                   	push   %eax
400023dd:	e8 8e df ff ff       	call   40000370 <printf>
        exit();
400023e2:	83 c4 10             	add    $0x10,%esp
400023e5:	e9 1d fa ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("create dd succeeded!\n");
400023ea:	83 ec 0c             	sub    $0xc,%esp
400023ed:	8d 85 a6 c5 ff ff    	lea    -0x3a5a(%ebp),%eax
400023f3:	89 eb                	mov    %ebp,%ebx
400023f5:	50                   	push   %eax
400023f6:	e8 75 df ff ff       	call   40000370 <printf>
        exit();
400023fb:	83 c4 10             	add    $0x10,%esp
400023fe:	e9 04 fa ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("chdir ./.. failed\n");
40002403:	83 ec 0c             	sub    $0xc,%esp
40002406:	8d 85 16 c5 ff ff    	lea    -0x3aea(%ebp),%eax
4000240c:	89 eb                	mov    %ebp,%ebx
4000240e:	50                   	push   %eax
4000240f:	e8 5c df ff ff       	call   40000370 <printf>
        exit();
40002414:	83 c4 10             	add    $0x10,%esp
40002417:	e9 eb f9 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("chdir dd/../../dd failed\n");
4000241c:	83 ec 0c             	sub    $0xc,%esp
4000241f:	8d 85 f7 c4 ff ff    	lea    -0x3b09(%ebp),%eax
40002425:	89 eb                	mov    %ebp,%ebx
40002427:	50                   	push   %eax
40002428:	e8 43 df ff ff       	call   40000370 <printf>
        exit();
4000242d:	83 c4 10             	add    $0x10,%esp
40002430:	e9 d2 f9 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("chdir dd failed\n");
40002435:	83 ec 0c             	sub    $0xc,%esp
40002438:	8d 85 d7 c4 ff ff    	lea    -0x3b29(%ebp),%eax
4000243e:	89 eb                	mov    %ebp,%ebx
40002440:	50                   	push   %eax
40002441:	e8 2a df ff ff       	call   40000370 <printf>
        exit();
40002446:	83 c4 10             	add    $0x10,%esp
40002449:	e9 b9 f9 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("open (unlinked) dd/dd/ff succeeded!\n");
4000244e:	83 ec 0c             	sub    $0xc,%esp
40002451:	8d 85 14 cf ff ff    	lea    -0x30ec(%ebp),%eax
40002457:	89 eb                	mov    %ebp,%ebx
40002459:	50                   	push   %eax
4000245a:	e8 11 df ff ff       	call   40000370 <printf>
        exit();
4000245f:	83 c4 10             	add    $0x10,%esp
40002462:	e9 a0 f9 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("unlink dd/dd/ff failed\n");
40002467:	83 ec 0c             	sub    $0xc,%esp
4000246a:	8d 85 b3 c4 ff ff    	lea    -0x3b4d(%ebp),%eax
40002470:	89 eb                	mov    %ebp,%ebx
40002472:	50                   	push   %eax
40002473:	e8 f8 de ff ff       	call   40000370 <printf>
        exit();
40002478:	83 c4 10             	add    $0x10,%esp
4000247b:	e9 87 f9 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("link dd/dd/ff dd/dd/ffff failed\n");
40002480:	83 ec 0c             	sub    $0xc,%esp
40002483:	8d 85 cc ce ff ff    	lea    -0x3134(%ebp),%eax
40002489:	89 eb                	mov    %ebp,%ebx
4000248b:	50                   	push   %eax
4000248c:	e8 df de ff ff       	call   40000370 <printf>
        exit();
40002491:	83 c4 10             	add    $0x10,%esp
40002494:	e9 6e f9 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("open dd rdwr succeeded!\n");
40002499:	83 ec 0c             	sub    $0xc,%esp
4000249c:	8d 85 bc c5 ff ff    	lea    -0x3a44(%ebp),%eax
400024a2:	89 eb                	mov    %ebp,%ebx
400024a4:	50                   	push   %eax
400024a5:	e8 c6 de ff ff       	call   40000370 <printf>
        exit();
400024aa:	83 c4 10             	add    $0x10,%esp
400024ad:	e9 55 f9 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
400024b2:	83 ec 0c             	sub    $0xc,%esp
400024b5:	89 eb                	mov    %ebp,%ebx
    asm volatile ("int %2"
400024b7:	be 08 00 00 00       	mov    $0x8,%esi
    int len = strlen(path) + 1;
400024bc:	ff 74 24 1c          	push   0x1c(%esp)
400024c0:	e8 0b e7 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400024c5:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    int len = strlen(path) + 1;
400024c9:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400024cc:	89 f0                	mov    %esi,%eax
400024ce:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400024d0:	83 c4 10             	add    $0x10,%esp
400024d3:	85 c0                	test   %eax,%eax
400024d5:	75 19                	jne    400024f0 <subdir+0x7d0>
        printf("mkdir dd/ff/ff succeeded!\n");
400024d7:	83 ec 0c             	sub    $0xc,%esp
400024da:	8d 85 f9 c5 ff ff    	lea    -0x3a07(%ebp),%eax
400024e0:	89 eb                	mov    %ebp,%ebx
400024e2:	50                   	push   %eax
400024e3:	e8 88 de ff ff       	call   40000370 <printf>
        exit();
400024e8:	83 c4 10             	add    $0x10,%esp
400024eb:	e9 17 f9 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
400024f0:	83 ec 0c             	sub    $0xc,%esp
400024f3:	89 eb                	mov    %ebp,%ebx
400024f5:	ff 74 24 20          	push   0x20(%esp)
400024f9:	e8 d2 e6 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400024fe:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    int len = strlen(path) + 1;
40002502:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002505:	89 f0                	mov    %esi,%eax
40002507:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002509:	83 c4 10             	add    $0x10,%esp
4000250c:	85 c0                	test   %eax,%eax
4000250e:	75 19                	jne    40002529 <subdir+0x809>
        printf("mkdir dd/xx/ff succeeded!\n");
40002510:	83 ec 0c             	sub    $0xc,%esp
40002513:	8d 85 14 c6 ff ff    	lea    -0x39ec(%ebp),%eax
40002519:	89 eb                	mov    %ebp,%ebx
4000251b:	50                   	push   %eax
4000251c:	e8 4f de ff ff       	call   40000370 <printf>
        exit();
40002521:	83 c4 10             	add    $0x10,%esp
40002524:	e9 de f8 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
40002529:	83 ec 0c             	sub    $0xc,%esp
4000252c:	89 eb                	mov    %ebp,%ebx
4000252e:	57                   	push   %edi
4000252f:	e8 9c e6 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002534:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002536:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002539:	89 f0                	mov    %esi,%eax
4000253b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000253d:	83 c4 10             	add    $0x10,%esp
40002540:	85 c0                	test   %eax,%eax
40002542:	75 19                	jne    4000255d <subdir+0x83d>
        printf("mkdir dd/dd/ffff succeeded!\n");
40002544:	83 ec 0c             	sub    $0xc,%esp
40002547:	8d 85 2f c6 ff ff    	lea    -0x39d1(%ebp),%eax
4000254d:	89 eb                	mov    %ebp,%ebx
4000254f:	50                   	push   %eax
40002550:	e8 1b de ff ff       	call   40000370 <printf>
        exit();
40002555:	83 c4 10             	add    $0x10,%esp
40002558:	e9 aa f8 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
4000255d:	83 ec 0c             	sub    $0xc,%esp
40002560:	89 eb                	mov    %ebp,%ebx
    asm volatile ("int %2"
40002562:	be 0b 00 00 00       	mov    $0xb,%esi
    int len = strlen(path) + 1;
40002567:	ff 74 24 20          	push   0x20(%esp)
4000256b:	e8 60 e6 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002570:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    int len = strlen(path) + 1;
40002574:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002577:	89 f0                	mov    %esi,%eax
40002579:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000257b:	83 c4 10             	add    $0x10,%esp
4000257e:	85 c0                	test   %eax,%eax
40002580:	75 19                	jne    4000259b <subdir+0x87b>
        printf("unlink dd/xx/ff succeeded!\n");
40002582:	83 ec 0c             	sub    $0xc,%esp
40002585:	8d 85 4c c6 ff ff    	lea    -0x39b4(%ebp),%eax
4000258b:	89 eb                	mov    %ebp,%ebx
4000258d:	50                   	push   %eax
4000258e:	e8 dd dd ff ff       	call   40000370 <printf>
        exit();
40002593:	83 c4 10             	add    $0x10,%esp
40002596:	e9 6c f8 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
4000259b:	83 ec 0c             	sub    $0xc,%esp
4000259e:	89 eb                	mov    %ebp,%ebx
400025a0:	ff 74 24 1c          	push   0x1c(%esp)
400025a4:	e8 27 e6 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400025a9:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    int len = strlen(path) + 1;
400025ad:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400025b0:	89 f0                	mov    %esi,%eax
400025b2:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400025b4:	83 c4 10             	add    $0x10,%esp
400025b7:	85 c0                	test   %eax,%eax
400025b9:	75 19                	jne    400025d4 <subdir+0x8b4>
        printf("unlink dd/ff/ff succeeded!\n");
400025bb:	83 ec 0c             	sub    $0xc,%esp
400025be:	8d 85 68 c6 ff ff    	lea    -0x3998(%ebp),%eax
400025c4:	89 eb                	mov    %ebp,%ebx
400025c6:	50                   	push   %eax
400025c7:	e8 a4 dd ff ff       	call   40000370 <printf>
        exit();
400025cc:	83 c4 10             	add    $0x10,%esp
400025cf:	e9 33 f8 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
400025d4:	83 ec 0c             	sub    $0xc,%esp
400025d7:	89 eb                	mov    %ebp,%ebx
    asm volatile ("int %2"
400025d9:	be 09 00 00 00       	mov    $0x9,%esi
    int len = strlen(path) + 1;
400025de:	ff 74 24 18          	push   0x18(%esp)
400025e2:	e8 e9 e5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400025e7:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    int len = strlen(path) + 1;
400025eb:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400025ee:	89 f0                	mov    %esi,%eax
400025f0:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400025f2:	83 c4 10             	add    $0x10,%esp
400025f5:	85 c0                	test   %eax,%eax
400025f7:	75 19                	jne    40002612 <subdir+0x8f2>
        printf("chdir dd/ff succeeded!\n");
400025f9:	83 ec 0c             	sub    $0xc,%esp
400025fc:	8d 85 84 c6 ff ff    	lea    -0x397c(%ebp),%eax
40002602:	89 eb                	mov    %ebp,%ebx
40002604:	50                   	push   %eax
40002605:	e8 66 dd ff ff       	call   40000370 <printf>
        exit();
4000260a:	83 c4 10             	add    $0x10,%esp
4000260d:	e9 f5 f7 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
40002612:	83 ec 0c             	sub    $0xc,%esp
40002615:	8d 95 f3 c5 ff ff    	lea    -0x3a0d(%ebp),%edx
4000261b:	89 eb                	mov    %ebp,%ebx
4000261d:	52                   	push   %edx
4000261e:	89 54 24 20          	mov    %edx,0x20(%esp)
40002622:	e8 a9 e5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002627:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    int len = strlen(path) + 1;
4000262b:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000262e:	89 f0                	mov    %esi,%eax
40002630:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002632:	83 c4 10             	add    $0x10,%esp
40002635:	85 c0                	test   %eax,%eax
40002637:	75 19                	jne    40002652 <subdir+0x932>
        printf("chdir dd/xx succeeded!\n");
40002639:	83 ec 0c             	sub    $0xc,%esp
4000263c:	8d 85 9c c6 ff ff    	lea    -0x3964(%ebp),%eax
40002642:	89 eb                	mov    %ebp,%ebx
40002644:	50                   	push   %eax
40002645:	e8 26 dd ff ff       	call   40000370 <printf>
        exit();
4000264a:	83 c4 10             	add    $0x10,%esp
4000264d:	e9 b5 f7 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
40002652:	83 ec 0c             	sub    $0xc,%esp
40002655:	89 eb                	mov    %ebp,%ebx
    asm volatile ("int %2"
40002657:	be 0b 00 00 00       	mov    $0xb,%esi
    int len = strlen(path) + 1;
4000265c:	57                   	push   %edi
4000265d:	e8 6e e5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002662:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002664:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002667:	89 f0                	mov    %esi,%eax
40002669:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000266b:	83 c4 10             	add    $0x10,%esp
4000266e:	85 c0                	test   %eax,%eax
40002670:	0f 85 f1 fd ff ff    	jne    40002467 <subdir+0x747>
    int len = strlen(path) + 1;
40002676:	83 ec 0c             	sub    $0xc,%esp
40002679:	89 eb                	mov    %ebp,%ebx
4000267b:	8b 7c 24 18          	mov    0x18(%esp),%edi
4000267f:	57                   	push   %edi
40002680:	e8 4b e5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002685:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002687:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000268a:	89 f0                	mov    %esi,%eax
4000268c:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000268e:	83 c4 10             	add    $0x10,%esp
40002691:	85 c0                	test   %eax,%eax
40002693:	75 38                	jne    400026cd <subdir+0x9ad>
    int len = strlen(path) + 1;
40002695:	83 ec 0c             	sub    $0xc,%esp
40002698:	89 eb                	mov    %ebp,%ebx
4000269a:	8b 7c 24 14          	mov    0x14(%esp),%edi
4000269e:	57                   	push   %edi
4000269f:	e8 2c e5 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400026a4:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
400026a6:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400026a9:	89 f0                	mov    %esi,%eax
400026ab:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400026ad:	83 c4 10             	add    $0x10,%esp
400026b0:	85 c0                	test   %eax,%eax
400026b2:	75 32                	jne    400026e6 <subdir+0x9c6>
        printf("unlink non-empty dd succeeded!\n");
400026b4:	83 ec 0c             	sub    $0xc,%esp
400026b7:	8d 85 a8 cf ff ff    	lea    -0x3058(%ebp),%eax
400026bd:	89 eb                	mov    %ebp,%ebx
400026bf:	50                   	push   %eax
400026c0:	e8 ab dc ff ff       	call   40000370 <printf>
        exit();
400026c5:	83 c4 10             	add    $0x10,%esp
400026c8:	e9 3a f7 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("unlink dd/ff failed\n");
400026cd:	83 ec 0c             	sub    $0xc,%esp
400026d0:	8d 85 b4 c6 ff ff    	lea    -0x394c(%ebp),%eax
400026d6:	89 eb                	mov    %ebp,%ebx
400026d8:	50                   	push   %eax
400026d9:	e8 92 dc ff ff       	call   40000370 <printf>
        exit();
400026de:	83 c4 10             	add    $0x10,%esp
400026e1:	e9 21 f7 ff ff       	jmp    40001e07 <subdir+0xe7>
    int len = strlen(path) + 1;
400026e6:	83 ec 0c             	sub    $0xc,%esp
400026e9:	89 eb                	mov    %ebp,%ebx
400026eb:	8b 7c 24 24          	mov    0x24(%esp),%edi
400026ef:	57                   	push   %edi
400026f0:	e8 db e4 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400026f5:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
400026f7:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400026fa:	89 f0                	mov    %esi,%eax
400026fc:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400026fe:	83 c4 10             	add    $0x10,%esp
40002701:	85 c0                	test   %eax,%eax
40002703:	75 38                	jne    4000273d <subdir+0xa1d>
    int len = strlen(path) + 1;
40002705:	83 ec 0c             	sub    $0xc,%esp
40002708:	89 eb                	mov    %ebp,%ebx
4000270a:	8b 7c 24 14          	mov    0x14(%esp),%edi
4000270e:	57                   	push   %edi
4000270f:	e8 bc e4 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002714:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002716:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002719:	89 f0                	mov    %esi,%eax
4000271b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000271d:	83 c4 10             	add    $0x10,%esp
40002720:	85 c0                	test   %eax,%eax
40002722:	75 32                	jne    40002756 <subdir+0xa36>
    printf("=====subdir ok=====\n\n");
40002724:	83 ec 0c             	sub    $0xc,%esp
40002727:	8d 85 de c6 ff ff    	lea    -0x3922(%ebp),%eax
4000272d:	89 eb                	mov    %ebp,%ebx
4000272f:	50                   	push   %eax
40002730:	e8 3b dc ff ff       	call   40000370 <printf>
40002735:	83 c4 10             	add    $0x10,%esp
40002738:	e9 ca f6 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("unlink dd/dd failed\n");
4000273d:	83 ec 0c             	sub    $0xc,%esp
40002740:	8d 85 c9 c6 ff ff    	lea    -0x3937(%ebp),%eax
40002746:	89 eb                	mov    %ebp,%ebx
40002748:	50                   	push   %eax
40002749:	e8 22 dc ff ff       	call   40000370 <printf>
        exit();
4000274e:	83 c4 10             	add    $0x10,%esp
40002751:	e9 b1 f6 ff ff       	jmp    40001e07 <subdir+0xe7>
        printf("unlink dd failed\n");
40002756:	83 ec 0c             	sub    $0xc,%esp
40002759:	8d 85 f4 c6 ff ff    	lea    -0x390c(%ebp),%eax
4000275f:	89 eb                	mov    %ebp,%ebx
40002761:	50                   	push   %eax
40002762:	e8 09 dc ff ff       	call   40000370 <printf>
        exit();
40002767:	83 c4 10             	add    $0x10,%esp
4000276a:	e9 98 f6 ff ff       	jmp    40001e07 <subdir+0xe7>
4000276f:	90                   	nop

40002770 <linktest>:
{
40002770:	55                   	push   %ebp
40002771:	57                   	push   %edi
40002772:	e8 79 0c 00 00       	call   400033f0 <__x86.get_pc_thunk.di>
40002777:	81 c7 7d 58 00 00    	add    $0x587d,%edi
4000277d:	56                   	push   %esi
4000277e:	53                   	push   %ebx
4000277f:	83 ec 28             	sub    $0x28,%esp
    printf("=====linktest=====\n");
40002782:	8d 87 06 c7 ff ff    	lea    -0x38fa(%edi),%eax
40002788:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000278a:	8d af 1a c7 ff ff    	lea    -0x38e6(%edi),%ebp
40002790:	50                   	push   %eax
40002791:	e8 da db ff ff       	call   40000370 <printf>
40002796:	89 2c 24             	mov    %ebp,(%esp)
40002799:	e8 32 e4 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000279e:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400027a0:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400027a3:	b8 0b 00 00 00       	mov    $0xb,%eax
400027a8:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
400027aa:	8d b7 1e c7 ff ff    	lea    -0x38e2(%edi),%esi
400027b0:	89 fb                	mov    %edi,%ebx
400027b2:	89 34 24             	mov    %esi,(%esp)
400027b5:	89 74 24 1c          	mov    %esi,0x1c(%esp)
400027b9:	e8 12 e4 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400027be:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400027c0:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400027c3:	b8 0b 00 00 00       	mov    $0xb,%eax
400027c8:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
400027ca:	89 fb                	mov    %edi,%ebx
400027cc:	89 2c 24             	mov    %ebp,(%esp)
400027cf:	e8 fc e3 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400027d4:	b9 02 02 00 00       	mov    $0x202,%ecx
400027d9:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400027db:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400027de:	b8 04 00 00 00       	mov    $0x4,%eax
400027e3:	cd 30                	int    $0x30
    if (fd < 0) {
400027e5:	83 c4 10             	add    $0x10,%esp
400027e8:	85 db                	test   %ebx,%ebx
400027ea:	0f 88 30 01 00 00    	js     40002920 <linktest+0x1b0>
400027f0:	85 c0                	test   %eax,%eax
400027f2:	0f 85 28 01 00 00    	jne    40002920 <linktest+0x1b0>
400027f8:	89 de                	mov    %ebx,%esi
    asm volatile ("int %2"
400027fa:	ba 05 00 00 00       	mov    $0x5,%edx
400027ff:	b8 07 00 00 00       	mov    $0x7,%eax
40002804:	8d 8f 35 c7 ff ff    	lea    -0x38cb(%edi),%ecx
4000280a:	cd 30                	int    $0x30
    if (write(fd, "hello", 5) != 5) {
4000280c:	83 fb 05             	cmp    $0x5,%ebx
4000280f:	0f 85 eb 00 00 00    	jne    40002900 <linktest+0x190>
40002815:	85 c0                	test   %eax,%eax
40002817:	0f 85 e3 00 00 00    	jne    40002900 <linktest+0x190>
    asm volatile ("int %2"
4000281d:	89 d0                	mov    %edx,%eax
4000281f:	89 f3                	mov    %esi,%ebx
40002821:	cd 30                	int    $0x30
    int oldlen = strlen(old) + 1;
40002823:	83 ec 0c             	sub    $0xc,%esp
40002826:	89 fb                	mov    %edi,%ebx
40002828:	55                   	push   %ebp
40002829:	e8 a2 e3 ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
4000282e:	59                   	pop    %ecx
4000282f:	ff 74 24 18          	push   0x18(%esp)
    int oldlen = strlen(old) + 1;
40002833:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
40002835:	e8 96 e3 ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
4000283a:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
4000283d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
40002841:	89 eb                	mov    %ebp,%ebx
    int newlen = strlen(new) + 1;
40002843:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40002846:	b8 0a 00 00 00       	mov    $0xa,%eax
4000284b:	cd 30                	int    $0x30
4000284d:	89 c6                	mov    %eax,%esi
    return errno ? -1 : 0;
4000284f:	83 c4 10             	add    $0x10,%esp
40002852:	85 c0                	test   %eax,%eax
40002854:	0f 85 7f 01 00 00    	jne    400029d9 <linktest+0x269>
    int len = strlen(path) + 1;
4000285a:	83 ec 0c             	sub    $0xc,%esp
4000285d:	89 fb                	mov    %edi,%ebx
4000285f:	55                   	push   %ebp
40002860:	e8 6b e3 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002865:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40002867:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000286a:	b8 0b 00 00 00       	mov    $0xb,%eax
4000286f:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40002871:	89 fb                	mov    %edi,%ebx
40002873:	89 2c 24             	mov    %ebp,(%esp)
40002876:	e8 55 e3 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000287b:	89 eb                	mov    %ebp,%ebx
4000287d:	89 f1                	mov    %esi,%ecx
    int len = strlen(path) + 1;
4000287f:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002882:	b8 04 00 00 00       	mov    $0x4,%eax
40002887:	cd 30                	int    $0x30
    if (open("lf1", 0) >= 0) {
40002889:	83 c4 10             	add    $0x10,%esp
4000288c:	85 db                	test   %ebx,%ebx
4000288e:	78 08                	js     40002898 <linktest+0x128>
40002890:	85 c0                	test   %eax,%eax
40002892:	0f 84 a8 00 00 00    	je     40002940 <linktest+0x1d0>
    int len = strlen(path) + 1;
40002898:	83 ec 0c             	sub    $0xc,%esp
4000289b:	89 fb                	mov    %edi,%ebx
4000289d:	8b 74 24 18          	mov    0x18(%esp),%esi
400028a1:	56                   	push   %esi
400028a2:	e8 29 e3 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400028a7:	31 c9                	xor    %ecx,%ecx
400028a9:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400028ab:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400028ae:	b8 04 00 00 00       	mov    $0x4,%eax
400028b3:	cd 30                	int    $0x30
400028b5:	89 de                	mov    %ebx,%esi
    if (fd < 0) {
400028b7:	83 c4 10             	add    $0x10,%esp
400028ba:	85 db                	test   %ebx,%ebx
400028bc:	0f 88 fe 00 00 00    	js     400029c0 <linktest+0x250>
400028c2:	85 c0                	test   %eax,%eax
400028c4:	0f 85 f6 00 00 00    	jne    400029c0 <linktest+0x250>
    asm volatile ("int %2"
400028ca:	b8 06 00 00 00       	mov    $0x6,%eax
400028cf:	8d 8f 4c 00 00 00    	lea    0x4c(%edi),%ecx
400028d5:	ba 00 20 00 00       	mov    $0x2000,%edx
400028da:	cd 30                	int    $0x30
    if (read(fd, buf, sizeof(buf)) != 5) {
400028dc:	83 fb 05             	cmp    $0x5,%ebx
400028df:	75 04                	jne    400028e5 <linktest+0x175>
400028e1:	85 c0                	test   %eax,%eax
400028e3:	74 7b                	je     40002960 <linktest+0x1f0>
        printf("read lf2 failed\n");
400028e5:	83 ec 0c             	sub    $0xc,%esp
400028e8:	8d 87 73 c7 ff ff    	lea    -0x388d(%edi),%eax
400028ee:	89 fb                	mov    %edi,%ebx
400028f0:	50                   	push   %eax
400028f1:	e8 7a da ff ff       	call   40000370 <printf>
        exit();
400028f6:	83 c4 10             	add    $0x10,%esp
400028f9:	eb 19                	jmp    40002914 <linktest+0x1a4>
400028fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("write lf1 failed\n");
40002900:	83 ec 0c             	sub    $0xc,%esp
40002903:	8d 87 3b c7 ff ff    	lea    -0x38c5(%edi),%eax
40002909:	89 fb                	mov    %edi,%ebx
4000290b:	50                   	push   %eax
4000290c:	e8 5f da ff ff       	call   40000370 <printf>
        exit();
40002911:	83 c4 10             	add    $0x10,%esp
}
40002914:	83 c4 1c             	add    $0x1c,%esp
40002917:	5b                   	pop    %ebx
40002918:	5e                   	pop    %esi
40002919:	5f                   	pop    %edi
4000291a:	5d                   	pop    %ebp
4000291b:	c3                   	ret
4000291c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("create lf1 failed\n");
40002920:	83 ec 0c             	sub    $0xc,%esp
40002923:	8d 87 22 c7 ff ff    	lea    -0x38de(%edi),%eax
40002929:	89 fb                	mov    %edi,%ebx
4000292b:	50                   	push   %eax
4000292c:	e8 3f da ff ff       	call   40000370 <printf>
        exit();
40002931:	83 c4 10             	add    $0x10,%esp
}
40002934:	83 c4 1c             	add    $0x1c,%esp
40002937:	5b                   	pop    %ebx
40002938:	5e                   	pop    %esi
40002939:	5f                   	pop    %edi
4000293a:	5d                   	pop    %ebp
4000293b:	c3                   	ret
4000293c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("unlinked lf1 but it is still there!\n");
40002940:	83 ec 0c             	sub    $0xc,%esp
40002943:	8d 87 c8 cf ff ff    	lea    -0x3038(%edi),%eax
40002949:	89 fb                	mov    %edi,%ebx
4000294b:	50                   	push   %eax
4000294c:	e8 1f da ff ff       	call   40000370 <printf>
        exit();
40002951:	83 c4 10             	add    $0x10,%esp
40002954:	eb be                	jmp    40002914 <linktest+0x1a4>
40002956:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000295d:	00 
4000295e:	66 90                	xchg   %ax,%ax
    asm volatile ("int %2"
40002960:	b8 05 00 00 00       	mov    $0x5,%eax
40002965:	89 f3                	mov    %esi,%ebx
40002967:	cd 30                	int    $0x30
    int oldlen = strlen(old) + 1;
40002969:	83 ec 0c             	sub    $0xc,%esp
4000296c:	89 fb                	mov    %edi,%ebx
4000296e:	ff 74 24 18          	push   0x18(%esp)
40002972:	e8 59 e2 ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
40002977:	5a                   	pop    %edx
40002978:	ff 74 24 18          	push   0x18(%esp)
    int oldlen = strlen(old) + 1;
4000297c:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
4000297e:	e8 4d e2 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002983:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    int oldlen = strlen(old) + 1;
40002987:	8d 56 01             	lea    0x1(%esi),%edx
    int newlen = strlen(new) + 1;
4000298a:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
4000298d:	b8 0a 00 00 00       	mov    $0xa,%eax
40002992:	89 d9                	mov    %ebx,%ecx
40002994:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002996:	83 c4 10             	add    $0x10,%esp
40002999:	85 c0                	test   %eax,%eax
4000299b:	75 55                	jne    400029f2 <linktest+0x282>
        printf("link lf2 lf2 succeeded! oops\n");
4000299d:	83 ec 0c             	sub    $0xc,%esp
400029a0:	8d 87 84 c7 ff ff    	lea    -0x387c(%edi),%eax
400029a6:	89 fb                	mov    %edi,%ebx
400029a8:	50                   	push   %eax
400029a9:	e8 c2 d9 ff ff       	call   40000370 <printf>
        exit();
400029ae:	83 c4 10             	add    $0x10,%esp
400029b1:	e9 5e ff ff ff       	jmp    40002914 <linktest+0x1a4>
400029b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400029bd:	00 
400029be:	66 90                	xchg   %ax,%ax
        printf("open lf2 failed\n");
400029c0:	83 ec 0c             	sub    $0xc,%esp
400029c3:	8d 87 62 c7 ff ff    	lea    -0x389e(%edi),%eax
400029c9:	89 fb                	mov    %edi,%ebx
400029cb:	50                   	push   %eax
400029cc:	e8 9f d9 ff ff       	call   40000370 <printf>
        exit();
400029d1:	83 c4 10             	add    $0x10,%esp
400029d4:	e9 3b ff ff ff       	jmp    40002914 <linktest+0x1a4>
        printf("link lf1 lf2 failed\n");
400029d9:	83 ec 0c             	sub    $0xc,%esp
400029dc:	8d 87 4d c7 ff ff    	lea    -0x38b3(%edi),%eax
400029e2:	89 fb                	mov    %edi,%ebx
400029e4:	50                   	push   %eax
400029e5:	e8 86 d9 ff ff       	call   40000370 <printf>
        exit();
400029ea:	83 c4 10             	add    $0x10,%esp
400029ed:	e9 22 ff ff ff       	jmp    40002914 <linktest+0x1a4>
    int len = strlen(path) + 1;
400029f2:	83 ec 0c             	sub    $0xc,%esp
400029f5:	89 fb                	mov    %edi,%ebx
400029f7:	8b 74 24 18          	mov    0x18(%esp),%esi
400029fb:	56                   	push   %esi
400029fc:	e8 cf e1 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002a01:	89 74 24 1c          	mov    %esi,0x1c(%esp)
40002a05:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002a07:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002a0a:	b8 0b 00 00 00       	mov    $0xb,%eax
40002a0f:	cd 30                	int    $0x30
    int oldlen = strlen(old) + 1;
40002a11:	58                   	pop    %eax
40002a12:	ff 74 24 18          	push   0x18(%esp)
40002a16:	89 fb                	mov    %edi,%ebx
40002a18:	e8 b3 e1 ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
40002a1d:	89 2c 24             	mov    %ebp,(%esp)
    int oldlen = strlen(old) + 1;
40002a20:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
40002a22:	e8 a9 e1 ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
40002a27:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
40002a2a:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40002a2e:	89 e9                	mov    %ebp,%ecx
    int newlen = strlen(new) + 1;
40002a30:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40002a33:	b8 0a 00 00 00       	mov    $0xa,%eax
40002a38:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002a3a:	83 c4 10             	add    $0x10,%esp
40002a3d:	85 c0                	test   %eax,%eax
40002a3f:	75 19                	jne    40002a5a <linktest+0x2ea>
        printf("link non-existant succeeded! oops\n");
40002a41:	83 ec 0c             	sub    $0xc,%esp
40002a44:	8d 87 f0 cf ff ff    	lea    -0x3010(%edi),%eax
40002a4a:	89 fb                	mov    %edi,%ebx
40002a4c:	50                   	push   %eax
40002a4d:	e8 1e d9 ff ff       	call   40000370 <printf>
        exit();
40002a52:	83 c4 10             	add    $0x10,%esp
40002a55:	e9 ba fe ff ff       	jmp    40002914 <linktest+0x1a4>
    int oldlen = strlen(old) + 1;
40002a5a:	83 ec 0c             	sub    $0xc,%esp
40002a5d:	8d 9f 14 c5 ff ff    	lea    -0x3aec(%edi),%ebx
40002a63:	89 5c 24 18          	mov    %ebx,0x18(%esp)
40002a67:	53                   	push   %ebx
40002a68:	89 fb                	mov    %edi,%ebx
40002a6a:	e8 61 e1 ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
40002a6f:	89 2c 24             	mov    %ebp,(%esp)
    int oldlen = strlen(old) + 1;
40002a72:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
40002a74:	e8 57 e1 ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
40002a79:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
40002a7c:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40002a80:	89 e9                	mov    %ebp,%ecx
    int newlen = strlen(new) + 1;
40002a82:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40002a85:	b8 0a 00 00 00       	mov    $0xa,%eax
40002a8a:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002a8c:	83 c4 10             	add    $0x10,%esp
40002a8f:	85 c0                	test   %eax,%eax
40002a91:	75 19                	jne    40002aac <linktest+0x33c>
        printf("link . lf1 succeeded! oops\n");
40002a93:	83 ec 0c             	sub    $0xc,%esp
40002a96:	8d 87 a2 c7 ff ff    	lea    -0x385e(%edi),%eax
40002a9c:	89 fb                	mov    %edi,%ebx
40002a9e:	50                   	push   %eax
40002a9f:	e8 cc d8 ff ff       	call   40000370 <printf>
        exit();
40002aa4:	83 c4 10             	add    $0x10,%esp
40002aa7:	e9 68 fe ff ff       	jmp    40002914 <linktest+0x1a4>
    printf("=====linktest ok=====\n\n");
40002aac:	83 ec 0c             	sub    $0xc,%esp
40002aaf:	8d 87 be c7 ff ff    	lea    -0x3842(%edi),%eax
40002ab5:	89 fb                	mov    %edi,%ebx
40002ab7:	50                   	push   %eax
40002ab8:	e8 b3 d8 ff ff       	call   40000370 <printf>
40002abd:	83 c4 10             	add    $0x10,%esp
40002ac0:	e9 4f fe ff ff       	jmp    40002914 <linktest+0x1a4>
40002ac5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002acc:	00 
40002acd:	8d 76 00             	lea    0x0(%esi),%esi

40002ad0 <unlinkread>:
{
40002ad0:	55                   	push   %ebp
40002ad1:	57                   	push   %edi
40002ad2:	56                   	push   %esi
40002ad3:	e8 14 09 00 00       	call   400033ec <__x86.get_pc_thunk.si>
40002ad8:	81 c6 1c 55 00 00    	add    $0x551c,%esi
40002ade:	53                   	push   %ebx
40002adf:	83 ec 28             	sub    $0x28,%esp
    printf("=====unlinkread test=====\n");
40002ae2:	8d 86 d6 c7 ff ff    	lea    -0x382a(%esi),%eax
40002ae8:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002aea:	8d be f1 c7 ff ff    	lea    -0x380f(%esi),%edi
40002af0:	50                   	push   %eax
40002af1:	e8 7a d8 ff ff       	call   40000370 <printf>
40002af6:	89 3c 24             	mov    %edi,(%esp)
40002af9:	e8 d2 e0 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002afe:	89 fb                	mov    %edi,%ebx
40002b00:	b9 02 02 00 00       	mov    $0x202,%ecx
    int len = strlen(path) + 1;
40002b05:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002b08:	b8 04 00 00 00       	mov    $0x4,%eax
40002b0d:	cd 30                	int    $0x30
    if (fd < 0) {
40002b0f:	83 c4 10             	add    $0x10,%esp
40002b12:	85 db                	test   %ebx,%ebx
40002b14:	0f 88 46 01 00 00    	js     40002c60 <unlinkread+0x190>
40002b1a:	85 c0                	test   %eax,%eax
40002b1c:	0f 85 3e 01 00 00    	jne    40002c60 <unlinkread+0x190>
40002b22:	89 dd                	mov    %ebx,%ebp
    asm volatile ("int %2"
40002b24:	8d 8e 35 c7 ff ff    	lea    -0x38cb(%esi),%ecx
40002b2a:	b8 07 00 00 00       	mov    $0x7,%eax
40002b2f:	ba 05 00 00 00       	mov    $0x5,%edx
40002b34:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002b36:	89 d0                	mov    %edx,%eax
40002b38:	89 eb                	mov    %ebp,%ebx
40002b3a:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40002b3c:	83 ec 0c             	sub    $0xc,%esp
40002b3f:	89 f3                	mov    %esi,%ebx
40002b41:	57                   	push   %edi
40002b42:	e8 89 e0 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002b47:	b9 02 00 00 00       	mov    $0x2,%ecx
40002b4c:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002b4e:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002b51:	b8 04 00 00 00       	mov    $0x4,%eax
40002b56:	cd 30                	int    $0x30
40002b58:	89 dd                	mov    %ebx,%ebp
    if (fd < 0) {
40002b5a:	83 c4 10             	add    $0x10,%esp
40002b5d:	85 db                	test   %ebx,%ebx
40002b5f:	0f 88 db 00 00 00    	js     40002c40 <unlinkread+0x170>
40002b65:	85 c0                	test   %eax,%eax
40002b67:	0f 85 d3 00 00 00    	jne    40002c40 <unlinkread+0x170>
    int len = strlen(path) + 1;
40002b6d:	83 ec 0c             	sub    $0xc,%esp
40002b70:	89 f3                	mov    %esi,%ebx
40002b72:	57                   	push   %edi
40002b73:	e8 58 e0 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002b78:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002b7a:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002b7d:	b8 0b 00 00 00       	mov    $0xb,%eax
40002b82:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002b84:	83 c4 10             	add    $0x10,%esp
40002b87:	85 c0                	test   %eax,%eax
40002b89:	0f 85 69 01 00 00    	jne    40002cf8 <unlinkread+0x228>
    int len = strlen(path) + 1;
40002b8f:	83 ec 0c             	sub    $0xc,%esp
40002b92:	89 f3                	mov    %esi,%ebx
40002b94:	57                   	push   %edi
40002b95:	e8 36 e0 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002b9a:	89 fb                	mov    %edi,%ebx
40002b9c:	b9 02 02 00 00       	mov    $0x202,%ecx
    int len = strlen(path) + 1;
40002ba1:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002ba4:	b8 04 00 00 00       	mov    $0x4,%eax
40002ba9:	cd 30                	int    $0x30
    return errno ? -1 : fd;
40002bab:	83 c4 10             	add    $0x10,%esp
40002bae:	85 c0                	test   %eax,%eax
40002bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    asm volatile ("int %2"
40002bb5:	ba 03 00 00 00       	mov    $0x3,%edx
    return errno ? -1 : fd;
40002bba:	0f 44 c3             	cmove  %ebx,%eax
    asm volatile ("int %2"
40002bbd:	8d 8e 48 c8 ff ff    	lea    -0x37b8(%esi),%ecx
    return errno ? -1 : fd;
40002bc3:	89 c3                	mov    %eax,%ebx
    asm volatile ("int %2"
40002bc5:	b8 07 00 00 00       	mov    $0x7,%eax
40002bca:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40002bce:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002bd0:	b8 05 00 00 00       	mov    $0x5,%eax
40002bd5:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40002bd9:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002bdb:	b8 06 00 00 00       	mov    $0x6,%eax
40002be0:	8d 8e 4c 00 00 00    	lea    0x4c(%esi),%ecx
40002be6:	ba 00 20 00 00       	mov    $0x2000,%edx
40002beb:	89 eb                	mov    %ebp,%ebx
40002bed:	cd 30                	int    $0x30
    if (read(fd, buf, sizeof(buf)) != 5) {
40002bef:	83 fb 05             	cmp    $0x5,%ebx
40002bf2:	0f 85 88 00 00 00    	jne    40002c80 <unlinkread+0x1b0>
40002bf8:	85 c0                	test   %eax,%eax
40002bfa:	0f 85 80 00 00 00    	jne    40002c80 <unlinkread+0x1b0>
    if (buf[0] != 'h') {
40002c00:	80 be 4c 00 00 00 68 	cmpb   $0x68,0x4c(%esi)
40002c07:	0f 85 93 00 00 00    	jne    40002ca0 <unlinkread+0x1d0>
    asm volatile ("int %2"
40002c0d:	ba 0a 00 00 00       	mov    $0xa,%edx
40002c12:	b8 07 00 00 00       	mov    $0x7,%eax
40002c17:	89 eb                	mov    %ebp,%ebx
40002c19:	cd 30                	int    $0x30
    if (write(fd, buf, 10) != 10) {
40002c1b:	83 fb 0a             	cmp    $0xa,%ebx
40002c1e:	75 08                	jne    40002c28 <unlinkread+0x158>
40002c20:	85 c0                	test   %eax,%eax
40002c22:	0f 84 98 00 00 00    	je     40002cc0 <unlinkread+0x1f0>
        printf("unlinkread write failed\n");
40002c28:	83 ec 0c             	sub    $0xc,%esp
40002c2b:	8d 86 7a c8 ff ff    	lea    -0x3786(%esi),%eax
40002c31:	89 f3                	mov    %esi,%ebx
40002c33:	50                   	push   %eax
40002c34:	e8 37 d7 ff ff       	call   40000370 <printf>
        exit();
40002c39:	83 c4 10             	add    $0x10,%esp
40002c3c:	eb 16                	jmp    40002c54 <unlinkread+0x184>
40002c3e:	66 90                	xchg   %ax,%ax
        printf("open unlinkread failed\n");
40002c40:	83 ec 0c             	sub    $0xc,%esp
40002c43:	8d 86 16 c8 ff ff    	lea    -0x37ea(%esi),%eax
40002c49:	89 f3                	mov    %esi,%ebx
40002c4b:	50                   	push   %eax
40002c4c:	e8 1f d7 ff ff       	call   40000370 <printf>
        exit();
40002c51:	83 c4 10             	add    $0x10,%esp
}
40002c54:	83 c4 1c             	add    $0x1c,%esp
40002c57:	5b                   	pop    %ebx
40002c58:	5e                   	pop    %esi
40002c59:	5f                   	pop    %edi
40002c5a:	5d                   	pop    %ebp
40002c5b:	c3                   	ret
40002c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("create unlinkread failed\n");
40002c60:	83 ec 0c             	sub    $0xc,%esp
40002c63:	8d 86 fc c7 ff ff    	lea    -0x3804(%esi),%eax
40002c69:	89 f3                	mov    %esi,%ebx
40002c6b:	50                   	push   %eax
40002c6c:	e8 ff d6 ff ff       	call   40000370 <printf>
        exit();
40002c71:	83 c4 10             	add    $0x10,%esp
}
40002c74:	83 c4 1c             	add    $0x1c,%esp
40002c77:	5b                   	pop    %ebx
40002c78:	5e                   	pop    %esi
40002c79:	5f                   	pop    %edi
40002c7a:	5d                   	pop    %ebp
40002c7b:	c3                   	ret
40002c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("unlinkread read failed");
40002c80:	83 ec 0c             	sub    $0xc,%esp
40002c83:	8d 86 4c c8 ff ff    	lea    -0x37b4(%esi),%eax
40002c89:	89 f3                	mov    %esi,%ebx
40002c8b:	50                   	push   %eax
40002c8c:	e8 df d6 ff ff       	call   40000370 <printf>
        exit();
40002c91:	83 c4 10             	add    $0x10,%esp
}
40002c94:	83 c4 1c             	add    $0x1c,%esp
40002c97:	5b                   	pop    %ebx
40002c98:	5e                   	pop    %esi
40002c99:	5f                   	pop    %edi
40002c9a:	5d                   	pop    %ebp
40002c9b:	c3                   	ret
40002c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("unlinkread wrong data\n");
40002ca0:	83 ec 0c             	sub    $0xc,%esp
40002ca3:	8d 86 63 c8 ff ff    	lea    -0x379d(%esi),%eax
40002ca9:	89 f3                	mov    %esi,%ebx
40002cab:	50                   	push   %eax
40002cac:	e8 bf d6 ff ff       	call   40000370 <printf>
        exit();
40002cb1:	83 c4 10             	add    $0x10,%esp
40002cb4:	eb 9e                	jmp    40002c54 <unlinkread+0x184>
40002cb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002cbd:	00 
40002cbe:	66 90                	xchg   %ax,%ax
    asm volatile ("int %2"
40002cc0:	b8 05 00 00 00       	mov    $0x5,%eax
40002cc5:	89 eb                	mov    %ebp,%ebx
40002cc7:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40002cc9:	83 ec 0c             	sub    $0xc,%esp
40002ccc:	89 f3                	mov    %esi,%ebx
40002cce:	57                   	push   %edi
40002ccf:	e8 fc de ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002cd4:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002cd6:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002cd9:	b8 0b 00 00 00       	mov    $0xb,%eax
40002cde:	cd 30                	int    $0x30
    printf("=====unlinkread ok=====\n\n");
40002ce0:	8d 86 93 c8 ff ff    	lea    -0x376d(%esi),%eax
40002ce6:	89 f3                	mov    %esi,%ebx
40002ce8:	89 04 24             	mov    %eax,(%esp)
40002ceb:	e8 80 d6 ff ff       	call   40000370 <printf>
40002cf0:	83 c4 10             	add    $0x10,%esp
40002cf3:	e9 5c ff ff ff       	jmp    40002c54 <unlinkread+0x184>
        printf("unlink unlinkread failed\n");
40002cf8:	83 ec 0c             	sub    $0xc,%esp
40002cfb:	8d 86 2e c8 ff ff    	lea    -0x37d2(%esi),%eax
40002d01:	89 f3                	mov    %esi,%ebx
40002d03:	50                   	push   %eax
40002d04:	e8 67 d6 ff ff       	call   40000370 <printf>
        exit();
40002d09:	83 c4 10             	add    $0x10,%esp
40002d0c:	e9 43 ff ff ff       	jmp    40002c54 <unlinkread+0x184>
40002d11:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002d18:	00 
40002d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40002d20 <dirfile>:
{
40002d20:	55                   	push   %ebp
40002d21:	57                   	push   %edi
40002d22:	e8 c9 06 00 00       	call   400033f0 <__x86.get_pc_thunk.di>
40002d27:	81 c7 cd 52 00 00    	add    $0x52cd,%edi
40002d2d:	56                   	push   %esi
    asm volatile ("int %2"
40002d2e:	be 04 00 00 00       	mov    $0x4,%esi
40002d33:	53                   	push   %ebx
40002d34:	83 ec 28             	sub    $0x28,%esp
    printf("=====dir vs file=====\n");
40002d37:	8d 87 ad c8 ff ff    	lea    -0x3753(%edi),%eax
40002d3d:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40002d3f:	8d af c4 c8 ff ff    	lea    -0x373c(%edi),%ebp
40002d45:	50                   	push   %eax
40002d46:	e8 25 d6 ff ff       	call   40000370 <printf>
40002d4b:	89 2c 24             	mov    %ebp,(%esp)
40002d4e:	e8 7d de ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002d53:	b9 00 02 00 00       	mov    $0x200,%ecx
40002d58:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40002d5a:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002d5d:	89 f0                	mov    %esi,%eax
40002d5f:	cd 30                	int    $0x30
    if (fd < 0) {
40002d61:	83 c4 10             	add    $0x10,%esp
40002d64:	85 db                	test   %ebx,%ebx
40002d66:	78 48                	js     40002db0 <dirfile+0x90>
40002d68:	85 c0                	test   %eax,%eax
40002d6a:	75 44                	jne    40002db0 <dirfile+0x90>
    asm volatile ("int %2"
40002d6c:	b8 05 00 00 00       	mov    $0x5,%eax
40002d71:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40002d73:	83 ec 0c             	sub    $0xc,%esp
40002d76:	89 fb                	mov    %edi,%ebx
40002d78:	55                   	push   %ebp
40002d79:	e8 52 de ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002d7e:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40002d80:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002d83:	b8 09 00 00 00       	mov    $0x9,%eax
40002d88:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002d8a:	83 c4 10             	add    $0x10,%esp
40002d8d:	85 c0                	test   %eax,%eax
40002d8f:	75 3f                	jne    40002dd0 <dirfile+0xb0>
        printf("chdir dirfile succeeded!\n");
40002d91:	83 ec 0c             	sub    $0xc,%esp
40002d94:	8d 87 e3 c8 ff ff    	lea    -0x371d(%edi),%eax
40002d9a:	89 fb                	mov    %edi,%ebx
40002d9c:	50                   	push   %eax
40002d9d:	e8 ce d5 ff ff       	call   40000370 <printf>
        exit();
40002da2:	83 c4 10             	add    $0x10,%esp
}
40002da5:	83 c4 1c             	add    $0x1c,%esp
40002da8:	5b                   	pop    %ebx
40002da9:	5e                   	pop    %esi
40002daa:	5f                   	pop    %edi
40002dab:	5d                   	pop    %ebp
40002dac:	c3                   	ret
40002dad:	8d 76 00             	lea    0x0(%esi),%esi
        printf("create dirfile failed\n");
40002db0:	83 ec 0c             	sub    $0xc,%esp
40002db3:	8d 87 cc c8 ff ff    	lea    -0x3734(%edi),%eax
40002db9:	89 fb                	mov    %edi,%ebx
40002dbb:	50                   	push   %eax
40002dbc:	e8 af d5 ff ff       	call   40000370 <printf>
        exit();
40002dc1:	83 c4 10             	add    $0x10,%esp
}
40002dc4:	83 c4 1c             	add    $0x1c,%esp
40002dc7:	5b                   	pop    %ebx
40002dc8:	5e                   	pop    %esi
40002dc9:	5f                   	pop    %edi
40002dca:	5d                   	pop    %ebp
40002dcb:	c3                   	ret
40002dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    int len = strlen(path) + 1;
40002dd0:	83 ec 0c             	sub    $0xc,%esp
40002dd3:	8d 9f fd c8 ff ff    	lea    -0x3703(%edi),%ebx
40002dd9:	89 5c 24 14          	mov    %ebx,0x14(%esp)
40002ddd:	53                   	push   %ebx
40002dde:	89 fb                	mov    %edi,%ebx
40002de0:	e8 eb dd ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002de5:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40002de9:	31 c9                	xor    %ecx,%ecx
    int len = strlen(path) + 1;
40002deb:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002dee:	89 f0                	mov    %esi,%eax
40002df0:	cd 30                	int    $0x30
    if (fd >= 0) {
40002df2:	83 c4 10             	add    $0x10,%esp
40002df5:	85 db                	test   %ebx,%ebx
40002df7:	78 04                	js     40002dfd <dirfile+0xdd>
40002df9:	85 c0                	test   %eax,%eax
40002dfb:	74 66                	je     40002e63 <dirfile+0x143>
    int len = strlen(path) + 1;
40002dfd:	83 ec 0c             	sub    $0xc,%esp
40002e00:	89 fb                	mov    %edi,%ebx
40002e02:	8b 74 24 14          	mov    0x14(%esp),%esi
40002e06:	56                   	push   %esi
40002e07:	e8 c4 dd ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002e0c:	b9 00 02 00 00       	mov    $0x200,%ecx
40002e11:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002e13:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002e16:	b8 04 00 00 00       	mov    $0x4,%eax
40002e1b:	cd 30                	int    $0x30
    if (fd >= 0) {
40002e1d:	83 c4 10             	add    $0x10,%esp
40002e20:	85 db                	test   %ebx,%ebx
40002e22:	78 04                	js     40002e28 <dirfile+0x108>
40002e24:	85 c0                	test   %eax,%eax
40002e26:	74 3b                	je     40002e63 <dirfile+0x143>
    int len = strlen(path) + 1;
40002e28:	83 ec 0c             	sub    $0xc,%esp
40002e2b:	89 fb                	mov    %edi,%ebx
40002e2d:	8b 74 24 14          	mov    0x14(%esp),%esi
40002e31:	56                   	push   %esi
40002e32:	e8 99 dd ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002e37:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002e39:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002e3c:	b8 08 00 00 00       	mov    $0x8,%eax
40002e41:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002e43:	83 c4 10             	add    $0x10,%esp
40002e46:	85 c0                	test   %eax,%eax
40002e48:	75 32                	jne    40002e7c <dirfile+0x15c>
        printf("mkdir dirfile/xx succeeded!\n");
40002e4a:	83 ec 0c             	sub    $0xc,%esp
40002e4d:	8d 87 26 c9 ff ff    	lea    -0x36da(%edi),%eax
40002e53:	89 fb                	mov    %edi,%ebx
40002e55:	50                   	push   %eax
40002e56:	e8 15 d5 ff ff       	call   40000370 <printf>
        exit();
40002e5b:	83 c4 10             	add    $0x10,%esp
40002e5e:	e9 42 ff ff ff       	jmp    40002da5 <dirfile+0x85>
        printf("create dirfile/xx succeeded!\n");
40002e63:	83 ec 0c             	sub    $0xc,%esp
40002e66:	8d 87 08 c9 ff ff    	lea    -0x36f8(%edi),%eax
40002e6c:	89 fb                	mov    %edi,%ebx
40002e6e:	50                   	push   %eax
40002e6f:	e8 fc d4 ff ff       	call   40000370 <printf>
        exit();
40002e74:	83 c4 10             	add    $0x10,%esp
40002e77:	e9 29 ff ff ff       	jmp    40002da5 <dirfile+0x85>
    int len = strlen(path) + 1;
40002e7c:	83 ec 0c             	sub    $0xc,%esp
40002e7f:	89 fb                	mov    %edi,%ebx
40002e81:	8b 74 24 14          	mov    0x14(%esp),%esi
40002e85:	56                   	push   %esi
40002e86:	e8 45 dd ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002e8b:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002e8d:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002e90:	b8 0b 00 00 00       	mov    $0xb,%eax
40002e95:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002e97:	83 c4 10             	add    $0x10,%esp
40002e9a:	85 c0                	test   %eax,%eax
40002e9c:	75 19                	jne    40002eb7 <dirfile+0x197>
        printf("unlink dirfile/xx succeeded!\n");
40002e9e:	83 ec 0c             	sub    $0xc,%esp
40002ea1:	8d 87 43 c9 ff ff    	lea    -0x36bd(%edi),%eax
40002ea7:	89 fb                	mov    %edi,%ebx
40002ea9:	50                   	push   %eax
40002eaa:	e8 c1 d4 ff ff       	call   40000370 <printf>
        exit();
40002eaf:	83 c4 10             	add    $0x10,%esp
40002eb2:	e9 ee fe ff ff       	jmp    40002da5 <dirfile+0x85>
    int oldlen = strlen(old) + 1;
40002eb7:	83 ec 0c             	sub    $0xc,%esp
40002eba:	8d 9f 61 c9 ff ff    	lea    -0x369f(%edi),%ebx
40002ec0:	89 5c 24 18          	mov    %ebx,0x18(%esp)
40002ec4:	53                   	push   %ebx
40002ec5:	89 fb                	mov    %edi,%ebx
40002ec7:	e8 04 dd ff ff       	call   40000bd0 <strlen>
40002ecc:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
40002ece:	58                   	pop    %eax
40002ecf:	ff 74 24 14          	push   0x14(%esp)
40002ed3:	e8 f8 dc ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
40002ed8:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
40002edb:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40002edf:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    int newlen = strlen(new) + 1;
40002ee3:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40002ee6:	b8 0a 00 00 00       	mov    $0xa,%eax
40002eeb:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002eed:	83 c4 10             	add    $0x10,%esp
40002ef0:	85 c0                	test   %eax,%eax
40002ef2:	75 19                	jne    40002f0d <dirfile+0x1ed>
        printf("link to dirfile/xx succeeded!\n");
40002ef4:	83 ec 0c             	sub    $0xc,%esp
40002ef7:	8d 87 14 d0 ff ff    	lea    -0x2fec(%edi),%eax
40002efd:	89 fb                	mov    %edi,%ebx
40002eff:	50                   	push   %eax
40002f00:	e8 6b d4 ff ff       	call   40000370 <printf>
        exit();
40002f05:	83 c4 10             	add    $0x10,%esp
40002f08:	e9 98 fe ff ff       	jmp    40002da5 <dirfile+0x85>
    int len = strlen(path) + 1;
40002f0d:	83 ec 0c             	sub    $0xc,%esp
40002f10:	89 fb                	mov    %edi,%ebx
40002f12:	55                   	push   %ebp
40002f13:	e8 b8 dc ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002f18:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40002f1a:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002f1d:	b8 0b 00 00 00       	mov    $0xb,%eax
40002f22:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002f24:	83 c4 10             	add    $0x10,%esp
40002f27:	85 c0                	test   %eax,%eax
40002f29:	0f 85 b0 00 00 00    	jne    40002fdf <dirfile+0x2bf>
    int len = strlen(path) + 1;
40002f2f:	83 ec 0c             	sub    $0xc,%esp
40002f32:	8d b7 14 c5 ff ff    	lea    -0x3aec(%edi),%esi
40002f38:	89 fb                	mov    %edi,%ebx
40002f3a:	56                   	push   %esi
40002f3b:	e8 90 dc ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002f40:	b9 02 00 00 00       	mov    $0x2,%ecx
40002f45:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002f47:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002f4a:	b8 04 00 00 00       	mov    $0x4,%eax
40002f4f:	cd 30                	int    $0x30
    if (fd >= 0) {
40002f51:	83 c4 10             	add    $0x10,%esp
40002f54:	85 db                	test   %ebx,%ebx
40002f56:	78 08                	js     40002f60 <dirfile+0x240>
40002f58:	85 c0                	test   %eax,%eax
40002f5a:	0f 84 98 00 00 00    	je     40002ff8 <dirfile+0x2d8>
    int len = strlen(path) + 1;
40002f60:	83 ec 0c             	sub    $0xc,%esp
40002f63:	89 fb                	mov    %edi,%ebx
40002f65:	56                   	push   %esi
40002f66:	e8 65 dc ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40002f6b:	31 c9                	xor    %ecx,%ecx
40002f6d:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002f6f:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002f72:	b8 04 00 00 00       	mov    $0x4,%eax
40002f77:	cd 30                	int    $0x30
40002f79:	89 de                	mov    %ebx,%esi
    return errno ? -1 : fd;
40002f7b:	83 c4 10             	add    $0x10,%esp
40002f7e:	85 c0                	test   %eax,%eax
40002f80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40002f85:	0f 45 f0             	cmovne %eax,%esi
    asm volatile ("int %2"
40002f88:	8d 8f f7 c5 ff ff    	lea    -0x3a09(%edi),%ecx
40002f8e:	b8 07 00 00 00       	mov    $0x7,%eax
40002f93:	ba 01 00 00 00       	mov    $0x1,%edx
40002f98:	89 f3                	mov    %esi,%ebx
40002f9a:	cd 30                	int    $0x30
    return errno ? -1 : ret;
40002f9c:	85 c0                	test   %eax,%eax
40002f9e:	75 04                	jne    40002fa4 <dirfile+0x284>
    if (write(fd, "x", 1) > 0) {
40002fa0:	85 db                	test   %ebx,%ebx
40002fa2:	7f 22                	jg     40002fc6 <dirfile+0x2a6>
    asm volatile ("int %2"
40002fa4:	b8 05 00 00 00       	mov    $0x5,%eax
40002fa9:	89 f3                	mov    %esi,%ebx
40002fab:	cd 30                	int    $0x30
    printf("=====dir vs file OK=====\n\n");
40002fad:	83 ec 0c             	sub    $0xc,%esp
40002fb0:	8d 87 94 c9 ff ff    	lea    -0x366c(%edi),%eax
40002fb6:	89 fb                	mov    %edi,%ebx
40002fb8:	50                   	push   %eax
40002fb9:	e8 b2 d3 ff ff       	call   40000370 <printf>
40002fbe:	83 c4 10             	add    $0x10,%esp
40002fc1:	e9 df fd ff ff       	jmp    40002da5 <dirfile+0x85>
        printf("write . succeeded!\n");
40002fc6:	83 ec 0c             	sub    $0xc,%esp
40002fc9:	8d 87 80 c9 ff ff    	lea    -0x3680(%edi),%eax
40002fcf:	89 fb                	mov    %edi,%ebx
40002fd1:	50                   	push   %eax
40002fd2:	e8 99 d3 ff ff       	call   40000370 <printf>
        exit();
40002fd7:	83 c4 10             	add    $0x10,%esp
40002fda:	e9 c6 fd ff ff       	jmp    40002da5 <dirfile+0x85>
        printf("unlink dirfile failed!\n");
40002fdf:	83 ec 0c             	sub    $0xc,%esp
40002fe2:	8d 87 68 c9 ff ff    	lea    -0x3698(%edi),%eax
40002fe8:	89 fb                	mov    %edi,%ebx
40002fea:	50                   	push   %eax
40002feb:	e8 80 d3 ff ff       	call   40000370 <printf>
        exit();
40002ff0:	83 c4 10             	add    $0x10,%esp
40002ff3:	e9 ad fd ff ff       	jmp    40002da5 <dirfile+0x85>
        printf("open . for writing succeeded!\n");
40002ff8:	83 ec 0c             	sub    $0xc,%esp
40002ffb:	8d 87 34 d0 ff ff    	lea    -0x2fcc(%edi),%eax
40003001:	89 fb                	mov    %edi,%ebx
40003003:	50                   	push   %eax
40003004:	e8 67 d3 ff ff       	call   40000370 <printf>
        exit();
40003009:	83 c4 10             	add    $0x10,%esp
4000300c:	e9 94 fd ff ff       	jmp    40002da5 <dirfile+0x85>
40003011:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40003018:	00 
40003019:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40003020 <iref>:
{
40003020:	55                   	push   %ebp
40003021:	57                   	push   %edi
40003022:	e8 c9 03 00 00       	call   400033f0 <__x86.get_pc_thunk.di>
40003027:	81 c7 cd 4f 00 00    	add    $0x4fcd,%edi
4000302d:	56                   	push   %esi
4000302e:	53                   	push   %ebx
4000302f:	83 ec 28             	sub    $0x28,%esp
    printf("=====empty file name=====\n");
40003032:	8d 87 af c9 ff ff    	lea    -0x3651(%edi),%eax
40003038:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000303a:	8d af ae c9 ff ff    	lea    -0x3652(%edi),%ebp
40003040:	50                   	push   %eax
40003041:	e8 2a d3 ff ff       	call   40000370 <printf>
    for (i = 0; i < 50 + 1; i++) {
40003046:	8d 87 ca c9 ff ff    	lea    -0x3636(%edi),%eax
    printf("=====empty file name=====\n");
4000304c:	83 c4 10             	add    $0x10,%esp
4000304f:	89 44 24 04          	mov    %eax,0x4(%esp)
    int oldlen = strlen(old) + 1;
40003053:	8d 87 61 c9 ff ff    	lea    -0x369f(%edi),%eax
40003059:	89 44 24 08          	mov    %eax,0x8(%esp)
4000305d:	c7 44 24 0c 33 00 00 	movl   $0x33,0xc(%esp)
40003064:	00 
40003065:	e9 ec 00 00 00       	jmp    40003156 <iref+0x136>
4000306a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int len = strlen(path) + 1;
40003070:	83 ec 0c             	sub    $0xc,%esp
40003073:	89 fb                	mov    %edi,%ebx
40003075:	ff 74 24 10          	push   0x10(%esp)
40003079:	e8 52 db ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000307e:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    int len = strlen(path) + 1;
40003082:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40003085:	b8 09 00 00 00       	mov    $0x9,%eax
4000308a:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000308c:	83 c4 10             	add    $0x10,%esp
4000308f:	85 c0                	test   %eax,%eax
40003091:	0f 85 49 01 00 00    	jne    400031e0 <iref+0x1c0>
    int len = strlen(path) + 1;
40003097:	83 ec 0c             	sub    $0xc,%esp
4000309a:	89 fb                	mov    %edi,%ebx
4000309c:	55                   	push   %ebp
4000309d:	e8 2e db ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400030a2:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400030a4:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400030a7:	89 f0                	mov    %esi,%eax
400030a9:	cd 30                	int    $0x30
    int oldlen = strlen(old) + 1;
400030ab:	58                   	pop    %eax
400030ac:	ff 74 24 14          	push   0x14(%esp)
400030b0:	89 fb                	mov    %edi,%ebx
400030b2:	e8 19 db ff ff       	call   40000bd0 <strlen>
    int newlen = strlen(new) + 1;
400030b7:	89 2c 24             	mov    %ebp,(%esp)
    int oldlen = strlen(old) + 1;
400030ba:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
400030bc:	e8 0f db ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
400030c1:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
400030c4:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400030c8:	89 e9                	mov    %ebp,%ecx
    int newlen = strlen(new) + 1;
400030ca:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
400030cd:	b8 0a 00 00 00       	mov    $0xa,%eax
400030d2:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
400030d4:	89 fb                	mov    %edi,%ebx
400030d6:	89 2c 24             	mov    %ebp,(%esp)
400030d9:	e8 f2 da ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400030de:	b9 00 02 00 00       	mov    $0x200,%ecx
400030e3:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400030e5:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400030e8:	b8 04 00 00 00       	mov    $0x4,%eax
400030ed:	cd 30                	int    $0x30
        if (fd >= 0)
400030ef:	83 c4 10             	add    $0x10,%esp
400030f2:	85 db                	test   %ebx,%ebx
400030f4:	78 0b                	js     40003101 <iref+0xe1>
400030f6:	85 c0                	test   %eax,%eax
400030f8:	75 07                	jne    40003101 <iref+0xe1>
    asm volatile ("int %2"
400030fa:	b8 05 00 00 00       	mov    $0x5,%eax
400030ff:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40003101:	83 ec 0c             	sub    $0xc,%esp
40003104:	8d b7 f6 c5 ff ff    	lea    -0x3a0a(%edi),%esi
4000310a:	89 fb                	mov    %edi,%ebx
4000310c:	56                   	push   %esi
4000310d:	e8 be da ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40003112:	b9 00 02 00 00       	mov    $0x200,%ecx
40003117:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40003119:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000311c:	b8 04 00 00 00       	mov    $0x4,%eax
40003121:	cd 30                	int    $0x30
        if (fd >= 0)
40003123:	83 c4 10             	add    $0x10,%esp
40003126:	85 db                	test   %ebx,%ebx
40003128:	78 0b                	js     40003135 <iref+0x115>
4000312a:	85 c0                	test   %eax,%eax
4000312c:	75 07                	jne    40003135 <iref+0x115>
    asm volatile ("int %2"
4000312e:	b8 05 00 00 00       	mov    $0x5,%eax
40003133:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40003135:	83 ec 0c             	sub    $0xc,%esp
40003138:	89 fb                	mov    %edi,%ebx
4000313a:	56                   	push   %esi
4000313b:	e8 90 da ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40003140:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40003142:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40003145:	b8 0b 00 00 00       	mov    $0xb,%eax
4000314a:	cd 30                	int    $0x30
    for (i = 0; i < 50 + 1; i++) {
4000314c:	83 c4 10             	add    $0x10,%esp
4000314f:	83 6c 24 0c 01       	subl   $0x1,0xc(%esp)
40003154:	74 4a                	je     400031a0 <iref+0x180>
    int len = strlen(path) + 1;
40003156:	83 ec 0c             	sub    $0xc,%esp
40003159:	89 fb                	mov    %edi,%ebx
    asm volatile ("int %2"
4000315b:	be 08 00 00 00       	mov    $0x8,%esi
    int len = strlen(path) + 1;
40003160:	ff 74 24 10          	push   0x10(%esp)
40003164:	e8 67 da ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40003169:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    int len = strlen(path) + 1;
4000316d:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40003170:	89 f0                	mov    %esi,%eax
40003172:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40003174:	83 c4 10             	add    $0x10,%esp
40003177:	85 c0                	test   %eax,%eax
40003179:	0f 84 f1 fe ff ff    	je     40003070 <iref+0x50>
            printf("mkdir irefd failed\n");
4000317f:	83 ec 0c             	sub    $0xc,%esp
40003182:	8d 87 d0 c9 ff ff    	lea    -0x3630(%edi),%eax
40003188:	89 fb                	mov    %edi,%ebx
4000318a:	50                   	push   %eax
4000318b:	e8 e0 d1 ff ff       	call   40000370 <printf>
            exit();
40003190:	83 c4 10             	add    $0x10,%esp
}
40003193:	83 c4 1c             	add    $0x1c,%esp
40003196:	5b                   	pop    %ebx
40003197:	5e                   	pop    %esi
40003198:	5f                   	pop    %edi
40003199:	5d                   	pop    %ebp
4000319a:	c3                   	ret
4000319b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    int len = strlen(path) + 1;
400031a0:	83 ec 0c             	sub    $0xc,%esp
400031a3:	8d b7 26 c2 ff ff    	lea    -0x3dda(%edi),%esi
400031a9:	89 fb                	mov    %edi,%ebx
400031ab:	56                   	push   %esi
400031ac:	e8 1f da ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400031b1:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400031b3:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400031b6:	b8 09 00 00 00       	mov    $0x9,%eax
400031bb:	cd 30                	int    $0x30
    printf("=====empty file name OK=====\n\n");
400031bd:	8d 87 54 d0 ff ff    	lea    -0x2fac(%edi),%eax
400031c3:	89 fb                	mov    %edi,%ebx
400031c5:	89 04 24             	mov    %eax,(%esp)
400031c8:	e8 a3 d1 ff ff       	call   40000370 <printf>
400031cd:	83 c4 10             	add    $0x10,%esp
}
400031d0:	83 c4 1c             	add    $0x1c,%esp
400031d3:	5b                   	pop    %ebx
400031d4:	5e                   	pop    %esi
400031d5:	5f                   	pop    %edi
400031d6:	5d                   	pop    %ebp
400031d7:	c3                   	ret
400031d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400031df:	00 
            printf("chdir irefd failed\n");
400031e0:	83 ec 0c             	sub    $0xc,%esp
400031e3:	8d 87 e4 c9 ff ff    	lea    -0x361c(%edi),%eax
400031e9:	89 fb                	mov    %edi,%ebx
400031eb:	50                   	push   %eax
400031ec:	e8 7f d1 ff ff       	call   40000370 <printf>
            exit();
400031f1:	83 c4 10             	add    $0x10,%esp
}
400031f4:	83 c4 1c             	add    $0x1c,%esp
400031f7:	5b                   	pop    %ebx
400031f8:	5e                   	pop    %esi
400031f9:	5f                   	pop    %edi
400031fa:	5d                   	pop    %ebp
400031fb:	c3                   	ret
400031fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40003200 <bigdir>:
{
40003200:	55                   	push   %ebp
40003201:	57                   	push   %edi
40003202:	e8 e9 01 00 00       	call   400033f0 <__x86.get_pc_thunk.di>
40003207:	81 c7 ed 4d 00 00    	add    $0x4ded,%edi
4000320d:	56                   	push   %esi
4000320e:	53                   	push   %ebx
4000320f:	83 ec 28             	sub    $0x28,%esp
    printf("=====bigdir test=====\n");
40003212:	8d 87 f8 c9 ff ff    	lea    -0x3608(%edi),%eax
40003218:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000321a:	8d b7 0f ca ff ff    	lea    -0x35f1(%edi),%esi
40003220:	50                   	push   %eax
40003221:	e8 4a d1 ff ff       	call   40000370 <printf>
40003226:	89 34 24             	mov    %esi,(%esp)
40003229:	e8 a2 d9 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000322e:	89 74 24 18          	mov    %esi,0x18(%esp)
40003232:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40003234:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40003237:	b8 0b 00 00 00       	mov    $0xb,%eax
4000323c:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
4000323e:	8b 74 24 18          	mov    0x18(%esp),%esi
40003242:	89 fb                	mov    %edi,%ebx
40003244:	89 34 24             	mov    %esi,(%esp)
40003247:	e8 84 d9 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
4000324c:	b9 00 02 00 00       	mov    $0x200,%ecx
40003251:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40003253:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40003256:	b8 04 00 00 00       	mov    $0x4,%eax
4000325b:	cd 30                	int    $0x30
    if (fd < 0) {
4000325d:	83 c4 10             	add    $0x10,%esp
40003260:	85 db                	test   %ebx,%ebx
40003262:	0f 88 b8 00 00 00    	js     40003320 <bigdir+0x120>
40003268:	85 c0                	test   %eax,%eax
4000326a:	0f 85 b0 00 00 00    	jne    40003320 <bigdir+0x120>
    asm volatile ("int %2"
40003270:	b8 05 00 00 00       	mov    $0x5,%eax
40003275:	cd 30                	int    $0x30
    for (i = 0; i < 500; i++) {
40003277:	8d 35 2c 00 00 00    	lea    0x2c,%esi
4000327d:	8d 87 2c 00 00 00    	lea    0x2c(%edi),%eax
40003283:	31 ed                	xor    %ebp,%ebp
40003285:	89 44 24 04          	mov    %eax,0x4(%esp)
    asm volatile ("int %2"
40003289:	89 74 24 0c          	mov    %esi,0xc(%esp)
4000328d:	eb 10                	jmp    4000329f <bigdir+0x9f>
4000328f:	90                   	nop
40003290:	83 c5 01             	add    $0x1,%ebp
40003293:	81 fd f4 01 00 00    	cmp    $0x1f4,%ebp
40003299:	0f 84 9d 00 00 00    	je     4000333c <bigdir+0x13c>
        namel[1] = '0' + (i / 64);
4000329f:	89 e8                	mov    %ebp,%eax
        namel[0] = 'x';
400032a1:	8b 54 24 0c          	mov    0xc(%esp),%edx
    int oldlen = strlen(old) + 1;
400032a5:	83 ec 0c             	sub    $0xc,%esp
400032a8:	89 fb                	mov    %edi,%ebx
        namel[1] = '0' + (i / 64);
400032aa:	c1 f8 06             	sar    $0x6,%eax
400032ad:	83 c0 30             	add    $0x30,%eax
        namel[0] = 'x';
400032b0:	c6 04 3a 78          	movb   $0x78,(%edx,%edi,1)
        namel[1] = '0' + (i / 64);
400032b4:	88 44 3a 01          	mov    %al,0x1(%edx,%edi,1)
        namel[2] = '0' + (i % 64);
400032b8:	89 e8                	mov    %ebp,%eax
400032ba:	83 e0 3f             	and    $0x3f,%eax
        namel[3] = '\0';
400032bd:	c6 44 3a 03 00       	movb   $0x0,0x3(%edx,%edi,1)
        namel[2] = '0' + (i % 64);
400032c2:	83 c0 30             	add    $0x30,%eax
400032c5:	88 44 3a 02          	mov    %al,0x2(%edx,%edi,1)
400032c9:	ff 74 24 14          	push   0x14(%esp)
400032cd:	e8 fe d8 ff ff       	call   40000bd0 <strlen>
400032d2:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
400032d4:	58                   	pop    %eax
400032d5:	ff 74 24 10          	push   0x10(%esp)
400032d9:	e8 f2 d8 ff ff       	call   40000bd0 <strlen>
    int oldlen = strlen(old) + 1;
400032de:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
400032e1:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400032e5:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    int newlen = strlen(new) + 1;
400032e9:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
400032ec:	b8 0a 00 00 00       	mov    $0xa,%eax
400032f1:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400032f3:	83 c4 10             	add    $0x10,%esp
400032f6:	85 c0                	test   %eax,%eax
400032f8:	74 96                	je     40003290 <bigdir+0x90>
            printf("bigdir link failed\n");
400032fa:	83 ec 0c             	sub    $0xc,%esp
400032fd:	8d 87 28 ca ff ff    	lea    -0x35d8(%edi),%eax
40003303:	89 fb                	mov    %edi,%ebx
40003305:	50                   	push   %eax
40003306:	e8 65 d0 ff ff       	call   40000370 <printf>
            exit();
4000330b:	83 c4 10             	add    $0x10,%esp
}
4000330e:	83 c4 1c             	add    $0x1c,%esp
40003311:	5b                   	pop    %ebx
40003312:	5e                   	pop    %esi
40003313:	5f                   	pop    %edi
40003314:	5d                   	pop    %ebp
40003315:	c3                   	ret
40003316:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000331d:	00 
4000331e:	66 90                	xchg   %ax,%ax
        printf("bigdir create failed\n");
40003320:	83 ec 0c             	sub    $0xc,%esp
40003323:	8d 87 12 ca ff ff    	lea    -0x35ee(%edi),%eax
40003329:	89 fb                	mov    %edi,%ebx
4000332b:	50                   	push   %eax
4000332c:	e8 3f d0 ff ff       	call   40000370 <printf>
        exit();
40003331:	83 c4 10             	add    $0x10,%esp
}
40003334:	83 c4 1c             	add    $0x1c,%esp
40003337:	5b                   	pop    %ebx
40003338:	5e                   	pop    %esi
40003339:	5f                   	pop    %edi
4000333a:	5d                   	pop    %ebp
4000333b:	c3                   	ret
4000333c:	8b 74 24 0c          	mov    0xc(%esp),%esi
    int len = strlen(path) + 1;
40003340:	83 ec 0c             	sub    $0xc,%esp
40003343:	89 fb                	mov    %edi,%ebx
40003345:	89 c5                	mov    %eax,%ebp
40003347:	ff 74 24 14          	push   0x14(%esp)
4000334b:	e8 80 d8 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
40003350:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    int len = strlen(path) + 1;
40003354:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40003357:	b8 0b 00 00 00       	mov    $0xb,%eax
4000335c:	cd 30                	int    $0x30
4000335e:	83 c4 10             	add    $0x10,%esp
40003361:	eb 10                	jmp    40003373 <bigdir+0x173>
40003363:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    for (i = 0; i < 500; i++) {
40003368:	83 c5 01             	add    $0x1,%ebp
4000336b:	81 fd f4 01 00 00    	cmp    $0x1f4,%ebp
40003371:	74 60                	je     400033d3 <bigdir+0x1d3>
        namel[1] = '0' + (i / 64);
40003373:	89 e8                	mov    %ebp,%eax
    int len = strlen(path) + 1;
40003375:	83 ec 0c             	sub    $0xc,%esp
        namel[0] = 'x';
40003378:	c6 04 3e 78          	movb   $0x78,(%esi,%edi,1)
4000337c:	89 fb                	mov    %edi,%ebx
        namel[1] = '0' + (i / 64);
4000337e:	c1 f8 06             	sar    $0x6,%eax
        namel[3] = '\0';
40003381:	c6 44 3e 03 00       	movb   $0x0,0x3(%esi,%edi,1)
        namel[1] = '0' + (i / 64);
40003386:	83 c0 30             	add    $0x30,%eax
40003389:	88 44 3e 01          	mov    %al,0x1(%esi,%edi,1)
        namel[2] = '0' + (i % 64);
4000338d:	89 e8                	mov    %ebp,%eax
4000338f:	83 e0 3f             	and    $0x3f,%eax
40003392:	83 c0 30             	add    $0x30,%eax
40003395:	88 44 3e 02          	mov    %al,0x2(%esi,%edi,1)
40003399:	ff 74 24 10          	push   0x10(%esp)
4000339d:	e8 2e d8 ff ff       	call   40000bd0 <strlen>
    asm volatile ("int %2"
400033a2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    int len = strlen(path) + 1;
400033a6:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400033a9:	b8 0b 00 00 00       	mov    $0xb,%eax
400033ae:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400033b0:	83 c4 10             	add    $0x10,%esp
400033b3:	85 c0                	test   %eax,%eax
400033b5:	74 b1                	je     40003368 <bigdir+0x168>
            printf("bigdir unlink failed");
400033b7:	83 ec 0c             	sub    $0xc,%esp
400033ba:	8d 87 3c ca ff ff    	lea    -0x35c4(%edi),%eax
400033c0:	89 fb                	mov    %edi,%ebx
400033c2:	50                   	push   %eax
400033c3:	e8 a8 cf ff ff       	call   40000370 <printf>
            exit();
400033c8:	83 c4 10             	add    $0x10,%esp
}
400033cb:	83 c4 1c             	add    $0x1c,%esp
400033ce:	5b                   	pop    %ebx
400033cf:	5e                   	pop    %esi
400033d0:	5f                   	pop    %edi
400033d1:	5d                   	pop    %ebp
400033d2:	c3                   	ret
    printf("=====bigdir ok=====\n\n");
400033d3:	83 ec 0c             	sub    $0xc,%esp
400033d6:	8d 87 51 ca ff ff    	lea    -0x35af(%edi),%eax
400033dc:	89 fb                	mov    %edi,%ebx
400033de:	50                   	push   %eax
400033df:	e8 8c cf ff ff       	call   40000370 <printf>
400033e4:	83 c4 10             	add    $0x10,%esp
400033e7:	e9 22 ff ff ff       	jmp    4000330e <bigdir+0x10e>

400033ec <__x86.get_pc_thunk.si>:
400033ec:	8b 34 24             	mov    (%esp),%esi
400033ef:	c3                   	ret

400033f0 <__x86.get_pc_thunk.di>:
400033f0:	8b 3c 24             	mov    (%esp),%edi
400033f3:	c3                   	ret

400033f4 <__x86.get_pc_thunk.bp>:
400033f4:	8b 2c 24             	mov    (%esp),%ebp
400033f7:	c3                   	ret
400033f8:	66 90                	xchg   %ax,%ax
400033fa:	66 90                	xchg   %ax,%ax
400033fc:	66 90                	xchg   %ax,%ax
400033fe:	66 90                	xchg   %ax,%ax

40003400 <__udivdi3>:
40003400:	f3 0f 1e fb          	endbr32
40003404:	55                   	push   %ebp
40003405:	57                   	push   %edi
40003406:	56                   	push   %esi
40003407:	53                   	push   %ebx
40003408:	83 ec 1c             	sub    $0x1c,%esp
4000340b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
4000340f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
40003413:	8b 74 24 34          	mov    0x34(%esp),%esi
40003417:	8b 5c 24 38          	mov    0x38(%esp),%ebx
4000341b:	85 c0                	test   %eax,%eax
4000341d:	75 19                	jne    40003438 <__udivdi3+0x38>
4000341f:	39 de                	cmp    %ebx,%esi
40003421:	73 4d                	jae    40003470 <__udivdi3+0x70>
40003423:	31 ff                	xor    %edi,%edi
40003425:	89 e8                	mov    %ebp,%eax
40003427:	89 f2                	mov    %esi,%edx
40003429:	f7 f3                	div    %ebx
4000342b:	89 fa                	mov    %edi,%edx
4000342d:	83 c4 1c             	add    $0x1c,%esp
40003430:	5b                   	pop    %ebx
40003431:	5e                   	pop    %esi
40003432:	5f                   	pop    %edi
40003433:	5d                   	pop    %ebp
40003434:	c3                   	ret
40003435:	8d 76 00             	lea    0x0(%esi),%esi
40003438:	39 c6                	cmp    %eax,%esi
4000343a:	73 14                	jae    40003450 <__udivdi3+0x50>
4000343c:	31 ff                	xor    %edi,%edi
4000343e:	31 c0                	xor    %eax,%eax
40003440:	89 fa                	mov    %edi,%edx
40003442:	83 c4 1c             	add    $0x1c,%esp
40003445:	5b                   	pop    %ebx
40003446:	5e                   	pop    %esi
40003447:	5f                   	pop    %edi
40003448:	5d                   	pop    %ebp
40003449:	c3                   	ret
4000344a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40003450:	0f bd f8             	bsr    %eax,%edi
40003453:	83 f7 1f             	xor    $0x1f,%edi
40003456:	75 48                	jne    400034a0 <__udivdi3+0xa0>
40003458:	39 f0                	cmp    %esi,%eax
4000345a:	72 06                	jb     40003462 <__udivdi3+0x62>
4000345c:	31 c0                	xor    %eax,%eax
4000345e:	39 dd                	cmp    %ebx,%ebp
40003460:	72 de                	jb     40003440 <__udivdi3+0x40>
40003462:	b8 01 00 00 00       	mov    $0x1,%eax
40003467:	eb d7                	jmp    40003440 <__udivdi3+0x40>
40003469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40003470:	89 d9                	mov    %ebx,%ecx
40003472:	85 db                	test   %ebx,%ebx
40003474:	75 0b                	jne    40003481 <__udivdi3+0x81>
40003476:	b8 01 00 00 00       	mov    $0x1,%eax
4000347b:	31 d2                	xor    %edx,%edx
4000347d:	f7 f3                	div    %ebx
4000347f:	89 c1                	mov    %eax,%ecx
40003481:	31 d2                	xor    %edx,%edx
40003483:	89 f0                	mov    %esi,%eax
40003485:	f7 f1                	div    %ecx
40003487:	89 c6                	mov    %eax,%esi
40003489:	89 e8                	mov    %ebp,%eax
4000348b:	89 f7                	mov    %esi,%edi
4000348d:	f7 f1                	div    %ecx
4000348f:	89 fa                	mov    %edi,%edx
40003491:	83 c4 1c             	add    $0x1c,%esp
40003494:	5b                   	pop    %ebx
40003495:	5e                   	pop    %esi
40003496:	5f                   	pop    %edi
40003497:	5d                   	pop    %ebp
40003498:	c3                   	ret
40003499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400034a0:	89 f9                	mov    %edi,%ecx
400034a2:	ba 20 00 00 00       	mov    $0x20,%edx
400034a7:	29 fa                	sub    %edi,%edx
400034a9:	d3 e0                	shl    %cl,%eax
400034ab:	89 44 24 08          	mov    %eax,0x8(%esp)
400034af:	89 d1                	mov    %edx,%ecx
400034b1:	89 d8                	mov    %ebx,%eax
400034b3:	d3 e8                	shr    %cl,%eax
400034b5:	89 c1                	mov    %eax,%ecx
400034b7:	8b 44 24 08          	mov    0x8(%esp),%eax
400034bb:	09 c1                	or     %eax,%ecx
400034bd:	89 f0                	mov    %esi,%eax
400034bf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400034c3:	89 f9                	mov    %edi,%ecx
400034c5:	d3 e3                	shl    %cl,%ebx
400034c7:	89 d1                	mov    %edx,%ecx
400034c9:	d3 e8                	shr    %cl,%eax
400034cb:	89 f9                	mov    %edi,%ecx
400034cd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
400034d1:	89 eb                	mov    %ebp,%ebx
400034d3:	d3 e6                	shl    %cl,%esi
400034d5:	89 d1                	mov    %edx,%ecx
400034d7:	d3 eb                	shr    %cl,%ebx
400034d9:	09 f3                	or     %esi,%ebx
400034db:	89 c6                	mov    %eax,%esi
400034dd:	89 f2                	mov    %esi,%edx
400034df:	89 d8                	mov    %ebx,%eax
400034e1:	f7 74 24 08          	divl   0x8(%esp)
400034e5:	89 d6                	mov    %edx,%esi
400034e7:	89 c3                	mov    %eax,%ebx
400034e9:	f7 64 24 0c          	mull   0xc(%esp)
400034ed:	39 d6                	cmp    %edx,%esi
400034ef:	72 1f                	jb     40003510 <__udivdi3+0x110>
400034f1:	89 f9                	mov    %edi,%ecx
400034f3:	d3 e5                	shl    %cl,%ebp
400034f5:	39 c5                	cmp    %eax,%ebp
400034f7:	73 04                	jae    400034fd <__udivdi3+0xfd>
400034f9:	39 d6                	cmp    %edx,%esi
400034fb:	74 13                	je     40003510 <__udivdi3+0x110>
400034fd:	89 d8                	mov    %ebx,%eax
400034ff:	31 ff                	xor    %edi,%edi
40003501:	e9 3a ff ff ff       	jmp    40003440 <__udivdi3+0x40>
40003506:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000350d:	00 
4000350e:	66 90                	xchg   %ax,%ax
40003510:	8d 43 ff             	lea    -0x1(%ebx),%eax
40003513:	31 ff                	xor    %edi,%edi
40003515:	e9 26 ff ff ff       	jmp    40003440 <__udivdi3+0x40>
4000351a:	66 90                	xchg   %ax,%ax
4000351c:	66 90                	xchg   %ax,%ax
4000351e:	66 90                	xchg   %ax,%ax

40003520 <__umoddi3>:
40003520:	f3 0f 1e fb          	endbr32
40003524:	55                   	push   %ebp
40003525:	57                   	push   %edi
40003526:	56                   	push   %esi
40003527:	53                   	push   %ebx
40003528:	83 ec 1c             	sub    $0x1c,%esp
4000352b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
4000352f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40003533:	8b 74 24 30          	mov    0x30(%esp),%esi
40003537:	8b 7c 24 38          	mov    0x38(%esp),%edi
4000353b:	89 da                	mov    %ebx,%edx
4000353d:	85 c0                	test   %eax,%eax
4000353f:	75 17                	jne    40003558 <__umoddi3+0x38>
40003541:	39 fb                	cmp    %edi,%ebx
40003543:	73 53                	jae    40003598 <__umoddi3+0x78>
40003545:	89 f0                	mov    %esi,%eax
40003547:	f7 f7                	div    %edi
40003549:	89 d0                	mov    %edx,%eax
4000354b:	31 d2                	xor    %edx,%edx
4000354d:	83 c4 1c             	add    $0x1c,%esp
40003550:	5b                   	pop    %ebx
40003551:	5e                   	pop    %esi
40003552:	5f                   	pop    %edi
40003553:	5d                   	pop    %ebp
40003554:	c3                   	ret
40003555:	8d 76 00             	lea    0x0(%esi),%esi
40003558:	89 f1                	mov    %esi,%ecx
4000355a:	39 c3                	cmp    %eax,%ebx
4000355c:	73 12                	jae    40003570 <__umoddi3+0x50>
4000355e:	89 f0                	mov    %esi,%eax
40003560:	83 c4 1c             	add    $0x1c,%esp
40003563:	5b                   	pop    %ebx
40003564:	5e                   	pop    %esi
40003565:	5f                   	pop    %edi
40003566:	5d                   	pop    %ebp
40003567:	c3                   	ret
40003568:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000356f:	00 
40003570:	0f bd e8             	bsr    %eax,%ebp
40003573:	83 f5 1f             	xor    $0x1f,%ebp
40003576:	75 48                	jne    400035c0 <__umoddi3+0xa0>
40003578:	39 d8                	cmp    %ebx,%eax
4000357a:	0f 82 d0 00 00 00    	jb     40003650 <__umoddi3+0x130>
40003580:	39 fe                	cmp    %edi,%esi
40003582:	0f 83 c8 00 00 00    	jae    40003650 <__umoddi3+0x130>
40003588:	89 c8                	mov    %ecx,%eax
4000358a:	83 c4 1c             	add    $0x1c,%esp
4000358d:	5b                   	pop    %ebx
4000358e:	5e                   	pop    %esi
4000358f:	5f                   	pop    %edi
40003590:	5d                   	pop    %ebp
40003591:	c3                   	ret
40003592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40003598:	89 f9                	mov    %edi,%ecx
4000359a:	85 ff                	test   %edi,%edi
4000359c:	75 0b                	jne    400035a9 <__umoddi3+0x89>
4000359e:	b8 01 00 00 00       	mov    $0x1,%eax
400035a3:	31 d2                	xor    %edx,%edx
400035a5:	f7 f7                	div    %edi
400035a7:	89 c1                	mov    %eax,%ecx
400035a9:	89 d8                	mov    %ebx,%eax
400035ab:	31 d2                	xor    %edx,%edx
400035ad:	f7 f1                	div    %ecx
400035af:	89 f0                	mov    %esi,%eax
400035b1:	f7 f1                	div    %ecx
400035b3:	89 d0                	mov    %edx,%eax
400035b5:	31 d2                	xor    %edx,%edx
400035b7:	eb 94                	jmp    4000354d <__umoddi3+0x2d>
400035b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400035c0:	89 e9                	mov    %ebp,%ecx
400035c2:	ba 20 00 00 00       	mov    $0x20,%edx
400035c7:	29 ea                	sub    %ebp,%edx
400035c9:	d3 e0                	shl    %cl,%eax
400035cb:	89 44 24 08          	mov    %eax,0x8(%esp)
400035cf:	89 d1                	mov    %edx,%ecx
400035d1:	89 f8                	mov    %edi,%eax
400035d3:	d3 e8                	shr    %cl,%eax
400035d5:	89 54 24 04          	mov    %edx,0x4(%esp)
400035d9:	8b 54 24 04          	mov    0x4(%esp),%edx
400035dd:	89 c1                	mov    %eax,%ecx
400035df:	8b 44 24 08          	mov    0x8(%esp),%eax
400035e3:	09 c1                	or     %eax,%ecx
400035e5:	89 d8                	mov    %ebx,%eax
400035e7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400035eb:	89 e9                	mov    %ebp,%ecx
400035ed:	d3 e7                	shl    %cl,%edi
400035ef:	89 d1                	mov    %edx,%ecx
400035f1:	d3 e8                	shr    %cl,%eax
400035f3:	89 e9                	mov    %ebp,%ecx
400035f5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
400035f9:	d3 e3                	shl    %cl,%ebx
400035fb:	89 c7                	mov    %eax,%edi
400035fd:	89 d1                	mov    %edx,%ecx
400035ff:	89 f0                	mov    %esi,%eax
40003601:	d3 e8                	shr    %cl,%eax
40003603:	89 fa                	mov    %edi,%edx
40003605:	89 e9                	mov    %ebp,%ecx
40003607:	09 d8                	or     %ebx,%eax
40003609:	d3 e6                	shl    %cl,%esi
4000360b:	f7 74 24 08          	divl   0x8(%esp)
4000360f:	89 d3                	mov    %edx,%ebx
40003611:	f7 64 24 0c          	mull   0xc(%esp)
40003615:	89 c7                	mov    %eax,%edi
40003617:	89 d1                	mov    %edx,%ecx
40003619:	39 d3                	cmp    %edx,%ebx
4000361b:	72 06                	jb     40003623 <__umoddi3+0x103>
4000361d:	75 10                	jne    4000362f <__umoddi3+0x10f>
4000361f:	39 c6                	cmp    %eax,%esi
40003621:	73 0c                	jae    4000362f <__umoddi3+0x10f>
40003623:	2b 44 24 0c          	sub    0xc(%esp),%eax
40003627:	1b 54 24 08          	sbb    0x8(%esp),%edx
4000362b:	89 d1                	mov    %edx,%ecx
4000362d:	89 c7                	mov    %eax,%edi
4000362f:	89 f2                	mov    %esi,%edx
40003631:	29 fa                	sub    %edi,%edx
40003633:	19 cb                	sbb    %ecx,%ebx
40003635:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
4000363a:	89 d8                	mov    %ebx,%eax
4000363c:	d3 e0                	shl    %cl,%eax
4000363e:	89 e9                	mov    %ebp,%ecx
40003640:	d3 ea                	shr    %cl,%edx
40003642:	d3 eb                	shr    %cl,%ebx
40003644:	09 d0                	or     %edx,%eax
40003646:	89 da                	mov    %ebx,%edx
40003648:	83 c4 1c             	add    $0x1c,%esp
4000364b:	5b                   	pop    %ebx
4000364c:	5e                   	pop    %esi
4000364d:	5f                   	pop    %edi
4000364e:	5d                   	pop    %ebp
4000364f:	c3                   	ret
40003650:	89 da                	mov    %ebx,%edx
40003652:	89 f1                	mov    %esi,%ecx
40003654:	29 f9                	sub    %edi,%ecx
40003656:	19 c2                	sbb    %eax,%edx
40003658:	89 c8                	mov    %ecx,%eax
4000365a:	e9 2b ff ff ff       	jmp    4000358a <__umoddi3+0x6a>
