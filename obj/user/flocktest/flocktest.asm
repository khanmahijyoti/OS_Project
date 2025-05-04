
obj/user/flocktest/flocktest:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:
    printf("=====flocktest_test_downgrade ok=====\n\n"); 
}


int main(int argc, char *argv[])
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	53                   	push   %ebx
4000000e:	e8 74 01 00 00       	call   40000187 <__x86.get_pc_thunk.bx>
40000013:	81 c3 e1 4f 00 00    	add    $0x4fe1,%ebx
40000019:	51                   	push   %ecx
    printf("*******flocktests starting*******\n\n");
4000001a:	83 ec 0c             	sub    $0xc,%esp
4000001d:	8d 83 00 dc ff ff    	lea    -0x2400(%ebx),%eax
40000023:	50                   	push   %eax
40000024:	e8 c7 02 00 00       	call   400002f0 <printf>

    flocktest_test_write();
40000029:	e8 f2 0f 00 00       	call   40001020 <flocktest_test_write>
    flocktest_test_read();
4000002e:	e8 ed 11 00 00       	call   40001220 <flocktest_test_read>
    flocktest_test_close();
40000033:	e8 18 13 00 00       	call   40001350 <flocktest_test_close>
    flocktest_test_nonblocking();
40000038:	e8 83 14 00 00       	call   400014c0 <flocktest_test_nonblocking>
    flocktest_test_upgrade();
4000003d:	e8 2e 17 00 00       	call   40001770 <flocktest_test_upgrade>
    flocktest_test_downgrade(); 
40000042:	e8 f9 18 00 00       	call   40001940 <flocktest_test_downgrade>

    printf("*******end of flocktests*******\n\n");
40000047:	8d 83 24 dc ff ff    	lea    -0x23dc(%ebx),%eax
4000004d:	89 04 24             	mov    %eax,(%esp)
40000050:	e8 9b 02 00 00       	call   400002f0 <printf>


    printf("*******flockdemo starting*******\n\n");
40000055:	8d 83 48 dc ff ff    	lea    -0x23b8(%ebx),%eax
4000005b:	89 04 24             	mov    %eax,(%esp)
4000005e:	e8 8d 02 00 00       	call   400002f0 <printf>

    pid_t flockdemo_pid;
    if ((flockdemo_pid = spawn(7, 1000)) != -1)
40000063:	59                   	pop    %ecx
40000064:	58                   	pop    %eax
40000065:	68 e8 03 00 00       	push   $0x3e8
4000006a:	6a 07                	push   $0x7
4000006c:	e8 2f 0a 00 00       	call   40000aa0 <spawn>
40000071:	83 c4 10             	add    $0x10,%esp
40000074:	83 f8 ff             	cmp    $0xffffffff,%eax
40000077:	74 1e                	je     40000097 <main+0x97>
        printf("flockdemo in process %d.\n", flockdemo_pid);
40000079:	52                   	push   %edx
4000007a:	52                   	push   %edx
4000007b:	50                   	push   %eax
4000007c:	8d 83 f0 d0 ff ff    	lea    -0x2f10(%ebx),%eax
40000082:	50                   	push   %eax
40000083:	e8 68 02 00 00       	call   400002f0 <printf>
40000088:	83 c4 10             	add    $0x10,%esp
    else
        printf("Failed to launch flockdemo.\n");

    return 0; 
4000008b:	8d 65 f8             	lea    -0x8(%ebp),%esp
4000008e:	31 c0                	xor    %eax,%eax
40000090:	59                   	pop    %ecx
40000091:	5b                   	pop    %ebx
40000092:	5d                   	pop    %ebp
40000093:	8d 61 fc             	lea    -0x4(%ecx),%esp
40000096:	c3                   	ret
        printf("Failed to launch flockdemo.\n");
40000097:	83 ec 0c             	sub    $0xc,%esp
4000009a:	8d 83 0a d1 ff ff    	lea    -0x2ef6(%ebx),%eax
400000a0:	50                   	push   %eax
400000a1:	e8 4a 02 00 00       	call   400002f0 <printf>
400000a6:	83 c4 10             	add    $0x10,%esp
400000a9:	eb e0                	jmp    4000008b <main+0x8b>

400000ab <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
400000ab:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
400000b1:	75 04                	jne    400000b7 <args_exist>

400000b3 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
400000b3:	6a 00                	push   $0x0
	pushl	$0
400000b5:	6a 00                	push   $0x0

400000b7 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
400000b7:	e8 44 ff ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
400000bc:	50                   	push   %eax

400000bd <spin>:
spin:
	jmp	spin
400000bd:	eb fe                	jmp    400000bd <spin>
400000bf:	90                   	nop

400000c0 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
400000c0:	53                   	push   %ebx
400000c1:	e8 c1 00 00 00       	call   40000187 <__x86.get_pc_thunk.bx>
400000c6:	81 c3 2e 4f 00 00    	add    $0x4f2e,%ebx
400000cc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
400000cf:	ff 74 24 18          	push   0x18(%esp)
400000d3:	ff 74 24 18          	push   0x18(%esp)
400000d7:	8d 83 0c d0 ff ff    	lea    -0x2ff4(%ebx),%eax
400000dd:	50                   	push   %eax
400000de:	e8 0d 02 00 00       	call   400002f0 <printf>
    vcprintf(fmt, ap);
400000e3:	58                   	pop    %eax
400000e4:	5a                   	pop    %edx
400000e5:	8d 44 24 24          	lea    0x24(%esp),%eax
400000e9:	50                   	push   %eax
400000ea:	ff 74 24 24          	push   0x24(%esp)
400000ee:	e8 9d 01 00 00       	call   40000290 <vcprintf>
    va_end(ap);
}
400000f3:	83 c4 18             	add    $0x18,%esp
400000f6:	5b                   	pop    %ebx
400000f7:	c3                   	ret
400000f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400000ff:	00 

40000100 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000100:	53                   	push   %ebx
40000101:	e8 81 00 00 00       	call   40000187 <__x86.get_pc_thunk.bx>
40000106:	81 c3 ee 4e 00 00    	add    $0x4eee,%ebx
4000010c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
4000010f:	ff 74 24 18          	push   0x18(%esp)
40000113:	ff 74 24 18          	push   0x18(%esp)
40000117:	8d 83 18 d0 ff ff    	lea    -0x2fe8(%ebx),%eax
4000011d:	50                   	push   %eax
4000011e:	e8 cd 01 00 00       	call   400002f0 <printf>
    vcprintf(fmt, ap);
40000123:	58                   	pop    %eax
40000124:	5a                   	pop    %edx
40000125:	8d 44 24 24          	lea    0x24(%esp),%eax
40000129:	50                   	push   %eax
4000012a:	ff 74 24 24          	push   0x24(%esp)
4000012e:	e8 5d 01 00 00       	call   40000290 <vcprintf>
    va_end(ap);
}
40000133:	83 c4 18             	add    $0x18,%esp
40000136:	5b                   	pop    %ebx
40000137:	c3                   	ret
40000138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000013f:	00 

40000140 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000140:	53                   	push   %ebx
40000141:	e8 41 00 00 00       	call   40000187 <__x86.get_pc_thunk.bx>
40000146:	81 c3 ae 4e 00 00    	add    $0x4eae,%ebx
4000014c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000014f:	ff 74 24 18          	push   0x18(%esp)
40000153:	ff 74 24 18          	push   0x18(%esp)
40000157:	8d 83 24 d0 ff ff    	lea    -0x2fdc(%ebx),%eax
4000015d:	50                   	push   %eax
4000015e:	e8 8d 01 00 00       	call   400002f0 <printf>
    vcprintf(fmt, ap);
40000163:	58                   	pop    %eax
40000164:	5a                   	pop    %edx
40000165:	8d 44 24 24          	lea    0x24(%esp),%eax
40000169:	50                   	push   %eax
4000016a:	ff 74 24 24          	push   0x24(%esp)
4000016e:	e8 1d 01 00 00       	call   40000290 <vcprintf>
40000173:	83 c4 10             	add    $0x10,%esp
40000176:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000017d:	00 
4000017e:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
40000180:	e8 3b 09 00 00       	call   40000ac0 <yield>
    while (1)
40000185:	eb f9                	jmp    40000180 <panic+0x40>

40000187 <__x86.get_pc_thunk.bx>:
40000187:	8b 1c 24             	mov    (%esp),%ebx
4000018a:	c3                   	ret
4000018b:	66 90                	xchg   %ax,%ax
4000018d:	66 90                	xchg   %ax,%ax
4000018f:	90                   	nop

40000190 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
40000190:	55                   	push   %ebp
40000191:	57                   	push   %edi
40000192:	56                   	push   %esi
40000193:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
40000194:	8b 44 24 14          	mov    0x14(%esp),%eax
40000198:	0f b6 00             	movzbl (%eax),%eax
4000019b:	3c 2b                	cmp    $0x2b,%al
4000019d:	0f 84 8d 00 00 00    	je     40000230 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
400001a3:	3c 2d                	cmp    $0x2d,%al
400001a5:	74 59                	je     40000200 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001a7:	8d 50 d0             	lea    -0x30(%eax),%edx
400001aa:	80 fa 09             	cmp    $0x9,%dl
400001ad:	77 71                	ja     40000220 <atoi+0x90>
    int negative = 0;
400001af:	31 ff                	xor    %edi,%edi
    int loc = 0;
400001b1:	31 f6                	xor    %esi,%esi
        loc++;
400001b3:	89 f2                	mov    %esi,%edx
    int acc = 0;
400001b5:	31 c9                	xor    %ecx,%ecx
400001b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001be:	00 
400001bf:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
400001c0:	83 e8 30             	sub    $0x30,%eax
400001c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
400001c6:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
400001c9:	0f be c0             	movsbl %al,%eax
400001cc:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001cf:	8b 44 24 14          	mov    0x14(%esp),%eax
400001d3:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
400001d7:	8d 68 d0             	lea    -0x30(%eax),%ebp
400001da:	89 eb                	mov    %ebp,%ebx
400001dc:	80 fb 09             	cmp    $0x9,%bl
400001df:	76 df                	jbe    400001c0 <atoi+0x30>
    }
    if (numstart == loc) {
400001e1:	39 f2                	cmp    %esi,%edx
400001e3:	74 3b                	je     40000220 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
400001e5:	89 c8                	mov    %ecx,%eax
400001e7:	f7 d8                	neg    %eax
400001e9:	85 ff                	test   %edi,%edi
400001eb:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
400001ee:	8b 44 24 18          	mov    0x18(%esp),%eax
400001f2:	89 08                	mov    %ecx,(%eax)
    return loc;
}
400001f4:	89 d0                	mov    %edx,%eax
400001f6:	5b                   	pop    %ebx
400001f7:	5e                   	pop    %esi
400001f8:	5f                   	pop    %edi
400001f9:	5d                   	pop    %ebp
400001fa:	c3                   	ret
400001fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000200:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
40000204:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000209:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000020e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000212:	8d 50 d0             	lea    -0x30(%eax),%edx
40000215:	80 fa 09             	cmp    $0x9,%dl
40000218:	76 99                	jbe    400001b3 <atoi+0x23>
4000021a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000220:	31 d2                	xor    %edx,%edx
}
40000222:	5b                   	pop    %ebx
40000223:	89 d0                	mov    %edx,%eax
40000225:	5e                   	pop    %esi
40000226:	5f                   	pop    %edi
40000227:	5d                   	pop    %ebp
40000228:	c3                   	ret
40000229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000230:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000234:	31 ff                	xor    %edi,%edi
        loc++;
40000236:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000023b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000023f:	8d 50 d0             	lea    -0x30(%eax),%edx
40000242:	80 fa 09             	cmp    $0x9,%dl
40000245:	0f 86 68 ff ff ff    	jbe    400001b3 <atoi+0x23>
        return 0;
4000024b:	31 d2                	xor    %edx,%edx
4000024d:	eb d3                	jmp    40000222 <atoi+0x92>
4000024f:	90                   	nop

40000250 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
40000250:	53                   	push   %ebx
40000251:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000255:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000025a:	8b 02                	mov    (%edx),%eax
4000025c:	8d 48 01             	lea    0x1(%eax),%ecx
4000025f:	89 0a                	mov    %ecx,(%edx)
40000261:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000265:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
4000026b:	75 14                	jne    40000281 <putch+0x31>
        b->buf[b->idx] = 0;
4000026d:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
40000274:	8d 5a 08             	lea    0x8(%edx),%ebx
#include <x86.h>
#include <file.h>

static gcc_inline void sys_puts(const char *s, size_t len)
{
    asm volatile ("int %0"
40000277:	31 c0                	xor    %eax,%eax
40000279:	cd 30                	int    $0x30
        b->idx = 0;
4000027b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
40000281:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
40000285:	5b                   	pop    %ebx
40000286:	c3                   	ret
40000287:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000028e:	00 
4000028f:	90                   	nop

40000290 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
40000290:	53                   	push   %ebx
40000291:	e8 f1 fe ff ff       	call   40000187 <__x86.get_pc_thunk.bx>
40000296:	81 c3 5e 4d 00 00    	add    $0x4d5e,%ebx
4000029c:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
400002a2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
400002a9:	00 
    b.cnt = 0;
400002aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400002b1:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
400002b2:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400002b9:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400002c0:	8d 44 24 10          	lea    0x10(%esp),%eax
400002c4:	50                   	push   %eax
400002c5:	8d 83 5c b2 ff ff    	lea    -0x4da4(%ebx),%eax
400002cb:	50                   	push   %eax
400002cc:	e8 3f 01 00 00       	call   40000410 <vprintfmt>

    b.buf[b.idx] = 0;
400002d1:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400002d5:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400002d9:	31 c0                	xor    %eax,%eax
400002db:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400002e0:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
400002e2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400002e6:	81 c4 28 02 00 00    	add    $0x228,%esp
400002ec:	5b                   	pop    %ebx
400002ed:	c3                   	ret
400002ee:	66 90                	xchg   %ax,%ax

400002f0 <printf>:

int printf(const char *fmt, ...)
{
400002f0:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
400002f3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400002f7:	50                   	push   %eax
400002f8:	ff 74 24 1c          	push   0x1c(%esp)
400002fc:	e8 8f ff ff ff       	call   40000290 <vcprintf>
    va_end(ap);

    return cnt;
}
40000301:	83 c4 1c             	add    $0x1c,%esp
40000304:	c3                   	ret
40000305:	66 90                	xchg   %ax,%ax
40000307:	66 90                	xchg   %ax,%ax
40000309:	66 90                	xchg   %ax,%ax
4000030b:	66 90                	xchg   %ax,%ax
4000030d:	66 90                	xchg   %ax,%ax
4000030f:	90                   	nop

40000310 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000310:	e8 86 07 00 00       	call   40000a9b <__x86.get_pc_thunk.cx>
40000315:	81 c1 df 4c 00 00    	add    $0x4cdf,%ecx
{
4000031b:	55                   	push   %ebp
4000031c:	57                   	push   %edi
4000031d:	89 d7                	mov    %edx,%edi
4000031f:	56                   	push   %esi
40000320:	89 c6                	mov    %eax,%esi
40000322:	53                   	push   %ebx
40000323:	83 ec 2c             	sub    $0x2c,%esp
40000326:	8b 44 24 40          	mov    0x40(%esp),%eax
4000032a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000032e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000332:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000339:	00 
{
4000033a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000033e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000342:	8b 44 24 48          	mov    0x48(%esp),%eax
40000346:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000034a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000034e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000352:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000356:	89 44 24 10          	mov    %eax,0x10(%esp)
4000035a:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
4000035e:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
40000361:	73 55                	jae    400003b8 <printnum+0xa8>
        while (--width > 0)
40000363:	83 fa 01             	cmp    $0x1,%edx
40000366:	7e 17                	jle    4000037f <printnum+0x6f>
40000368:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000036f:	00 
            putch(padc, putdat);
40000370:	83 ec 08             	sub    $0x8,%esp
40000373:	57                   	push   %edi
40000374:	55                   	push   %ebp
40000375:	ff d6                	call   *%esi
        while (--width > 0)
40000377:	83 c4 10             	add    $0x10,%esp
4000037a:	83 eb 01             	sub    $0x1,%ebx
4000037d:	75 f1                	jne    40000370 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
4000037f:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000383:	ff 74 24 14          	push   0x14(%esp)
40000387:	ff 74 24 14          	push   0x14(%esp)
4000038b:	ff 74 24 14          	push   0x14(%esp)
4000038f:	ff 74 24 14          	push   0x14(%esp)
40000393:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
40000397:	e8 b4 19 00 00       	call   40001d50 <__umoddi3>
4000039c:	0f be 84 03 30 d0 ff 	movsbl -0x2fd0(%ebx,%eax,1),%eax
400003a3:	ff 
400003a4:	89 44 24 50          	mov    %eax,0x50(%esp)
}
400003a8:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
400003ab:	89 f0                	mov    %esi,%eax
}
400003ad:	5b                   	pop    %ebx
400003ae:	5e                   	pop    %esi
400003af:	5f                   	pop    %edi
400003b0:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
400003b1:	ff e0                	jmp    *%eax
400003b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
400003b8:	83 ec 0c             	sub    $0xc,%esp
400003bb:	55                   	push   %ebp
400003bc:	53                   	push   %ebx
400003bd:	50                   	push   %eax
400003be:	83 ec 08             	sub    $0x8,%esp
400003c1:	ff 74 24 34          	push   0x34(%esp)
400003c5:	ff 74 24 34          	push   0x34(%esp)
400003c9:	ff 74 24 34          	push   0x34(%esp)
400003cd:	ff 74 24 34          	push   0x34(%esp)
400003d1:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400003d5:	e8 56 18 00 00       	call   40001c30 <__udivdi3>
400003da:	83 c4 18             	add    $0x18,%esp
400003dd:	52                   	push   %edx
400003de:	89 fa                	mov    %edi,%edx
400003e0:	50                   	push   %eax
400003e1:	89 f0                	mov    %esi,%eax
400003e3:	e8 28 ff ff ff       	call   40000310 <printnum>
400003e8:	83 c4 20             	add    $0x20,%esp
400003eb:	eb 92                	jmp    4000037f <printnum+0x6f>
400003ed:	8d 76 00             	lea    0x0(%esi),%esi

400003f0 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
400003f0:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
400003f4:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
400003f8:	8b 10                	mov    (%eax),%edx
400003fa:	3b 50 04             	cmp    0x4(%eax),%edx
400003fd:	73 0b                	jae    4000040a <sprintputch+0x1a>
        *b->buf++ = ch;
400003ff:	8d 4a 01             	lea    0x1(%edx),%ecx
40000402:	89 08                	mov    %ecx,(%eax)
40000404:	8b 44 24 04          	mov    0x4(%esp),%eax
40000408:	88 02                	mov    %al,(%edx)
}
4000040a:	c3                   	ret
4000040b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000410 <vprintfmt>:
{
40000410:	e8 7e 06 00 00       	call   40000a93 <__x86.get_pc_thunk.ax>
40000415:	05 df 4b 00 00       	add    $0x4bdf,%eax
4000041a:	55                   	push   %ebp
4000041b:	57                   	push   %edi
4000041c:	56                   	push   %esi
4000041d:	53                   	push   %ebx
4000041e:	83 ec 2c             	sub    $0x2c,%esp
40000421:	8b 74 24 40          	mov    0x40(%esp),%esi
40000425:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000429:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000042d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000431:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000435:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000438:	83 f8 25             	cmp    $0x25,%eax
4000043b:	75 19                	jne    40000456 <vprintfmt+0x46>
4000043d:	eb 29                	jmp    40000468 <vprintfmt+0x58>
4000043f:	90                   	nop
            putch(ch, putdat);
40000440:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000443:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000446:	57                   	push   %edi
40000447:	50                   	push   %eax
40000448:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000044a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000044e:	83 c4 10             	add    $0x10,%esp
40000451:	83 f8 25             	cmp    $0x25,%eax
40000454:	74 12                	je     40000468 <vprintfmt+0x58>
            if (ch == '\0')
40000456:	85 c0                	test   %eax,%eax
40000458:	75 e6                	jne    40000440 <vprintfmt+0x30>
}
4000045a:	83 c4 2c             	add    $0x2c,%esp
4000045d:	5b                   	pop    %ebx
4000045e:	5e                   	pop    %esi
4000045f:	5f                   	pop    %edi
40000460:	5d                   	pop    %ebp
40000461:	c3                   	ret
40000462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
40000468:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
4000046d:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
40000472:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
40000479:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000480:	ff 
        lflag = 0;
40000481:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
40000488:	00 
40000489:	89 54 24 14          	mov    %edx,0x14(%esp)
4000048d:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000491:	0f b6 0b             	movzbl (%ebx),%ecx
40000494:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000497:	8d 41 dd             	lea    -0x23(%ecx),%eax
4000049a:	3c 55                	cmp    $0x55,%al
4000049c:	77 12                	ja     400004b0 <.L21>
4000049e:	8b 54 24 0c          	mov    0xc(%esp),%edx
400004a2:	0f b6 c0             	movzbl %al,%eax
400004a5:	8b b4 82 28 d1 ff ff 	mov    -0x2ed8(%edx,%eax,4),%esi
400004ac:	01 d6                	add    %edx,%esi
400004ae:	ff e6                	jmp    *%esi

400004b0 <.L21>:
            putch('%', putdat);
400004b0:	8b 74 24 40          	mov    0x40(%esp),%esi
400004b4:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
400004b7:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
400004b9:	57                   	push   %edi
400004ba:	6a 25                	push   $0x25
400004bc:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
400004be:	83 c4 10             	add    $0x10,%esp
400004c1:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
400004c5:	0f 84 66 ff ff ff    	je     40000431 <vprintfmt+0x21>
400004cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400004d0:	83 ed 01             	sub    $0x1,%ebp
400004d3:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400004d7:	75 f7                	jne    400004d0 <.L21+0x20>
400004d9:	e9 53 ff ff ff       	jmp    40000431 <vprintfmt+0x21>
400004de:	66 90                	xchg   %ax,%ax

400004e0 <.L31>:
                ch = *fmt;
400004e0:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
400004e4:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
400004e7:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
400004e9:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
400004ed:	8d 48 d0             	lea    -0x30(%eax),%ecx
400004f0:	83 f9 09             	cmp    $0x9,%ecx
400004f3:	77 28                	ja     4000051d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
400004f5:	8b 74 24 40          	mov    0x40(%esp),%esi
400004f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
40000500:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
40000503:	8d 14 92             	lea    (%edx,%edx,4),%edx
40000506:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
4000050a:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
4000050d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000510:	83 f9 09             	cmp    $0x9,%ecx
40000513:	76 eb                	jbe    40000500 <.L31+0x20>
40000515:	89 54 24 14          	mov    %edx,0x14(%esp)
40000519:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000051d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000521:	85 f6                	test   %esi,%esi
40000523:	0f 89 68 ff ff ff    	jns    40000491 <vprintfmt+0x81>
                width = precision, precision = -1;
40000529:	8b 44 24 14          	mov    0x14(%esp),%eax
4000052d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000534:	ff 
40000535:	89 44 24 08          	mov    %eax,0x8(%esp)
40000539:	e9 53 ff ff ff       	jmp    40000491 <vprintfmt+0x81>

4000053e <.L35>:
            altflag = 1;
4000053e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000545:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000547:	e9 45 ff ff ff       	jmp    40000491 <vprintfmt+0x81>

4000054c <.L34>:
            putch(ch, putdat);
4000054c:	8b 74 24 40          	mov    0x40(%esp),%esi
40000550:	83 ec 08             	sub    $0x8,%esp
40000553:	57                   	push   %edi
40000554:	6a 25                	push   $0x25
40000556:	ff d6                	call   *%esi
            break;
40000558:	83 c4 10             	add    $0x10,%esp
4000055b:	e9 d1 fe ff ff       	jmp    40000431 <vprintfmt+0x21>

40000560 <.L33>:
            precision = va_arg(ap, int);
40000560:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
40000564:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
40000566:	8b 00                	mov    (%eax),%eax
40000568:	89 44 24 14          	mov    %eax,0x14(%esp)
4000056c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000570:	83 c0 04             	add    $0x4,%eax
40000573:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
40000577:	eb a4                	jmp    4000051d <.L31+0x3d>

40000579 <.L32>:
            if (width < 0)
40000579:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000057d:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
4000057f:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000581:	85 c9                	test   %ecx,%ecx
40000583:	0f 49 c1             	cmovns %ecx,%eax
40000586:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
4000058a:	e9 02 ff ff ff       	jmp    40000491 <vprintfmt+0x81>

4000058f <.L30>:
            putch(va_arg(ap, int), putdat);
4000058f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000593:	8b 74 24 40          	mov    0x40(%esp),%esi
40000597:	83 ec 08             	sub    $0x8,%esp
4000059a:	57                   	push   %edi
4000059b:	8d 58 04             	lea    0x4(%eax),%ebx
4000059e:	8b 44 24 58          	mov    0x58(%esp),%eax
400005a2:	ff 30                	push   (%eax)
400005a4:	ff d6                	call   *%esi
400005a6:	89 5c 24 5c          	mov    %ebx,0x5c(%esp)
            break;
400005aa:	83 c4 10             	add    $0x10,%esp
400005ad:	e9 7f fe ff ff       	jmp    40000431 <vprintfmt+0x21>

400005b2 <.L24>:
    if (lflag >= 2)
400005b2:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400005b7:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400005bb:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400005bf:	0f 8f d8 01 00 00    	jg     4000079d <.L25+0xe0>
        return va_arg(*ap, unsigned long);
400005c5:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400005c9:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400005cc:	31 db                	xor    %ebx,%ebx
400005ce:	ba 0a 00 00 00       	mov    $0xa,%edx
400005d3:	8b 09                	mov    (%ecx),%ecx
400005d5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400005d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
400005e0:	83 ec 0c             	sub    $0xc,%esp
400005e3:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
400005e8:	50                   	push   %eax
400005e9:	89 f0                	mov    %esi,%eax
400005eb:	ff 74 24 18          	push   0x18(%esp)
400005ef:	52                   	push   %edx
400005f0:	89 fa                	mov    %edi,%edx
400005f2:	53                   	push   %ebx
400005f3:	51                   	push   %ecx
400005f4:	e8 17 fd ff ff       	call   40000310 <printnum>
            break;
400005f9:	83 c4 20             	add    $0x20,%esp
400005fc:	e9 30 fe ff ff       	jmp    40000431 <vprintfmt+0x21>

40000601 <.L26>:
            putch('0', putdat);
40000601:	8b 74 24 40          	mov    0x40(%esp),%esi
40000605:	83 ec 08             	sub    $0x8,%esp
40000608:	57                   	push   %edi
40000609:	6a 30                	push   $0x30
4000060b:	ff d6                	call   *%esi
            putch('x', putdat);
4000060d:	59                   	pop    %ecx
4000060e:	5b                   	pop    %ebx
4000060f:	57                   	push   %edi
40000610:	6a 78                	push   $0x78
            num = (unsigned long long)
40000612:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000614:	ff d6                	call   *%esi
            num = (unsigned long long)
40000616:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000061a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000061f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000621:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000624:	83 c0 04             	add    $0x4,%eax
40000627:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000062b:	eb b3                	jmp    400005e0 <.L24+0x2e>

4000062d <.L22>:
    if (lflag >= 2)
4000062d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000632:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000636:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000063a:	0f 8f 6e 01 00 00    	jg     400007ae <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000640:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000644:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000647:	31 db                	xor    %ebx,%ebx
40000649:	ba 10 00 00 00       	mov    $0x10,%edx
4000064e:	8b 09                	mov    (%ecx),%ecx
40000650:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000654:	eb 8a                	jmp    400005e0 <.L24+0x2e>

40000656 <.L29>:
    if (lflag >= 2)
40000656:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
4000065b:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
4000065f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
40000663:	0f 8f 5b 01 00 00    	jg     400007c4 <.L25+0x107>
        return va_arg(*ap, long);
40000669:	8b 00                	mov    (%eax),%eax
4000066b:	89 c3                	mov    %eax,%ebx
4000066d:	89 c1                	mov    %eax,%ecx
4000066f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000673:	c1 fb 1f             	sar    $0x1f,%ebx
40000676:	83 c0 04             	add    $0x4,%eax
40000679:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
4000067d:	85 db                	test   %ebx,%ebx
4000067f:	0f 88 68 01 00 00    	js     400007ed <.L19+0xc>
        return va_arg(*ap, unsigned long long);
40000685:	ba 0a 00 00 00       	mov    $0xa,%edx
4000068a:	e9 51 ff ff ff       	jmp    400005e0 <.L24+0x2e>

4000068f <.L28>:
            lflag++;
4000068f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000694:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000696:	e9 f6 fd ff ff       	jmp    40000491 <vprintfmt+0x81>

4000069b <.L27>:
            putch('X', putdat);
4000069b:	8b 74 24 40          	mov    0x40(%esp),%esi
4000069f:	83 ec 08             	sub    $0x8,%esp
400006a2:	57                   	push   %edi
400006a3:	6a 58                	push   $0x58
400006a5:	ff d6                	call   *%esi
            putch('X', putdat);
400006a7:	58                   	pop    %eax
400006a8:	5a                   	pop    %edx
400006a9:	57                   	push   %edi
400006aa:	6a 58                	push   $0x58
400006ac:	ff d6                	call   *%esi
            putch('X', putdat);
400006ae:	59                   	pop    %ecx
400006af:	5b                   	pop    %ebx
400006b0:	57                   	push   %edi
400006b1:	6a 58                	push   $0x58
400006b3:	ff d6                	call   *%esi
            break;
400006b5:	83 c4 10             	add    $0x10,%esp
400006b8:	e9 74 fd ff ff       	jmp    40000431 <vprintfmt+0x21>

400006bd <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
400006bd:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
400006c1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
400006c5:	8b 54 24 14          	mov    0x14(%esp),%edx
400006c9:	8b 74 24 40          	mov    0x40(%esp),%esi
400006cd:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
400006d0:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
400006d5:	89 44 24 14          	mov    %eax,0x14(%esp)
400006d9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006dd:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
400006df:	0f 95 c0             	setne  %al
400006e2:	85 c9                	test   %ecx,%ecx
400006e4:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
400006e7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
400006eb:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
400006ed:	85 db                	test   %ebx,%ebx
400006ef:	0f 84 21 01 00 00    	je     40000816 <.L19+0x35>
            if (width > 0 && padc != '-')
400006f5:	84 c0                	test   %al,%al
400006f7:	0f 85 48 01 00 00    	jne    40000845 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
400006fd:	89 d8                	mov    %ebx,%eax
400006ff:	8d 5b 01             	lea    0x1(%ebx),%ebx
40000702:	0f be 08             	movsbl (%eax),%ecx
40000705:	89 c8                	mov    %ecx,%eax
40000707:	85 c9                	test   %ecx,%ecx
40000709:	74 64                	je     4000076f <.L25+0xb2>
4000070b:	89 74 24 40          	mov    %esi,0x40(%esp)
4000070f:	89 d6                	mov    %edx,%esi
40000711:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000715:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000719:	eb 2a                	jmp    40000745 <.L25+0x88>
4000071b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000720:	83 e8 20             	sub    $0x20,%eax
40000723:	83 f8 5e             	cmp    $0x5e,%eax
40000726:	76 2d                	jbe    40000755 <.L25+0x98>
                    putch('?', putdat);
40000728:	83 ec 08             	sub    $0x8,%esp
4000072b:	57                   	push   %edi
4000072c:	6a 3f                	push   $0x3f
4000072e:	ff 54 24 50          	call   *0x50(%esp)
40000732:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000735:	0f be 03             	movsbl (%ebx),%eax
40000738:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000073b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000073e:	0f be c8             	movsbl %al,%ecx
40000741:	85 c9                	test   %ecx,%ecx
40000743:	74 1e                	je     40000763 <.L25+0xa6>
40000745:	85 f6                	test   %esi,%esi
40000747:	78 05                	js     4000074e <.L25+0x91>
                                         || --precision >= 0); width--)
40000749:	83 ee 01             	sub    $0x1,%esi
4000074c:	72 15                	jb     40000763 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000074e:	8b 14 24             	mov    (%esp),%edx
40000751:	85 d2                	test   %edx,%edx
40000753:	75 cb                	jne    40000720 <.L25+0x63>
                    putch(ch, putdat);
40000755:	83 ec 08             	sub    $0x8,%esp
40000758:	57                   	push   %edi
40000759:	51                   	push   %ecx
4000075a:	ff 54 24 50          	call   *0x50(%esp)
4000075e:	83 c4 10             	add    $0x10,%esp
40000761:	eb d2                	jmp    40000735 <.L25+0x78>
40000763:	89 6c 24 08          	mov    %ebp,0x8(%esp)
40000767:	8b 74 24 40          	mov    0x40(%esp),%esi
4000076b:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
4000076f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000773:	85 c0                	test   %eax,%eax
40000775:	7e 19                	jle    40000790 <.L25+0xd3>
40000777:	89 c3                	mov    %eax,%ebx
40000779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
40000780:	83 ec 08             	sub    $0x8,%esp
40000783:	57                   	push   %edi
40000784:	6a 20                	push   $0x20
40000786:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000788:	83 c4 10             	add    $0x10,%esp
4000078b:	83 eb 01             	sub    $0x1,%ebx
4000078e:	75 f0                	jne    40000780 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
40000790:	8b 44 24 14          	mov    0x14(%esp),%eax
40000794:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000798:	e9 94 fc ff ff       	jmp    40000431 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
4000079d:	8b 08                	mov    (%eax),%ecx
4000079f:	8b 58 04             	mov    0x4(%eax),%ebx
400007a2:	83 c0 08             	add    $0x8,%eax
400007a5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007a9:	e9 d7 fe ff ff       	jmp    40000685 <.L29+0x2f>
400007ae:	8b 08                	mov    (%eax),%ecx
400007b0:	8b 58 04             	mov    0x4(%eax),%ebx
400007b3:	83 c0 08             	add    $0x8,%eax
400007b6:	ba 10 00 00 00       	mov    $0x10,%edx
400007bb:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007bf:	e9 1c fe ff ff       	jmp    400005e0 <.L24+0x2e>
        return va_arg(*ap, long long);
400007c4:	8b 08                	mov    (%eax),%ecx
400007c6:	8b 58 04             	mov    0x4(%eax),%ebx
400007c9:	83 c0 08             	add    $0x8,%eax
400007cc:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007d0:	e9 a8 fe ff ff       	jmp    4000067d <.L29+0x27>

400007d5 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
400007d5:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400007da:	89 eb                	mov    %ebp,%ebx
400007dc:	e9 b0 fc ff ff       	jmp    40000491 <vprintfmt+0x81>

400007e1 <.L19>:
            padc = '-';
400007e1:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400007e6:	89 eb                	mov    %ebp,%ebx
400007e8:	e9 a4 fc ff ff       	jmp    40000491 <vprintfmt+0x81>
400007ed:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
400007f1:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
400007f4:	31 db                	xor    %ebx,%ebx
400007f6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
400007fa:	57                   	push   %edi
400007fb:	6a 2d                	push   $0x2d
400007fd:	ff d6                	call   *%esi
                num = -(long long) num;
400007ff:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000803:	ba 0a 00 00 00       	mov    $0xa,%edx
40000808:	f7 d9                	neg    %ecx
4000080a:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
4000080e:	83 c4 10             	add    $0x10,%esp
40000811:	e9 ca fd ff ff       	jmp    400005e0 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000816:	84 c0                	test   %al,%al
40000818:	0f 85 99 00 00 00    	jne    400008b7 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000081e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000822:	89 74 24 40          	mov    %esi,0x40(%esp)
40000826:	b9 28 00 00 00       	mov    $0x28,%ecx
4000082b:	89 d6                	mov    %edx,%esi
4000082d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000831:	b8 28 00 00 00       	mov    $0x28,%eax
40000836:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000083a:	8d 9b 42 d0 ff ff    	lea    -0x2fbe(%ebx),%ebx
40000840:	e9 00 ff ff ff       	jmp    40000745 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000845:	83 ec 08             	sub    $0x8,%esp
40000848:	52                   	push   %edx
40000849:	89 54 24 28          	mov    %edx,0x28(%esp)
4000084d:	ff 74 24 24          	push   0x24(%esp)
40000851:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000855:	e8 26 03 00 00       	call   40000b80 <strnlen>
4000085a:	29 44 24 18          	sub    %eax,0x18(%esp)
4000085e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000862:	83 c4 10             	add    $0x10,%esp
40000865:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000869:	85 c9                	test   %ecx,%ecx
4000086b:	0f 8e 99 00 00 00    	jle    4000090a <.L19+0x129>
                    putch(padc, putdat);
40000871:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000876:	89 54 24 10          	mov    %edx,0x10(%esp)
4000087a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000087e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000882:	83 ec 08             	sub    $0x8,%esp
40000885:	57                   	push   %edi
40000886:	53                   	push   %ebx
40000887:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
40000889:	83 c4 10             	add    $0x10,%esp
4000088c:	83 ed 01             	sub    $0x1,%ebp
4000088f:	75 f1                	jne    40000882 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
40000891:	8b 44 24 18          	mov    0x18(%esp),%eax
40000895:	8b 54 24 10          	mov    0x10(%esp),%edx
40000899:	89 6c 24 08          	mov    %ebp,0x8(%esp)
4000089d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400008a1:	8d 58 01             	lea    0x1(%eax),%ebx
400008a4:	0f be 00             	movsbl (%eax),%eax
400008a7:	0f be c8             	movsbl %al,%ecx
400008aa:	85 c9                	test   %ecx,%ecx
400008ac:	0f 85 59 fe ff ff    	jne    4000070b <.L25+0x4e>
400008b2:	e9 d9 fe ff ff       	jmp    40000790 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
400008b7:	83 ec 08             	sub    $0x8,%esp
400008ba:	52                   	push   %edx
400008bb:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400008bf:	8d 8b 41 d0 ff ff    	lea    -0x2fbf(%ebx),%ecx
400008c5:	89 54 24 28          	mov    %edx,0x28(%esp)
400008c9:	51                   	push   %ecx
400008ca:	89 4c 24 28          	mov    %ecx,0x28(%esp)
400008ce:	e8 ad 02 00 00       	call   40000b80 <strnlen>
400008d3:	29 44 24 18          	sub    %eax,0x18(%esp)
400008d7:	8b 44 24 18          	mov    0x18(%esp),%eax
400008db:	83 c4 10             	add    $0x10,%esp
400008de:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400008e2:	85 c0                	test   %eax,%eax
400008e4:	7f 8b                	jg     40000871 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
400008e6:	b9 28 00 00 00       	mov    $0x28,%ecx
400008eb:	b8 28 00 00 00       	mov    $0x28,%eax
400008f0:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400008f4:	89 74 24 40          	mov    %esi,0x40(%esp)
400008f8:	89 d6                	mov    %edx,%esi
400008fa:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400008fe:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000902:	83 c3 01             	add    $0x1,%ebx
40000905:	e9 3b fe ff ff       	jmp    40000745 <.L25+0x88>
4000090a:	8b 44 24 18          	mov    0x18(%esp),%eax
4000090e:	0f be 08             	movsbl (%eax),%ecx
40000911:	89 c8                	mov    %ecx,%eax
40000913:	85 c9                	test   %ecx,%ecx
40000915:	75 d9                	jne    400008f0 <.L19+0x10f>
40000917:	e9 74 fe ff ff       	jmp    40000790 <.L25+0xd3>
4000091c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000920 <printfmt>:
{
40000920:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000923:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000927:	50                   	push   %eax
40000928:	ff 74 24 1c          	push   0x1c(%esp)
4000092c:	ff 74 24 1c          	push   0x1c(%esp)
40000930:	ff 74 24 1c          	push   0x1c(%esp)
40000934:	e8 d7 fa ff ff       	call   40000410 <vprintfmt>
}
40000939:	83 c4 1c             	add    $0x1c,%esp
4000093c:	c3                   	ret
4000093d:	8d 76 00             	lea    0x0(%esi),%esi

40000940 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000940:	e8 4e 01 00 00       	call   40000a93 <__x86.get_pc_thunk.ax>
40000945:	05 af 46 00 00       	add    $0x46af,%eax
{
4000094a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
4000094d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000951:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000958:	ff 
40000959:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000960:	00 
40000961:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000965:	ff 74 24 28          	push   0x28(%esp)
40000969:	ff 74 24 28          	push   0x28(%esp)
4000096d:	8d 80 fc b3 ff ff    	lea    -0x4c04(%eax),%eax
40000973:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000977:	52                   	push   %edx
40000978:	50                   	push   %eax
40000979:	e8 92 fa ff ff       	call   40000410 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
4000097e:	8b 44 24 14          	mov    0x14(%esp),%eax
40000982:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000985:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000989:	83 c4 2c             	add    $0x2c,%esp
4000098c:	c3                   	ret
4000098d:	8d 76 00             	lea    0x0(%esi),%esi

40000990 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000990:	e8 fe 00 00 00       	call   40000a93 <__x86.get_pc_thunk.ax>
40000995:	05 5f 46 00 00       	add    $0x465f,%eax
{
4000099a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
4000099d:	8b 54 24 20          	mov    0x20(%esp),%edx
400009a1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400009a8:	ff 
400009a9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009b0:	00 
400009b1:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
400009b5:	8d 54 24 28          	lea    0x28(%esp),%edx
400009b9:	52                   	push   %edx
400009ba:	ff 74 24 28          	push   0x28(%esp)
400009be:	8d 80 fc b3 ff ff    	lea    -0x4c04(%eax),%eax
400009c4:	8d 54 24 0c          	lea    0xc(%esp),%edx
400009c8:	52                   	push   %edx
400009c9:	50                   	push   %eax
400009ca:	e8 41 fa ff ff       	call   40000410 <vprintfmt>
    *b.buf = '\0';
400009cf:	8b 44 24 14          	mov    0x14(%esp),%eax
400009d3:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
400009d6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400009da:	83 c4 2c             	add    $0x2c,%esp
400009dd:	c3                   	ret
400009de:	66 90                	xchg   %ax,%ax

400009e0 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
400009e0:	e8 b2 00 00 00       	call   40000a97 <__x86.get_pc_thunk.dx>
400009e5:	81 c2 0f 46 00 00    	add    $0x460f,%edx
{
400009eb:	83 ec 1c             	sub    $0x1c,%esp
400009ee:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
400009f2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
400009f6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009fd:	00 
400009fe:	89 44 24 04          	mov    %eax,0x4(%esp)
40000a02:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000a06:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a0a:	ff 74 24 2c          	push   0x2c(%esp)
40000a0e:	ff 74 24 2c          	push   0x2c(%esp)
40000a12:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a16:	50                   	push   %eax
40000a17:	8d 82 fc b3 ff ff    	lea    -0x4c04(%edx),%eax
40000a1d:	50                   	push   %eax
40000a1e:	e8 ed f9 ff ff       	call   40000410 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a23:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a27:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a2a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a2e:	83 c4 2c             	add    $0x2c,%esp
40000a31:	c3                   	ret
40000a32:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000a39:	00 
40000a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000a40 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a40:	e8 52 00 00 00       	call   40000a97 <__x86.get_pc_thunk.dx>
40000a45:	81 c2 af 45 00 00    	add    $0x45af,%edx
{
40000a4b:	83 ec 1c             	sub    $0x1c,%esp
40000a4e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a52:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000a56:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a5d:	00 
40000a5e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000a62:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000a66:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a6a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000a6e:	50                   	push   %eax
40000a6f:	ff 74 24 2c          	push   0x2c(%esp)
40000a73:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a77:	50                   	push   %eax
40000a78:	8d 82 fc b3 ff ff    	lea    -0x4c04(%edx),%eax
40000a7e:	50                   	push   %eax
40000a7f:	e8 8c f9 ff ff       	call   40000410 <vprintfmt>
    *b.buf = '\0';
40000a84:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a88:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000a8b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a8f:	83 c4 2c             	add    $0x2c,%esp
40000a92:	c3                   	ret

40000a93 <__x86.get_pc_thunk.ax>:
40000a93:	8b 04 24             	mov    (%esp),%eax
40000a96:	c3                   	ret

40000a97 <__x86.get_pc_thunk.dx>:
40000a97:	8b 14 24             	mov    (%esp),%edx
40000a9a:	c3                   	ret

40000a9b <__x86.get_pc_thunk.cx>:
40000a9b:	8b 0c 24             	mov    (%esp),%ecx
40000a9e:	c3                   	ret
40000a9f:	90                   	nop

40000aa0 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000aa0:	53                   	push   %ebx
static gcc_inline pid_t sys_spawn(unsigned int elf_id, unsigned int quota)
{
    int errno;
    pid_t pid;

    asm volatile ("int %2"
40000aa1:	b8 02 00 00 00       	mov    $0x2,%eax
40000aa6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000aaa:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000aae:	cd 30                	int    $0x30
                    "a" (SYS_spawn),
                    "b" (elf_id),
                    "c" (quota)
                  : "cc", "memory");

    return errno ? -1 : pid;
40000ab0:	85 c0                	test   %eax,%eax
40000ab2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000ab7:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000aba:	5b                   	pop    %ebx
40000abb:	c3                   	ret
40000abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000ac0 <yield>:
}

static gcc_inline void sys_yield(void)
{
    asm volatile ("int %0"
40000ac0:	b8 03 00 00 00       	mov    $0x3,%eax
40000ac5:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000ac7:	c3                   	ret
40000ac8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000acf:	00 

40000ad0 <produce>:

void produce(int item)
{
40000ad0:	53                   	push   %ebx
}

static gcc_inline void sys_produce(unsigned int item)
{
	int errno; 
    asm volatile ("int %1"
40000ad1:	b8 0e 00 00 00       	mov    $0xe,%eax
40000ad6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000ada:	cd 30                	int    $0x30
    sys_produce(item);
}
40000adc:	5b                   	pop    %ebx
40000add:	c3                   	ret
40000ade:	66 90                	xchg   %ax,%ax

40000ae0 <consume>:

int consume(void)
{
40000ae0:	53                   	push   %ebx

static gcc_inline int sys_consume(void)
{
	int errno, item;

    asm volatile ("int %2"
40000ae1:	b8 0f 00 00 00       	mov    $0xf,%eax
40000ae6:	cd 30                	int    $0x30
    return sys_consume();
40000ae8:	89 d8                	mov    %ebx,%eax
40000aea:	5b                   	pop    %ebx
40000aeb:	c3                   	ret
40000aec:	66 90                	xchg   %ax,%ax
40000aee:	66 90                	xchg   %ax,%ax

40000af0 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000af0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000af4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000afa:	c3                   	ret
40000afb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000b00 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000b00:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000b04:	b8 01 00 00 00       	mov    $0x1,%eax
40000b09:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b0c:	85 c0                	test   %eax,%eax
40000b0e:	74 13                	je     40000b23 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000b10:	b9 01 00 00 00       	mov    $0x1,%ecx
40000b15:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000b18:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000b1a:	89 c8                	mov    %ecx,%eax
40000b1c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b1f:	85 c0                	test   %eax,%eax
40000b21:	75 f5                	jne    40000b18 <spinlock_acquire+0x18>
}
40000b23:	c3                   	ret
40000b24:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b2b:	00 
40000b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b30 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000b30:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000b34:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000b36:	84 c0                	test   %al,%al
40000b38:	74 05                	je     40000b3f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000b3a:	31 c0                	xor    %eax,%eax
40000b3c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000b3f:	c3                   	ret

40000b40 <spinlock_holding>:
    return *lk;
40000b40:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b44:	8b 00                	mov    (%eax),%eax
}
40000b46:	c3                   	ret
40000b47:	66 90                	xchg   %ax,%ax
40000b49:	66 90                	xchg   %ax,%ax
40000b4b:	66 90                	xchg   %ax,%ax
40000b4d:	66 90                	xchg   %ax,%ax
40000b4f:	90                   	nop

40000b50 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000b50:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000b54:	31 c0                	xor    %eax,%eax
40000b56:	80 3a 00             	cmpb   $0x0,(%edx)
40000b59:	74 15                	je     40000b70 <strlen+0x20>
40000b5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000b60:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000b63:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000b67:	75 f7                	jne    40000b60 <strlen+0x10>
40000b69:	c3                   	ret
40000b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000b70:	c3                   	ret
40000b71:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b78:	00 
40000b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000b80 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000b80:	8b 54 24 08          	mov    0x8(%esp),%edx
40000b84:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000b88:	31 c0                	xor    %eax,%eax
40000b8a:	85 d2                	test   %edx,%edx
40000b8c:	75 09                	jne    40000b97 <strnlen+0x17>
40000b8e:	c3                   	ret
40000b8f:	90                   	nop
        n++;
40000b90:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000b93:	39 c2                	cmp    %eax,%edx
40000b95:	74 09                	je     40000ba0 <strnlen+0x20>
40000b97:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000b9b:	75 f3                	jne    40000b90 <strnlen+0x10>
40000b9d:	c3                   	ret
40000b9e:	66 90                	xchg   %ax,%ax
    return n;
}
40000ba0:	c3                   	ret
40000ba1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ba8:	00 
40000ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000bb0 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000bb0:	53                   	push   %ebx
40000bb1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000bb5:	31 c0                	xor    %eax,%eax
{
40000bb7:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000bbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000bc0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000bc4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000bc7:	83 c0 01             	add    $0x1,%eax
40000bca:	84 d2                	test   %dl,%dl
40000bcc:	75 f2                	jne    40000bc0 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000bce:	89 c8                	mov    %ecx,%eax
40000bd0:	5b                   	pop    %ebx
40000bd1:	c3                   	ret
40000bd2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bd9:	00 
40000bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000be0 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000be0:	56                   	push   %esi
40000be1:	53                   	push   %ebx
40000be2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000be6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000bea:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000bee:	85 db                	test   %ebx,%ebx
40000bf0:	74 21                	je     40000c13 <strncpy+0x33>
40000bf2:	01 f3                	add    %esi,%ebx
40000bf4:	89 f0                	mov    %esi,%eax
40000bf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bfd:	00 
40000bfe:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000c00:	0f b6 0a             	movzbl (%edx),%ecx
40000c03:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000c06:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000c09:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000c0c:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000c0f:	39 c3                	cmp    %eax,%ebx
40000c11:	75 ed                	jne    40000c00 <strncpy+0x20>
    }
    return ret;
}
40000c13:	89 f0                	mov    %esi,%eax
40000c15:	5b                   	pop    %ebx
40000c16:	5e                   	pop    %esi
40000c17:	c3                   	ret
40000c18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c1f:	00 

40000c20 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000c20:	56                   	push   %esi
40000c21:	53                   	push   %ebx
40000c22:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c26:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c2a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000c2e:	85 c0                	test   %eax,%eax
40000c30:	74 29                	je     40000c5b <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000c32:	89 f2                	mov    %esi,%edx
40000c34:	83 e8 01             	sub    $0x1,%eax
40000c37:	74 1f                	je     40000c58 <strlcpy+0x38>
40000c39:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000c3c:	eb 0f                	jmp    40000c4d <strlcpy+0x2d>
40000c3e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000c40:	83 c2 01             	add    $0x1,%edx
40000c43:	83 c1 01             	add    $0x1,%ecx
40000c46:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000c49:	39 da                	cmp    %ebx,%edx
40000c4b:	74 07                	je     40000c54 <strlcpy+0x34>
40000c4d:	0f b6 01             	movzbl (%ecx),%eax
40000c50:	84 c0                	test   %al,%al
40000c52:	75 ec                	jne    40000c40 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000c54:	89 d0                	mov    %edx,%eax
40000c56:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000c58:	c6 02 00             	movb   $0x0,(%edx)
}
40000c5b:	5b                   	pop    %ebx
40000c5c:	5e                   	pop    %esi
40000c5d:	c3                   	ret
40000c5e:	66 90                	xchg   %ax,%ax

40000c60 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000c60:	53                   	push   %ebx
40000c61:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c65:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000c69:	0f b6 02             	movzbl (%edx),%eax
40000c6c:	84 c0                	test   %al,%al
40000c6e:	75 18                	jne    40000c88 <strcmp+0x28>
40000c70:	eb 30                	jmp    40000ca2 <strcmp+0x42>
40000c72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000c78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000c7c:	83 c2 01             	add    $0x1,%edx
40000c7f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000c82:	84 c0                	test   %al,%al
40000c84:	74 12                	je     40000c98 <strcmp+0x38>
40000c86:	89 d9                	mov    %ebx,%ecx
40000c88:	0f b6 19             	movzbl (%ecx),%ebx
40000c8b:	38 c3                	cmp    %al,%bl
40000c8d:	74 e9                	je     40000c78 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000c8f:	29 d8                	sub    %ebx,%eax
}
40000c91:	5b                   	pop    %ebx
40000c92:	c3                   	ret
40000c93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000c98:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000c9c:	31 c0                	xor    %eax,%eax
40000c9e:	29 d8                	sub    %ebx,%eax
}
40000ca0:	5b                   	pop    %ebx
40000ca1:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000ca2:	0f b6 19             	movzbl (%ecx),%ebx
40000ca5:	31 c0                	xor    %eax,%eax
40000ca7:	eb e6                	jmp    40000c8f <strcmp+0x2f>
40000ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000cb0 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000cb0:	53                   	push   %ebx
40000cb1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000cb5:	8b 44 24 08          	mov    0x8(%esp),%eax
40000cb9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000cbd:	85 d2                	test   %edx,%edx
40000cbf:	75 16                	jne    40000cd7 <strncmp+0x27>
40000cc1:	eb 2d                	jmp    40000cf0 <strncmp+0x40>
40000cc3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cc8:	3a 19                	cmp    (%ecx),%bl
40000cca:	75 12                	jne    40000cde <strncmp+0x2e>
        n--, p++, q++;
40000ccc:	83 c0 01             	add    $0x1,%eax
40000ccf:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000cd2:	83 ea 01             	sub    $0x1,%edx
40000cd5:	74 19                	je     40000cf0 <strncmp+0x40>
40000cd7:	0f b6 18             	movzbl (%eax),%ebx
40000cda:	84 db                	test   %bl,%bl
40000cdc:	75 ea                	jne    40000cc8 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000cde:	0f b6 00             	movzbl (%eax),%eax
40000ce1:	0f b6 11             	movzbl (%ecx),%edx
}
40000ce4:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000ce5:	29 d0                	sub    %edx,%eax
}
40000ce7:	c3                   	ret
40000ce8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cef:	00 
        return 0;
40000cf0:	31 c0                	xor    %eax,%eax
}
40000cf2:	5b                   	pop    %ebx
40000cf3:	c3                   	ret
40000cf4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cfb:	00 
40000cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000d00 <strchr>:

char *strchr(const char *s, char c)
{
40000d00:	8b 44 24 04          	mov    0x4(%esp),%eax
40000d04:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000d09:	0f b6 10             	movzbl (%eax),%edx
40000d0c:	84 d2                	test   %dl,%dl
40000d0e:	75 13                	jne    40000d23 <strchr+0x23>
40000d10:	eb 1e                	jmp    40000d30 <strchr+0x30>
40000d12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d18:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d1c:	83 c0 01             	add    $0x1,%eax
40000d1f:	84 d2                	test   %dl,%dl
40000d21:	74 0d                	je     40000d30 <strchr+0x30>
        if (*s == c)
40000d23:	38 d1                	cmp    %dl,%cl
40000d25:	75 f1                	jne    40000d18 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000d27:	c3                   	ret
40000d28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d2f:	00 
    return 0;
40000d30:	31 c0                	xor    %eax,%eax
}
40000d32:	c3                   	ret
40000d33:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d3a:	00 
40000d3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000d40 <strfind>:

char *strfind(const char *s, char c)
{
40000d40:	53                   	push   %ebx
40000d41:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d45:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000d49:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000d4c:	38 d3                	cmp    %dl,%bl
40000d4e:	74 1f                	je     40000d6f <strfind+0x2f>
40000d50:	89 d1                	mov    %edx,%ecx
40000d52:	84 db                	test   %bl,%bl
40000d54:	75 0e                	jne    40000d64 <strfind+0x24>
40000d56:	eb 17                	jmp    40000d6f <strfind+0x2f>
40000d58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d5f:	00 
40000d60:	84 d2                	test   %dl,%dl
40000d62:	74 0b                	je     40000d6f <strfind+0x2f>
    for (; *s; s++)
40000d64:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d68:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000d6b:	38 ca                	cmp    %cl,%dl
40000d6d:	75 f1                	jne    40000d60 <strfind+0x20>
            break;
    return (char *) s;
}
40000d6f:	5b                   	pop    %ebx
40000d70:	c3                   	ret
40000d71:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d78:	00 
40000d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000d80 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000d80:	55                   	push   %ebp
40000d81:	57                   	push   %edi
40000d82:	56                   	push   %esi
40000d83:	53                   	push   %ebx
40000d84:	8b 54 24 14          	mov    0x14(%esp),%edx
40000d88:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000d8c:	0f b6 02             	movzbl (%edx),%eax
40000d8f:	3c 20                	cmp    $0x20,%al
40000d91:	75 10                	jne    40000da3 <strtol+0x23>
40000d93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000d9c:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000d9f:	3c 20                	cmp    $0x20,%al
40000da1:	74 f5                	je     40000d98 <strtol+0x18>
40000da3:	3c 09                	cmp    $0x9,%al
40000da5:	74 f1                	je     40000d98 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000da7:	3c 2b                	cmp    $0x2b,%al
40000da9:	0f 84 b1 00 00 00    	je     40000e60 <strtol+0xe0>
    int neg = 0;
40000daf:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000db1:	3c 2d                	cmp    $0x2d,%al
40000db3:	0f 84 97 00 00 00    	je     40000e50 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000db9:	0f b6 02             	movzbl (%edx),%eax
40000dbc:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000dc3:	ff 
40000dc4:	75 1d                	jne    40000de3 <strtol+0x63>
40000dc6:	3c 30                	cmp    $0x30,%al
40000dc8:	0f 84 a2 00 00 00    	je     40000e70 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000dce:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000dd3:	19 c0                	sbb    %eax,%eax
40000dd5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000dd9:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000dde:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000de3:	31 c9                	xor    %ecx,%ecx
40000de5:	eb 1c                	jmp    40000e03 <strtol+0x83>
40000de7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dee:	00 
40000def:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000df0:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000df3:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000df7:	7d 2a                	jge    40000e23 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000df9:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000dfe:	83 c2 01             	add    $0x1,%edx
40000e01:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000e03:	0f be 02             	movsbl (%edx),%eax
40000e06:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000e09:	89 eb                	mov    %ebp,%ebx
40000e0b:	80 fb 09             	cmp    $0x9,%bl
40000e0e:	76 e0                	jbe    40000df0 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000e10:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000e13:	89 eb                	mov    %ebp,%ebx
40000e15:	80 fb 19             	cmp    $0x19,%bl
40000e18:	77 26                	ja     40000e40 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000e1a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000e1d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e21:	7c d6                	jl     40000df9 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000e23:	85 f6                	test   %esi,%esi
40000e25:	74 02                	je     40000e29 <strtol+0xa9>
        *endptr = (char *) s;
40000e27:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000e29:	89 c8                	mov    %ecx,%eax
}
40000e2b:	5b                   	pop    %ebx
40000e2c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000e2d:	f7 d8                	neg    %eax
40000e2f:	85 ff                	test   %edi,%edi
}
40000e31:	5f                   	pop    %edi
40000e32:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000e33:	0f 45 c8             	cmovne %eax,%ecx
}
40000e36:	89 c8                	mov    %ecx,%eax
40000e38:	c3                   	ret
40000e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000e40:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000e43:	89 eb                	mov    %ebp,%ebx
40000e45:	80 fb 19             	cmp    $0x19,%bl
40000e48:	77 d9                	ja     40000e23 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000e4a:	83 e8 37             	sub    $0x37,%eax
40000e4d:	eb a4                	jmp    40000df3 <strtol+0x73>
40000e4f:	90                   	nop
        s++, neg = 1;
40000e50:	83 c2 01             	add    $0x1,%edx
40000e53:	bf 01 00 00 00       	mov    $0x1,%edi
40000e58:	e9 5c ff ff ff       	jmp    40000db9 <strtol+0x39>
40000e5d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000e60:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000e63:	31 ff                	xor    %edi,%edi
40000e65:	e9 4f ff ff ff       	jmp    40000db9 <strtol+0x39>
40000e6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000e70:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000e74:	74 25                	je     40000e9b <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000e76:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000e7a:	85 c0                	test   %eax,%eax
40000e7c:	74 0d                	je     40000e8b <strtol+0x10b>
40000e7e:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000e85:	00 
40000e86:	e9 58 ff ff ff       	jmp    40000de3 <strtol+0x63>
        s++, base = 8;
40000e8b:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000e92:	00 
40000e93:	83 c2 01             	add    $0x1,%edx
40000e96:	e9 48 ff ff ff       	jmp    40000de3 <strtol+0x63>
        s += 2, base = 16;
40000e9b:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000ea2:	00 
40000ea3:	83 c2 02             	add    $0x2,%edx
40000ea6:	e9 38 ff ff ff       	jmp    40000de3 <strtol+0x63>
40000eab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000eb0 <memset>:

void *memset(void *v, int c, size_t n)
{
40000eb0:	57                   	push   %edi
40000eb1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000eb5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000eb9:	85 c9                	test   %ecx,%ecx
40000ebb:	74 19                	je     40000ed6 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000ebd:	89 f8                	mov    %edi,%eax
40000ebf:	09 c8                	or     %ecx,%eax
40000ec1:	a8 03                	test   $0x3,%al
40000ec3:	75 1b                	jne    40000ee0 <memset+0x30>
        c &= 0xFF;
40000ec5:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000eca:	c1 e9 02             	shr    $0x2,%ecx
40000ecd:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000ed3:	fc                   	cld
40000ed4:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000ed6:	89 f8                	mov    %edi,%eax
40000ed8:	5f                   	pop    %edi
40000ed9:	c3                   	ret
40000eda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000ee0:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ee4:	fc                   	cld
40000ee5:	f3 aa                	rep stos %al,%es:(%edi)
}
40000ee7:	89 f8                	mov    %edi,%eax
40000ee9:	5f                   	pop    %edi
40000eea:	c3                   	ret
40000eeb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000ef0 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000ef0:	57                   	push   %edi
40000ef1:	56                   	push   %esi
40000ef2:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ef6:	8b 74 24 10          	mov    0x10(%esp),%esi
40000efa:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000efe:	39 c6                	cmp    %eax,%esi
40000f00:	73 26                	jae    40000f28 <memmove+0x38>
40000f02:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000f05:	39 d0                	cmp    %edx,%eax
40000f07:	73 1f                	jae    40000f28 <memmove+0x38>
        s += n;
        d += n;
40000f09:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f0c:	89 fe                	mov    %edi,%esi
40000f0e:	09 ce                	or     %ecx,%esi
40000f10:	09 d6                	or     %edx,%esi
40000f12:	83 e6 03             	and    $0x3,%esi
40000f15:	74 39                	je     40000f50 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000f17:	83 ef 01             	sub    $0x1,%edi
40000f1a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000f1d:	fd                   	std
40000f1e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000f20:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000f21:	5e                   	pop    %esi
40000f22:	5f                   	pop    %edi
40000f23:	c3                   	ret
40000f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f28:	89 c2                	mov    %eax,%edx
40000f2a:	09 ca                	or     %ecx,%edx
40000f2c:	09 f2                	or     %esi,%edx
40000f2e:	83 e2 03             	and    $0x3,%edx
40000f31:	74 0d                	je     40000f40 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40000f33:	89 c7                	mov    %eax,%edi
40000f35:	fc                   	cld
40000f36:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40000f38:	5e                   	pop    %esi
40000f39:	5f                   	pop    %edi
40000f3a:	c3                   	ret
40000f3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40000f40:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40000f43:	89 c7                	mov    %eax,%edi
40000f45:	fc                   	cld
40000f46:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000f48:	eb ee                	jmp    40000f38 <memmove+0x48>
40000f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40000f50:	83 ef 04             	sub    $0x4,%edi
40000f53:	8d 72 fc             	lea    -0x4(%edx),%esi
40000f56:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40000f59:	fd                   	std
40000f5a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000f5c:	eb c2                	jmp    40000f20 <memmove+0x30>
40000f5e:	66 90                	xchg   %ax,%ax

40000f60 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40000f60:	eb 8e                	jmp    40000ef0 <memmove>
40000f62:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000f69:	00 
40000f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000f70 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40000f70:	56                   	push   %esi
40000f71:	53                   	push   %ebx
40000f72:	8b 74 24 14          	mov    0x14(%esp),%esi
40000f76:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f7a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
40000f7e:	85 f6                	test   %esi,%esi
40000f80:	74 2e                	je     40000fb0 <memcmp+0x40>
40000f82:	01 c6                	add    %eax,%esi
40000f84:	eb 14                	jmp    40000f9a <memcmp+0x2a>
40000f86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000f8d:	00 
40000f8e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40000f90:	83 c0 01             	add    $0x1,%eax
40000f93:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40000f96:	39 f0                	cmp    %esi,%eax
40000f98:	74 16                	je     40000fb0 <memcmp+0x40>
        if (*s1 != *s2)
40000f9a:	0f b6 08             	movzbl (%eax),%ecx
40000f9d:	0f b6 1a             	movzbl (%edx),%ebx
40000fa0:	38 d9                	cmp    %bl,%cl
40000fa2:	74 ec                	je     40000f90 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40000fa4:	0f b6 c1             	movzbl %cl,%eax
40000fa7:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40000fa9:	5b                   	pop    %ebx
40000faa:	5e                   	pop    %esi
40000fab:	c3                   	ret
40000fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
40000fb0:	31 c0                	xor    %eax,%eax
}
40000fb2:	5b                   	pop    %ebx
40000fb3:	5e                   	pop    %esi
40000fb4:	c3                   	ret
40000fb5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fbc:	00 
40000fbd:	8d 76 00             	lea    0x0(%esi),%esi

40000fc0 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40000fc0:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
40000fc4:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000fc8:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
40000fca:	39 d0                	cmp    %edx,%eax
40000fcc:	73 1a                	jae    40000fe8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
40000fce:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
40000fd3:	eb 0a                	jmp    40000fdf <memchr+0x1f>
40000fd5:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
40000fd8:	83 c0 01             	add    $0x1,%eax
40000fdb:	39 c2                	cmp    %eax,%edx
40000fdd:	74 09                	je     40000fe8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
40000fdf:	38 08                	cmp    %cl,(%eax)
40000fe1:	75 f5                	jne    40000fd8 <memchr+0x18>
            return (void *) s;
    return NULL;
}
40000fe3:	c3                   	ret
40000fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
40000fe8:	31 c0                	xor    %eax,%eax
}
40000fea:	c3                   	ret
40000feb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000ff0 <memzero>:

void *memzero(void *v, size_t n)
{
40000ff0:	57                   	push   %edi
40000ff1:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000ff5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000ff9:	85 c9                	test   %ecx,%ecx
40000ffb:	74 0f                	je     4000100c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000ffd:	89 f8                	mov    %edi,%eax
40000fff:	09 c8                	or     %ecx,%eax
40001001:	83 e0 03             	and    $0x3,%eax
40001004:	75 0a                	jne    40001010 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40001006:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40001009:	fc                   	cld
4000100a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
4000100c:	89 f8                	mov    %edi,%eax
4000100e:	5f                   	pop    %edi
4000100f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001010:	31 c0                	xor    %eax,%eax
40001012:	fc                   	cld
40001013:	f3 aa                	rep stos %al,%es:(%edi)
}
40001015:	89 f8                	mov    %edi,%eax
40001017:	5f                   	pop    %edi
40001018:	c3                   	ret
40001019:	66 90                	xchg   %ax,%ax
4000101b:	66 90                	xchg   %ax,%ax
4000101d:	66 90                	xchg   %ax,%ax
4000101f:	90                   	nop

40001020 <flocktest_test_write>:
{
40001020:	55                   	push   %ebp
40001021:	57                   	push   %edi
40001022:	56                   	push   %esi
40001023:	e8 fe 0b 00 00       	call   40001c26 <__x86.get_pc_thunk.si>
40001028:	81 c6 cc 3f 00 00    	add    $0x3fcc,%esi
4000102e:	53                   	push   %ebx
4000102f:	83 ec 28             	sub    $0x28,%esp
    printf("=====flocktest_test_write=====\n");
40001032:	8d 86 80 d2 ff ff    	lea    -0x2d80(%esi),%eax
40001038:	89 74 24 14          	mov    %esi,0x14(%esp)
4000103c:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000103e:	8d be 48 d0 ff ff    	lea    -0x2fb8(%esi),%edi
40001044:	50                   	push   %eax
40001045:	e8 a6 f2 ff ff       	call   400002f0 <printf>
4000104a:	89 3c 24             	mov    %edi,(%esp)
4000104d:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
40001051:	e8 fa fa ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
40001056:	b9 02 02 00 00       	mov    $0x202,%ecx
4000105b:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000105d:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001060:	b8 04 00 00 00       	mov    $0x4,%eax
40001065:	cd 30                	int    $0x30
    return errno ? -1 : fd;
40001067:	83 c4 10             	add    $0x10,%esp
    if (fd < 0) {
4000106a:	85 c0                	test   %eax,%eax
4000106c:	0f 85 be 00 00 00    	jne    40001130 <flocktest_test_write+0x110>
40001072:	89 dd                	mov    %ebx,%ebp
40001074:	85 db                	test   %ebx,%ebx
40001076:	0f 88 b4 00 00 00    	js     40001130 <flocktest_test_write+0x110>
    asm volatile ("int %2"
4000107c:	b8 0d 00 00 00       	mov    $0xd,%eax
40001081:	b9 02 00 00 00       	mov    $0x2,%ecx
40001086:	cd 30                	int    $0x30
40001088:	89 c7                	mov    %eax,%edi
    return errno ? -1 : 0;; // errno ? -1 : 0; 
4000108a:	85 c0                	test   %eax,%eax
4000108c:	0f 85 1a 01 00 00    	jne    400011ac <flocktest_test_write+0x18c>
40001092:	8b 44 24 08          	mov    0x8(%esp),%eax
    asm volatile ("int %2"
40001096:	be 07 00 00 00       	mov    $0x7,%esi
4000109b:	8d 90 6f d0 ff ff    	lea    -0x2f91(%eax),%edx
400010a1:	8d 80 7a d0 ff ff    	lea    -0x2f86(%eax),%eax
400010a7:	89 14 24             	mov    %edx,(%esp)
400010aa:	89 44 24 04          	mov    %eax,0x4(%esp)
400010ae:	eb 1f                	jmp    400010cf <flocktest_test_write+0xaf>
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
400010b0:	85 c0                	test   %eax,%eax
400010b2:	75 2e                	jne    400010e2 <flocktest_test_write+0xc2>
400010b4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
400010b8:	89 f0                	mov    %esi,%eax
400010ba:	89 eb                	mov    %ebp,%ebx
400010bc:	cd 30                	int    $0x30
        if (write(fd, "bbbbbbbbbb", 10) != 10) {
400010be:	83 fb 0a             	cmp    $0xa,%ebx
400010c1:	75 45                	jne    40001108 <flocktest_test_write+0xe8>
400010c3:	85 c0                	test   %eax,%eax
400010c5:	75 41                	jne    40001108 <flocktest_test_write+0xe8>
    for (int i = 0; i < 100; i++) {
400010c7:	83 c7 01             	add    $0x1,%edi
400010ca:	83 ff 64             	cmp    $0x64,%edi
400010cd:	74 7f                	je     4000114e <flocktest_test_write+0x12e>
400010cf:	8b 0c 24             	mov    (%esp),%ecx
400010d2:	ba 0a 00 00 00       	mov    $0xa,%edx
400010d7:	89 f0                	mov    %esi,%eax
400010d9:	89 eb                	mov    %ebp,%ebx
400010db:	cd 30                	int    $0x30
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
400010dd:	83 fb 0a             	cmp    $0xa,%ebx
400010e0:	74 ce                	je     400010b0 <flocktest_test_write+0x90>
            printf("error: write aa %d new file failed\n", i);
400010e2:	83 ec 08             	sub    $0x8,%esp
400010e5:	57                   	push   %edi
400010e6:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400010ea:	8d 83 18 d3 ff ff    	lea    -0x2ce8(%ebx),%eax
400010f0:	50                   	push   %eax
400010f1:	e8 fa f1 ff ff       	call   400002f0 <printf>
            exit();
400010f6:	83 c4 10             	add    $0x10,%esp
}
400010f9:	83 c4 1c             	add    $0x1c,%esp
400010fc:	5b                   	pop    %ebx
400010fd:	5e                   	pop    %esi
400010fe:	5f                   	pop    %edi
400010ff:	5d                   	pop    %ebp
40001100:	c3                   	ret
40001101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printf("error: write bb %d new file failed\n", i);
40001108:	83 ec 08             	sub    $0x8,%esp
4000110b:	57                   	push   %edi
4000110c:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001110:	8d 83 3c d3 ff ff    	lea    -0x2cc4(%ebx),%eax
40001116:	50                   	push   %eax
40001117:	e8 d4 f1 ff ff       	call   400002f0 <printf>
            exit();
4000111c:	83 c4 10             	add    $0x10,%esp
}
4000111f:	83 c4 1c             	add    $0x1c,%esp
40001122:	5b                   	pop    %ebx
40001123:	5e                   	pop    %esi
40001124:	5f                   	pop    %edi
40001125:	5d                   	pop    %ebp
40001126:	c3                   	ret
40001127:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000112e:	00 
4000112f:	90                   	nop
        printf("ERROR in flocktest_test_read: create flockfile failed!\n");
40001130:	83 ec 0c             	sub    $0xc,%esp
40001133:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001137:	8d 83 a0 d2 ff ff    	lea    -0x2d60(%ebx),%eax
4000113d:	50                   	push   %eax
4000113e:	e8 ad f1 ff ff       	call   400002f0 <printf>
        exit();
40001143:	83 c4 10             	add    $0x10,%esp
}
40001146:	83 c4 1c             	add    $0x1c,%esp
40001149:	5b                   	pop    %ebx
4000114a:	5e                   	pop    %esi
4000114b:	5f                   	pop    %edi
4000114c:	5d                   	pop    %ebp
4000114d:	c3                   	ret
    asm volatile ("int %2"
4000114e:	b8 0d 00 00 00       	mov    $0xd,%eax
40001153:	b9 04 00 00 00       	mov    $0x4,%ecx
40001158:	89 eb                	mov    %ebp,%ebx
4000115a:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
4000115c:	85 c0                	test   %eax,%eax
4000115e:	0f 85 8c 00 00 00    	jne    400011f0 <flocktest_test_write+0x1d0>
    asm volatile ("int %2"
40001164:	b8 05 00 00 00       	mov    $0x5,%eax
40001169:	89 eb                	mov    %ebp,%ebx
4000116b:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
4000116d:	83 ec 0c             	sub    $0xc,%esp
40001170:	8b 74 24 18          	mov    0x18(%esp),%esi
40001174:	56                   	push   %esi
40001175:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001179:	e8 d2 f9 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
4000117e:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001180:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001183:	b8 0b 00 00 00       	mov    $0xb,%eax
40001188:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000118a:	83 c4 10             	add    $0x10,%esp
4000118d:	85 c0                	test   %eax,%eax
4000118f:	75 44                	jne    400011d5 <flocktest_test_write+0x1b5>
    printf("=====flocktest_test_write ok=====\n\n"); 
40001191:	83 ec 0c             	sub    $0xc,%esp
40001194:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001198:	8d 83 a0 d3 ff ff    	lea    -0x2c60(%ebx),%eax
4000119e:	50                   	push   %eax
4000119f:	e8 4c f1 ff ff       	call   400002f0 <printf>
400011a4:	83 c4 10             	add    $0x10,%esp
400011a7:	e9 4d ff ff ff       	jmp    400010f9 <flocktest_test_write+0xd9>
        printf("ERROR in flocktest_test_read: acquire exclusive lock failed!\n");
400011ac:	83 ec 0c             	sub    $0xc,%esp
400011af:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400011b3:	8d 83 d8 d2 ff ff    	lea    -0x2d28(%ebx),%eax
400011b9:	50                   	push   %eax
400011ba:	e8 31 f1 ff ff       	call   400002f0 <printf>
        printf("flocktest_test_read failed.\n");
400011bf:	8d 83 52 d0 ff ff    	lea    -0x2fae(%ebx),%eax
400011c5:	89 04 24             	mov    %eax,(%esp)
400011c8:	e8 23 f1 ff ff       	call   400002f0 <printf>
        exit();
400011cd:	83 c4 10             	add    $0x10,%esp
400011d0:	e9 24 ff ff ff       	jmp    400010f9 <flocktest_test_write+0xd9>
        printf("ERROR in flocktest_test_write: unlink flockfile failed\n");
400011d5:	83 ec 0c             	sub    $0xc,%esp
400011d8:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400011dc:	8d 83 c4 d3 ff ff    	lea    -0x2c3c(%ebx),%eax
400011e2:	50                   	push   %eax
400011e3:	e8 08 f1 ff ff       	call   400002f0 <printf>
        exit();
400011e8:	83 c4 10             	add    $0x10,%esp
400011eb:	e9 09 ff ff ff       	jmp    400010f9 <flocktest_test_write+0xd9>
        printf("ERROR in flocktest_test_write: release exclusive lock failed\n");
400011f0:	83 ec 0c             	sub    $0xc,%esp
400011f3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400011f7:	8d 83 60 d3 ff ff    	lea    -0x2ca0(%ebx),%eax
400011fd:	50                   	push   %eax
400011fe:	e8 ed f0 ff ff       	call   400002f0 <printf>
        printf("flocktest_test_write failed.\n");
40001203:	8d 83 85 d0 ff ff    	lea    -0x2f7b(%ebx),%eax
40001209:	89 04 24             	mov    %eax,(%esp)
4000120c:	e8 df f0 ff ff       	call   400002f0 <printf>
        exit(); 
40001211:	83 c4 10             	add    $0x10,%esp
40001214:	e9 e0 fe ff ff       	jmp    400010f9 <flocktest_test_write+0xd9>
40001219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40001220 <flocktest_test_read>:
{
40001220:	55                   	push   %ebp
    asm volatile ("int %2"
40001221:	bd 04 00 00 00       	mov    $0x4,%ebp
40001226:	57                   	push   %edi
40001227:	56                   	push   %esi
40001228:	e8 f9 09 00 00       	call   40001c26 <__x86.get_pc_thunk.si>
4000122d:	81 c6 c7 3d 00 00    	add    $0x3dc7,%esi
40001233:	53                   	push   %ebx
40001234:	83 ec 18             	sub    $0x18,%esp
    printf("=====flocktest_test_read=====\n");
40001237:	8d 86 fc d3 ff ff    	lea    -0x2c04(%esi),%eax
4000123d:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000123f:	8d be 48 d0 ff ff    	lea    -0x2fb8(%esi),%edi
40001245:	50                   	push   %eax
40001246:	e8 a5 f0 ff ff       	call   400002f0 <printf>
4000124b:	89 3c 24             	mov    %edi,(%esp)
4000124e:	e8 fd f8 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
40001253:	b9 02 02 00 00       	mov    $0x202,%ecx
40001258:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000125a:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000125d:	89 e8                	mov    %ebp,%eax
4000125f:	cd 30                	int    $0x30
    if (fd < 0) {
40001261:	83 c4 10             	add    $0x10,%esp
40001264:	85 db                	test   %ebx,%ebx
40001266:	78 78                	js     400012e0 <flocktest_test_read+0xc0>
40001268:	85 c0                	test   %eax,%eax
4000126a:	75 74                	jne    400012e0 <flocktest_test_read+0xc0>
4000126c:	89 da                	mov    %ebx,%edx
    asm volatile ("int %2"
4000126e:	b9 01 00 00 00       	mov    $0x1,%ecx
40001273:	b8 0d 00 00 00       	mov    $0xd,%eax
40001278:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
4000127a:	85 c0                	test   %eax,%eax
4000127c:	0f 85 8e 00 00 00    	jne    40001310 <flocktest_test_read+0xf0>
    asm volatile ("int %2"
40001282:	b8 0d 00 00 00       	mov    $0xd,%eax
40001287:	89 d3                	mov    %edx,%ebx
40001289:	89 e9                	mov    %ebp,%ecx
4000128b:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
4000128d:	85 c0                	test   %eax,%eax
4000128f:	0f 85 8b 00 00 00    	jne    40001320 <flocktest_test_read+0x100>
    asm volatile ("int %2"
40001295:	b8 05 00 00 00       	mov    $0x5,%eax
4000129a:	89 d3                	mov    %edx,%ebx
4000129c:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
4000129e:	83 ec 0c             	sub    $0xc,%esp
400012a1:	89 f3                	mov    %esi,%ebx
400012a3:	57                   	push   %edi
400012a4:	e8 a7 f8 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
400012a9:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
400012ab:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400012ae:	b8 0b 00 00 00       	mov    $0xb,%eax
400012b3:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400012b5:	83 c4 10             	add    $0x10,%esp
400012b8:	85 c0                	test   %eax,%eax
400012ba:	75 74                	jne    40001330 <flocktest_test_read+0x110>
    printf("=====flocktest_test_read ok=====\n\n");
400012bc:	83 ec 0c             	sub    $0xc,%esp
400012bf:	8d 86 b8 d4 ff ff    	lea    -0x2b48(%esi),%eax
400012c5:	89 f3                	mov    %esi,%ebx
400012c7:	50                   	push   %eax
400012c8:	e8 23 f0 ff ff       	call   400002f0 <printf>
400012cd:	83 c4 10             	add    $0x10,%esp
}
400012d0:	83 c4 0c             	add    $0xc,%esp
400012d3:	5b                   	pop    %ebx
400012d4:	5e                   	pop    %esi
400012d5:	5f                   	pop    %edi
400012d6:	5d                   	pop    %ebp
400012d7:	c3                   	ret
400012d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400012df:	00 
        printf("Error: create flockfile failed!\n");
400012e0:	83 ec 0c             	sub    $0xc,%esp
400012e3:	8d 86 1c d4 ff ff    	lea    -0x2be4(%esi),%eax
        printf("ERROR in flocktest_test_read: release shared lock failed\n");
400012e9:	50                   	push   %eax
400012ea:	89 f3                	mov    %esi,%ebx
400012ec:	e8 ff ef ff ff       	call   400002f0 <printf>
        printf("flocktest_test_read failed.\n");
400012f1:	8d 86 52 d0 ff ff    	lea    -0x2fae(%esi),%eax
400012f7:	89 04 24             	mov    %eax,(%esp)
400012fa:	e8 f1 ef ff ff       	call   400002f0 <printf>
        exit();
400012ff:	83 c4 10             	add    $0x10,%esp
}
40001302:	83 c4 0c             	add    $0xc,%esp
40001305:	5b                   	pop    %ebx
40001306:	5e                   	pop    %esi
40001307:	5f                   	pop    %edi
40001308:	5d                   	pop    %ebp
40001309:	c3                   	ret
4000130a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf("ERROR in flocktest_test_read: acquire shared lock failed!\n");
40001310:	83 ec 0c             	sub    $0xc,%esp
40001313:	8d 86 40 d4 ff ff    	lea    -0x2bc0(%esi),%eax
40001319:	eb ce                	jmp    400012e9 <flocktest_test_read+0xc9>
4000131b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("ERROR in flocktest_test_read: release shared lock failed\n");
40001320:	83 ec 0c             	sub    $0xc,%esp
40001323:	8d 86 7c d4 ff ff    	lea    -0x2b84(%esi),%eax
40001329:	eb be                	jmp    400012e9 <flocktest_test_read+0xc9>
4000132b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("ERROR in flocktest_test_read: unlink flockfile failed\n");
40001330:	83 ec 0c             	sub    $0xc,%esp
40001333:	8d 86 dc d4 ff ff    	lea    -0x2b24(%esi),%eax
40001339:	89 f3                	mov    %esi,%ebx
4000133b:	50                   	push   %eax
4000133c:	e8 af ef ff ff       	call   400002f0 <printf>
        exit();
40001341:	83 c4 10             	add    $0x10,%esp
40001344:	eb 8a                	jmp    400012d0 <flocktest_test_read+0xb0>
40001346:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000134d:	00 
4000134e:	66 90                	xchg   %ax,%ax

40001350 <flocktest_test_close>:
{
40001350:	55                   	push   %ebp
    asm volatile ("int %2"
40001351:	bd 04 00 00 00       	mov    $0x4,%ebp
40001356:	57                   	push   %edi
40001357:	e8 ce 08 00 00       	call   40001c2a <__x86.get_pc_thunk.di>
4000135c:	81 c7 98 3c 00 00    	add    $0x3c98,%edi
40001362:	56                   	push   %esi
40001363:	53                   	push   %ebx
40001364:	83 ec 28             	sub    $0x28,%esp
    printf("=====flocktest_test_close=====\n");
40001367:	8d 87 14 d5 ff ff    	lea    -0x2aec(%edi),%eax
4000136d:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000136f:	8d b7 48 d0 ff ff    	lea    -0x2fb8(%edi),%esi
40001375:	50                   	push   %eax
40001376:	e8 75 ef ff ff       	call   400002f0 <printf>
4000137b:	89 34 24             	mov    %esi,(%esp)
4000137e:	e8 cd f7 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
40001383:	b9 02 02 00 00       	mov    $0x202,%ecx
40001388:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000138a:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000138d:	89 e8                	mov    %ebp,%eax
4000138f:	cd 30                	int    $0x30
    if (fd < 0) {
40001391:	83 c4 10             	add    $0x10,%esp
40001394:	85 db                	test   %ebx,%ebx
40001396:	0f 88 a4 00 00 00    	js     40001440 <flocktest_test_close+0xf0>
4000139c:	85 c0                	test   %eax,%eax
4000139e:	0f 85 9c 00 00 00    	jne    40001440 <flocktest_test_close+0xf0>
400013a4:	89 da                	mov    %ebx,%edx
    asm volatile ("int %2"
400013a6:	b9 02 00 00 00       	mov    $0x2,%ecx
400013ab:	b8 0d 00 00 00       	mov    $0xd,%eax
400013b0:	cd 30                	int    $0x30
400013b2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    return errno ? -1 : 0;; // errno ? -1 : 0; 
400013b6:	85 c0                	test   %eax,%eax
400013b8:	0f 85 d2 00 00 00    	jne    40001490 <flocktest_test_close+0x140>
    asm volatile ("int %2"
400013be:	b8 05 00 00 00       	mov    $0x5,%eax
400013c3:	89 d3                	mov    %edx,%ebx
400013c5:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
400013c7:	83 ec 0c             	sub    $0xc,%esp
400013ca:	89 fb                	mov    %edi,%ebx
400013cc:	56                   	push   %esi
400013cd:	e8 7e f7 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
400013d2:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
400013d6:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400013d8:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400013db:	89 e8                	mov    %ebp,%eax
400013dd:	cd 30                	int    $0x30
400013df:	89 de                	mov    %ebx,%esi
    if (fd < 0) {
400013e1:	83 c4 10             	add    $0x10,%esp
400013e4:	85 db                	test   %ebx,%ebx
400013e6:	0f 88 84 00 00 00    	js     40001470 <flocktest_test_close+0x120>
400013ec:	85 c0                	test   %eax,%eax
400013ee:	0f 85 7c 00 00 00    	jne    40001470 <flocktest_test_close+0x120>
    asm volatile ("int %2"
400013f4:	b9 0a 00 00 00       	mov    $0xa,%ecx
400013f9:	b8 0d 00 00 00       	mov    $0xd,%eax
400013fe:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001400:	85 c0                	test   %eax,%eax
40001402:	0f 85 98 00 00 00    	jne    400014a0 <flocktest_test_close+0x150>
    asm volatile ("int %2"
40001408:	b8 0d 00 00 00       	mov    $0xd,%eax
4000140d:	89 f3                	mov    %esi,%ebx
4000140f:	89 e9                	mov    %ebp,%ecx
40001411:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001413:	85 c0                	test   %eax,%eax
40001415:	75 69                	jne    40001480 <flocktest_test_close+0x130>
    asm volatile ("int %2"
40001417:	b8 05 00 00 00       	mov    $0x5,%eax
4000141c:	89 f3                	mov    %esi,%ebx
4000141e:	cd 30                	int    $0x30
    printf("=====flocktest_test_close ok=====\n\n");
40001420:	83 ec 0c             	sub    $0xc,%esp
40001423:	8d 87 cc d5 ff ff    	lea    -0x2a34(%edi),%eax
40001429:	89 fb                	mov    %edi,%ebx
4000142b:	50                   	push   %eax
4000142c:	e8 bf ee ff ff       	call   400002f0 <printf>
40001431:	83 c4 10             	add    $0x10,%esp
}
40001434:	83 c4 1c             	add    $0x1c,%esp
40001437:	5b                   	pop    %ebx
40001438:	5e                   	pop    %esi
40001439:	5f                   	pop    %edi
4000143a:	5d                   	pop    %ebp
4000143b:	c3                   	ret
4000143c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("Error: create flockfile failed!\n");
40001440:	83 ec 0c             	sub    $0xc,%esp
40001443:	8d 87 1c d4 ff ff    	lea    -0x2be4(%edi),%eax
        printf("ERROR in flocktest_test_close: release exclusive lock failed\n");
40001449:	50                   	push   %eax
4000144a:	89 fb                	mov    %edi,%ebx
4000144c:	e8 9f ee ff ff       	call   400002f0 <printf>
        printf("flocktest_test_close failed.\n");
40001451:	8d 87 a3 d0 ff ff    	lea    -0x2f5d(%edi),%eax
40001457:	89 04 24             	mov    %eax,(%esp)
4000145a:	e8 91 ee ff ff       	call   400002f0 <printf>
        exit(); 
4000145f:	83 c4 10             	add    $0x10,%esp
}
40001462:	83 c4 1c             	add    $0x1c,%esp
40001465:	5b                   	pop    %ebx
40001466:	5e                   	pop    %esi
40001467:	5f                   	pop    %edi
40001468:	5d                   	pop    %ebp
40001469:	c3                   	ret
4000146a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf("ERROR: create flockfile failed!\n");
40001470:	83 ec 0c             	sub    $0xc,%esp
40001473:	8d 87 74 d5 ff ff    	lea    -0x2a8c(%edi),%eax
40001479:	eb ce                	jmp    40001449 <flocktest_test_close+0xf9>
4000147b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("ERROR in flocktest_test_close: release exclusive lock failed\n");
40001480:	83 ec 0c             	sub    $0xc,%esp
40001483:	8d 87 f0 d5 ff ff    	lea    -0x2a10(%edi),%eax
40001489:	eb be                	jmp    40001449 <flocktest_test_close+0xf9>
4000148b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("ERROR in flocktest_test_close: acquire exclusive lock failed!\n");
40001490:	83 ec 0c             	sub    $0xc,%esp
40001493:	8d 87 34 d5 ff ff    	lea    -0x2acc(%edi),%eax
40001499:	eb ae                	jmp    40001449 <flocktest_test_close+0xf9>
4000149b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("flocktest_test_close failed: file is still locked\n");
400014a0:	83 ec 0c             	sub    $0xc,%esp
400014a3:	8d 87 98 d5 ff ff    	lea    -0x2a68(%edi),%eax
400014a9:	89 fb                	mov    %edi,%ebx
400014ab:	50                   	push   %eax
400014ac:	e8 3f ee ff ff       	call   400002f0 <printf>
        exit();
400014b1:	83 c4 10             	add    $0x10,%esp
400014b4:	e9 7b ff ff ff       	jmp    40001434 <flocktest_test_close+0xe4>
400014b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

400014c0 <flocktest_test_nonblocking>:
{
400014c0:	55                   	push   %ebp
400014c1:	57                   	push   %edi
400014c2:	e8 63 07 00 00       	call   40001c2a <__x86.get_pc_thunk.di>
400014c7:	81 c7 2d 3b 00 00    	add    $0x3b2d,%edi
400014cd:	56                   	push   %esi
400014ce:	53                   	push   %ebx
400014cf:	83 ec 28             	sub    $0x28,%esp
    printf("=====flocktest_test_nonblocking (part 1)=====\n");
400014d2:	8d 87 30 d6 ff ff    	lea    -0x29d0(%edi),%eax
400014d8:	89 7c 24 14          	mov    %edi,0x14(%esp)
400014dc:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
400014de:	8d b7 48 d0 ff ff    	lea    -0x2fb8(%edi),%esi
400014e4:	50                   	push   %eax
400014e5:	e8 06 ee ff ff       	call   400002f0 <printf>
400014ea:	89 34 24             	mov    %esi,(%esp)
400014ed:	89 74 24 1c          	mov    %esi,0x1c(%esp)
400014f1:	e8 5a f6 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
400014f6:	b9 02 02 00 00       	mov    $0x202,%ecx
400014fb:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400014fd:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001500:	b8 04 00 00 00       	mov    $0x4,%eax
40001505:	cd 30                	int    $0x30
    return errno ? -1 : fd;
40001507:	83 c4 10             	add    $0x10,%esp
    if ((fd = open("flockfile", O_CREATE | O_RDWR)) < 0) {
4000150a:	85 c0                	test   %eax,%eax
4000150c:	0f 85 9e 00 00 00    	jne    400015b0 <flocktest_test_nonblocking+0xf0>
40001512:	89 df                	mov    %ebx,%edi
40001514:	85 db                	test   %ebx,%ebx
40001516:	0f 88 94 00 00 00    	js     400015b0 <flocktest_test_nonblocking+0xf0>
    asm volatile ("int %2"
4000151c:	b8 0d 00 00 00       	mov    $0xd,%eax
40001521:	b9 0a 00 00 00       	mov    $0xa,%ecx
40001526:	cd 30                	int    $0x30
40001528:	89 c5                	mov    %eax,%ebp
    return errno ? -1 : 0;; // errno ? -1 : 0; 
4000152a:	85 c0                	test   %eax,%eax
4000152c:	0f 85 c8 01 00 00    	jne    400016fa <flocktest_test_nonblocking+0x23a>
40001532:	8b 44 24 08          	mov    0x8(%esp),%eax
40001536:	8d b0 6f d0 ff ff    	lea    -0x2f91(%eax),%esi
    asm volatile ("int %2"
4000153c:	8d 80 7a d0 ff ff    	lea    -0x2f86(%eax),%eax
40001542:	89 34 24             	mov    %esi,(%esp)
40001545:	89 44 24 04          	mov    %eax,0x4(%esp)
40001549:	eb 27                	jmp    40001572 <flocktest_test_nonblocking+0xb2>
4000154b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001550:	85 c0                	test   %eax,%eax
40001552:	75 36                	jne    4000158a <flocktest_test_nonblocking+0xca>
40001554:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40001558:	b8 07 00 00 00       	mov    $0x7,%eax
4000155d:	89 fb                	mov    %edi,%ebx
4000155f:	cd 30                	int    $0x30
        if (write(fd, "bbbbbbbbbb", 10) != 10) {
40001561:	83 fb 0a             	cmp    $0xa,%ebx
40001564:	75 6a                	jne    400015d0 <flocktest_test_nonblocking+0x110>
40001566:	85 c0                	test   %eax,%eax
40001568:	75 66                	jne    400015d0 <flocktest_test_nonblocking+0x110>
    for (int i = 0; i < 50; i++) { // changed from 100 to 50 
4000156a:	83 c5 01             	add    $0x1,%ebp
4000156d:	83 fd 32             	cmp    $0x32,%ebp
40001570:	74 7e                	je     400015f0 <flocktest_test_nonblocking+0x130>
40001572:	be 0a 00 00 00       	mov    $0xa,%esi
40001577:	8b 0c 24             	mov    (%esp),%ecx
4000157a:	b8 07 00 00 00       	mov    $0x7,%eax
4000157f:	89 fb                	mov    %edi,%ebx
40001581:	89 f2                	mov    %esi,%edx
40001583:	cd 30                	int    $0x30
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001585:	83 fb 0a             	cmp    $0xa,%ebx
40001588:	74 c6                	je     40001550 <flocktest_test_nonblocking+0x90>
            printf("error: write aa %d new file failed\n", i);
4000158a:	83 ec 08             	sub    $0x8,%esp
4000158d:	55                   	push   %ebp
4000158e:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001592:	8d 83 18 d3 ff ff    	lea    -0x2ce8(%ebx),%eax
40001598:	50                   	push   %eax
40001599:	e8 52 ed ff ff       	call   400002f0 <printf>
            exit();
4000159e:	83 c4 10             	add    $0x10,%esp
}
400015a1:	83 c4 1c             	add    $0x1c,%esp
400015a4:	5b                   	pop    %ebx
400015a5:	5e                   	pop    %esi
400015a6:	5f                   	pop    %edi
400015a7:	5d                   	pop    %ebp
400015a8:	c3                   	ret
400015a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf("ERROR in flocktest_test_nonblocking: create flockfile failed!\n");
400015b0:	83 ec 0c             	sub    $0xc,%esp
400015b3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400015b7:	8d 83 60 d6 ff ff    	lea    -0x29a0(%ebx),%eax
400015bd:	50                   	push   %eax
400015be:	e8 2d ed ff ff       	call   400002f0 <printf>
        exit();
400015c3:	83 c4 10             	add    $0x10,%esp
}
400015c6:	83 c4 1c             	add    $0x1c,%esp
400015c9:	5b                   	pop    %ebx
400015ca:	5e                   	pop    %esi
400015cb:	5f                   	pop    %edi
400015cc:	5d                   	pop    %ebp
400015cd:	c3                   	ret
400015ce:	66 90                	xchg   %ax,%ax
            printf("error: write bb %d new file failed\n", i);
400015d0:	83 ec 08             	sub    $0x8,%esp
400015d3:	55                   	push   %ebp
400015d4:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400015d8:	8d 83 3c d3 ff ff    	lea    -0x2cc4(%ebx),%eax
400015de:	50                   	push   %eax
400015df:	e8 0c ed ff ff       	call   400002f0 <printf>
            exit();
400015e4:	83 c4 10             	add    $0x10,%esp
}
400015e7:	83 c4 1c             	add    $0x1c,%esp
400015ea:	5b                   	pop    %ebx
400015eb:	5e                   	pop    %esi
400015ec:	5f                   	pop    %edi
400015ed:	5d                   	pop    %ebp
400015ee:	c3                   	ret
400015ef:	90                   	nop
    asm volatile ("int %2"
400015f0:	bd 04 00 00 00       	mov    $0x4,%ebp
400015f5:	b8 0d 00 00 00       	mov    $0xd,%eax
400015fa:	89 fb                	mov    %edi,%ebx
400015fc:	89 e9                	mov    %ebp,%ecx
400015fe:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001600:	85 c0                	test   %eax,%eax
40001602:	0f 85 16 01 00 00    	jne    4000171e <flocktest_test_nonblocking+0x25e>
    asm volatile ("int %2"
40001608:	b8 05 00 00 00       	mov    $0x5,%eax
4000160d:	89 fb                	mov    %edi,%ebx
4000160f:	cd 30                	int    $0x30
    printf("=====flocktest_test_nonblocking (part 1) ok=====\n\n");
40001611:	83 ec 0c             	sub    $0xc,%esp
40001614:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001618:	8d 83 f8 d6 ff ff    	lea    -0x2908(%ebx),%eax
4000161e:	50                   	push   %eax
4000161f:	e8 cc ec ff ff       	call   400002f0 <printf>
    printf("=====flocktest_test_nonblocking (part 2)=====\n");
40001624:	8d 83 2c d7 ff ff    	lea    -0x28d4(%ebx),%eax
4000162a:	89 04 24             	mov    %eax,(%esp)
4000162d:	e8 be ec ff ff       	call   400002f0 <printf>
    if ((child_pid = spawn(10, 500)) == -1) { // flockstall process
40001632:	58                   	pop    %eax
40001633:	5a                   	pop    %edx
40001634:	68 f4 01 00 00       	push   $0x1f4
40001639:	6a 0a                	push   $0xa
4000163b:	e8 60 f4 ff ff       	call   40000aa0 <spawn>
40001640:	83 c4 10             	add    $0x10,%esp
40001643:	83 f8 ff             	cmp    $0xffffffff,%eax
40001646:	0f 84 93 00 00 00    	je     400016df <flocktest_test_nonblocking+0x21f>
    con = consume();
4000164c:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001650:	e8 8b f4 ff ff       	call   40000ae0 <consume>
    int len = strlen(path) + 1;
40001655:	83 ec 0c             	sub    $0xc,%esp
40001658:	8b 7c 24 18          	mov    0x18(%esp),%edi
4000165c:	57                   	push   %edi
4000165d:	e8 ee f4 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
40001662:	b9 02 00 00 00       	mov    $0x2,%ecx
40001667:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001669:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000166c:	89 e8                	mov    %ebp,%eax
4000166e:	cd 30                	int    $0x30
40001670:	89 df                	mov    %ebx,%edi
    if ((fd = open("flockfile", O_RDWR)) < 0) {
40001672:	83 c4 10             	add    $0x10,%esp
40001675:	85 db                	test   %ebx,%ebx
40001677:	78 4b                	js     400016c4 <flocktest_test_nonblocking+0x204>
40001679:	85 c0                	test   %eax,%eax
4000167b:	75 47                	jne    400016c4 <flocktest_test_nonblocking+0x204>
    asm volatile ("int %2"
4000167d:	b8 0d 00 00 00       	mov    $0xd,%eax
40001682:	89 f1                	mov    %esi,%ecx
40001684:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001686:	85 c0                	test   %eax,%eax
40001688:	0f 85 ab 00 00 00    	jne    40001739 <flocktest_test_nonblocking+0x279>
       printf("flocktest_test_nonblocking failed! value: %d\n", flock_retval); 
4000168e:	83 ec 08             	sub    $0x8,%esp
40001691:	6a 00                	push   $0x0
40001693:	8b 74 24 14          	mov    0x14(%esp),%esi
40001697:	8d 86 28 d8 ff ff    	lea    -0x27d8(%esi),%eax
4000169d:	89 f3                	mov    %esi,%ebx
4000169f:	50                   	push   %eax
400016a0:	e8 4b ec ff ff       	call   400002f0 <printf>
    asm volatile ("int %2"
400016a5:	b8 05 00 00 00       	mov    $0x5,%eax
400016aa:	89 fb                	mov    %edi,%ebx
400016ac:	cd 30                	int    $0x30
       produce(1);
400016ae:	89 f3                	mov    %esi,%ebx
400016b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
400016b7:	e8 14 f4 ff ff       	call   40000ad0 <produce>
       exit();
400016bc:	83 c4 10             	add    $0x10,%esp
400016bf:	e9 dd fe ff ff       	jmp    400015a1 <flocktest_test_nonblocking+0xe1>
        printf("ERROR in flocktest_test_nonblocking: open flockfile failed\n");
400016c4:	83 ec 0c             	sub    $0xc,%esp
400016c7:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400016cb:	8d 83 ec d7 ff ff    	lea    -0x2814(%ebx),%eax
400016d1:	50                   	push   %eax
400016d2:	e8 19 ec ff ff       	call   400002f0 <printf>
        exit();
400016d7:	83 c4 10             	add    $0x10,%esp
400016da:	e9 c2 fe ff ff       	jmp    400015a1 <flocktest_test_nonblocking+0xe1>
        printf("ERROR in flocktest_test_nonblocking: failed to spawn flockstall process\n");
400016df:	83 ec 0c             	sub    $0xc,%esp
400016e2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400016e6:	8d 83 a0 d7 ff ff    	lea    -0x2860(%ebx),%eax
400016ec:	50                   	push   %eax
400016ed:	e8 fe eb ff ff       	call   400002f0 <printf>
        exit();
400016f2:	83 c4 10             	add    $0x10,%esp
400016f5:	e9 a7 fe ff ff       	jmp    400015a1 <flocktest_test_nonblocking+0xe1>
        printf("ERROR in flocktest_test_nonblocking: could not acquire exclusive lock (non-blocking)\n");
400016fa:	83 ec 0c             	sub    $0xc,%esp
400016fd:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001701:	8d 83 a0 d6 ff ff    	lea    -0x2960(%ebx),%eax
40001707:	50                   	push   %eax
40001708:	e8 e3 eb ff ff       	call   400002f0 <printf>
4000170d:	b8 05 00 00 00       	mov    $0x5,%eax
40001712:	89 fb                	mov    %edi,%ebx
40001714:	cd 30                	int    $0x30
        exit();
40001716:	83 c4 10             	add    $0x10,%esp
40001719:	e9 83 fe ff ff       	jmp    400015a1 <flocktest_test_nonblocking+0xe1>
        printf("ERROR in flocktest_test_nonblocking: release exclusive lock failed\n");
4000171e:	83 ec 0c             	sub    $0xc,%esp
40001721:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001725:	8d 83 5c d7 ff ff    	lea    -0x28a4(%ebx),%eax
4000172b:	50                   	push   %eax
4000172c:	e8 bf eb ff ff       	call   400002f0 <printf>
        exit();
40001731:	83 c4 10             	add    $0x10,%esp
40001734:	e9 68 fe ff ff       	jmp    400015a1 <flocktest_test_nonblocking+0xe1>
    produce(1);
40001739:	83 ec 0c             	sub    $0xc,%esp
4000173c:	6a 01                	push   $0x1
4000173e:	8b 74 24 18          	mov    0x18(%esp),%esi
40001742:	89 f3                	mov    %esi,%ebx
40001744:	e8 87 f3 ff ff       	call   40000ad0 <produce>
40001749:	b8 05 00 00 00       	mov    $0x5,%eax
4000174e:	89 fb                	mov    %edi,%ebx
40001750:	cd 30                	int    $0x30
    printf("=====flocktest_test_nonblocking (part 2) ok=====\n\n");
40001752:	8d 86 58 d8 ff ff    	lea    -0x27a8(%esi),%eax
40001758:	89 f3                	mov    %esi,%ebx
4000175a:	89 04 24             	mov    %eax,(%esp)
4000175d:	e8 8e eb ff ff       	call   400002f0 <printf>
40001762:	83 c4 10             	add    $0x10,%esp
40001765:	e9 37 fe ff ff       	jmp    400015a1 <flocktest_test_nonblocking+0xe1>
4000176a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001770 <flocktest_test_upgrade>:
{
40001770:	55                   	push   %ebp
40001771:	57                   	push   %edi
40001772:	56                   	push   %esi
40001773:	53                   	push   %ebx
40001774:	e8 0e ea ff ff       	call   40000187 <__x86.get_pc_thunk.bx>
40001779:	81 c3 7b 38 00 00    	add    $0x387b,%ebx
4000177f:	83 ec 28             	sub    $0x28,%esp
    printf("=====flocktest_test_upgrade=====\n");
40001782:	8d 83 8c d8 ff ff    	lea    -0x2774(%ebx),%eax
40001788:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    int len = strlen(path) + 1;
4000178c:	8d b3 48 d0 ff ff    	lea    -0x2fb8(%ebx),%esi
40001792:	50                   	push   %eax
40001793:	e8 58 eb ff ff       	call   400002f0 <printf>
40001798:	89 34 24             	mov    %esi,(%esp)
4000179b:	e8 b0 f3 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
400017a0:	b9 02 02 00 00       	mov    $0x202,%ecx
400017a5:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400017a7:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400017aa:	b8 04 00 00 00       	mov    $0x4,%eax
400017af:	cd 30                	int    $0x30
    return errno ? -1 : fd;
400017b1:	83 c4 10             	add    $0x10,%esp
    if ((fd = open("flockfile", O_CREATE | O_RDWR))< 0) {
400017b4:	85 c0                	test   %eax,%eax
400017b6:	0f 85 b4 00 00 00    	jne    40001870 <flocktest_test_upgrade+0x100>
400017bc:	89 de                	mov    %ebx,%esi
400017be:	85 db                	test   %ebx,%ebx
400017c0:	0f 88 aa 00 00 00    	js     40001870 <flocktest_test_upgrade+0x100>
    asm volatile ("int %2"
400017c6:	ba 0d 00 00 00       	mov    $0xd,%edx
400017cb:	b9 01 00 00 00       	mov    $0x1,%ecx
400017d0:	89 d0                	mov    %edx,%eax
400017d2:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
400017d4:	85 c0                	test   %eax,%eax
400017d6:	0f 85 0d 01 00 00    	jne    400018e9 <flocktest_test_upgrade+0x179>
    asm volatile ("int %2"
400017dc:	b9 02 00 00 00       	mov    $0x2,%ecx
400017e1:	89 d0                	mov    %edx,%eax
400017e3:	89 f3                	mov    %esi,%ebx
400017e5:	cd 30                	int    $0x30
400017e7:	89 c5                	mov    %eax,%ebp
    return errno ? -1 : 0;; // errno ? -1 : 0; 
400017e9:	85 c0                	test   %eax,%eax
400017eb:	0f 85 1c 01 00 00    	jne    4000190d <flocktest_test_upgrade+0x19d>
400017f1:	8b 44 24 0c          	mov    0xc(%esp),%eax
400017f5:	8d b8 6f d0 ff ff    	lea    -0x2f91(%eax),%edi
    asm volatile ("int %2"
400017fb:	8d 80 7a d0 ff ff    	lea    -0x2f86(%eax),%eax
40001801:	89 7c 24 04          	mov    %edi,0x4(%esp)
40001805:	bf 07 00 00 00       	mov    $0x7,%edi
4000180a:	89 44 24 08          	mov    %eax,0x8(%esp)
4000180e:	eb 23                	jmp    40001833 <flocktest_test_upgrade+0xc3>
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001810:	85 c0                	test   %eax,%eax
40001812:	75 33                	jne    40001847 <flocktest_test_upgrade+0xd7>
40001814:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40001818:	89 f8                	mov    %edi,%eax
4000181a:	89 f3                	mov    %esi,%ebx
4000181c:	cd 30                	int    $0x30
        if (write(fd, "bbbbbbbbbb", 10) != 10) {
4000181e:	83 fb 0a             	cmp    $0xa,%ebx
40001821:	75 6d                	jne    40001890 <flocktest_test_upgrade+0x120>
40001823:	85 c0                	test   %eax,%eax
40001825:	75 69                	jne    40001890 <flocktest_test_upgrade+0x120>
    for (int i = 0; i < 50; i++) { // changed from 100 to 50 
40001827:	83 c5 01             	add    $0x1,%ebp
4000182a:	83 fd 32             	cmp    $0x32,%ebp
4000182d:	0f 84 7d 00 00 00    	je     400018b0 <flocktest_test_upgrade+0x140>
40001833:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40001837:	ba 0a 00 00 00       	mov    $0xa,%edx
4000183c:	89 f8                	mov    %edi,%eax
4000183e:	89 f3                	mov    %esi,%ebx
40001840:	cd 30                	int    $0x30
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001842:	83 fb 0a             	cmp    $0xa,%ebx
40001845:	74 c9                	je     40001810 <flocktest_test_upgrade+0xa0>
            printf("error: write aa %d new file failed\n", i);
40001847:	83 ec 08             	sub    $0x8,%esp
4000184a:	55                   	push   %ebp
4000184b:	8b 5c 24 18          	mov    0x18(%esp),%ebx
4000184f:	8d 83 18 d3 ff ff    	lea    -0x2ce8(%ebx),%eax
40001855:	50                   	push   %eax
40001856:	e8 95 ea ff ff       	call   400002f0 <printf>
            exit();
4000185b:	83 c4 10             	add    $0x10,%esp
}
4000185e:	83 c4 1c             	add    $0x1c,%esp
40001861:	5b                   	pop    %ebx
40001862:	5e                   	pop    %esi
40001863:	5f                   	pop    %edi
40001864:	5d                   	pop    %ebp
40001865:	c3                   	ret
40001866:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000186d:	00 
4000186e:	66 90                	xchg   %ax,%ax
        printf("ERROR in flocktest_test_upgrade: create flockfile failed.\n");
40001870:	83 ec 0c             	sub    $0xc,%esp
40001873:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001877:	8d 83 b0 d8 ff ff    	lea    -0x2750(%ebx),%eax
4000187d:	50                   	push   %eax
4000187e:	e8 6d ea ff ff       	call   400002f0 <printf>
        exit();
40001883:	83 c4 10             	add    $0x10,%esp
}
40001886:	83 c4 1c             	add    $0x1c,%esp
40001889:	5b                   	pop    %ebx
4000188a:	5e                   	pop    %esi
4000188b:	5f                   	pop    %edi
4000188c:	5d                   	pop    %ebp
4000188d:	c3                   	ret
4000188e:	66 90                	xchg   %ax,%ax
            printf("error: write bb %d new file failed\n", i);
40001890:	83 ec 08             	sub    $0x8,%esp
40001893:	55                   	push   %ebp
40001894:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001898:	8d 83 3c d3 ff ff    	lea    -0x2cc4(%ebx),%eax
4000189e:	50                   	push   %eax
4000189f:	e8 4c ea ff ff       	call   400002f0 <printf>
            exit();
400018a4:	83 c4 10             	add    $0x10,%esp
}
400018a7:	83 c4 1c             	add    $0x1c,%esp
400018aa:	5b                   	pop    %ebx
400018ab:	5e                   	pop    %esi
400018ac:	5f                   	pop    %edi
400018ad:	5d                   	pop    %ebp
400018ae:	c3                   	ret
400018af:	90                   	nop
    asm volatile ("int %2"
400018b0:	b8 0d 00 00 00       	mov    $0xd,%eax
400018b5:	b9 04 00 00 00       	mov    $0x4,%ecx
400018ba:	89 f3                	mov    %esi,%ebx
400018bc:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
400018be:	85 c0                	test   %eax,%eax
400018c0:	75 5a                	jne    4000191c <flocktest_test_upgrade+0x1ac>
    asm volatile ("int %2"
400018c2:	b8 05 00 00 00       	mov    $0x5,%eax
400018c7:	89 f3                	mov    %esi,%ebx
400018c9:	cd 30                	int    $0x30
    printf("=====flocktest_test_upgrade ok=====\n\n");
400018cb:	83 ec 0c             	sub    $0xc,%esp
400018ce:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400018d2:	8d 83 78 d9 ff ff    	lea    -0x2688(%ebx),%eax
400018d8:	50                   	push   %eax
400018d9:	e8 12 ea ff ff       	call   400002f0 <printf>
400018de:	83 c4 10             	add    $0x10,%esp
}
400018e1:	83 c4 1c             	add    $0x1c,%esp
400018e4:	5b                   	pop    %ebx
400018e5:	5e                   	pop    %esi
400018e6:	5f                   	pop    %edi
400018e7:	5d                   	pop    %ebp
400018e8:	c3                   	ret
        printf("ERROR in flocktest_test_upgrade: could not acquire shared lock\n");
400018e9:	83 ec 0c             	sub    $0xc,%esp
400018ec:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400018f0:	8d 83 ec d8 ff ff    	lea    -0x2714(%ebx),%eax
        printf("ERROR in flocktest_test_upgrade: could not upgrade to an exclusive lock\n");
400018f6:	50                   	push   %eax
400018f7:	e8 f4 e9 ff ff       	call   400002f0 <printf>
400018fc:	b8 05 00 00 00       	mov    $0x5,%eax
40001901:	89 f3                	mov    %esi,%ebx
40001903:	cd 30                	int    $0x30
        exit();
40001905:	83 c4 10             	add    $0x10,%esp
40001908:	e9 51 ff ff ff       	jmp    4000185e <flocktest_test_upgrade+0xee>
        printf("ERROR in flocktest_test_upgrade: could not upgrade to an exclusive lock\n");
4000190d:	83 ec 0c             	sub    $0xc,%esp
40001910:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001914:	8d 83 2c d9 ff ff    	lea    -0x26d4(%ebx),%eax
4000191a:	eb da                	jmp    400018f6 <flocktest_test_upgrade+0x186>
        printf("ERROR in flocktest_test_upgrade: release exclusive lock failed\n");
4000191c:	83 ec 0c             	sub    $0xc,%esp
4000191f:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001923:	8d 83 a0 d9 ff ff    	lea    -0x2660(%ebx),%eax
40001929:	50                   	push   %eax
4000192a:	e8 c1 e9 ff ff       	call   400002f0 <printf>
        exit();
4000192f:	83 c4 10             	add    $0x10,%esp
40001932:	e9 27 ff ff ff       	jmp    4000185e <flocktest_test_upgrade+0xee>
40001937:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000193e:	00 
4000193f:	90                   	nop

40001940 <flocktest_test_downgrade>:
{
40001940:	55                   	push   %ebp
40001941:	57                   	push   %edi
40001942:	56                   	push   %esi
40001943:	e8 de 02 00 00       	call   40001c26 <__x86.get_pc_thunk.si>
40001948:	81 c6 ac 36 00 00    	add    $0x36ac,%esi
4000194e:	53                   	push   %ebx
4000194f:	83 ec 28             	sub    $0x28,%esp
    printf("=====flocktest_test_downgrade=====\n");
40001952:	8d 86 e0 d9 ff ff    	lea    -0x2620(%esi),%eax
40001958:	89 74 24 14          	mov    %esi,0x14(%esp)
4000195c:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000195e:	8d be 48 d0 ff ff    	lea    -0x2fb8(%esi),%edi
40001964:	50                   	push   %eax
40001965:	e8 86 e9 ff ff       	call   400002f0 <printf>
4000196a:	89 3c 24             	mov    %edi,(%esp)
4000196d:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
40001971:	e8 da f1 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
40001976:	b9 02 02 00 00       	mov    $0x202,%ecx
4000197b:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000197d:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001980:	b8 04 00 00 00       	mov    $0x4,%eax
40001985:	cd 30                	int    $0x30
    return errno ? -1 : fd;
40001987:	83 c4 10             	add    $0x10,%esp
    if ((fd = open("flockfile", O_CREATE | O_RDWR))< 0) {
4000198a:	85 c0                	test   %eax,%eax
4000198c:	75 7a                	jne    40001a08 <flocktest_test_downgrade+0xc8>
4000198e:	89 dd                	mov    %ebx,%ebp
40001990:	85 db                	test   %ebx,%ebx
40001992:	78 74                	js     40001a08 <flocktest_test_downgrade+0xc8>
    asm volatile ("int %2"
40001994:	b8 0d 00 00 00       	mov    $0xd,%eax
40001999:	b9 02 00 00 00       	mov    $0x2,%ecx
4000199e:	cd 30                	int    $0x30
400019a0:	89 c7                	mov    %eax,%edi
    return errno ? -1 : 0;; // errno ? -1 : 0; 
400019a2:	85 c0                	test   %eax,%eax
400019a4:	0f 85 09 02 00 00    	jne    40001bb3 <flocktest_test_downgrade+0x273>
400019aa:	8b 44 24 08          	mov    0x8(%esp),%eax
    asm volatile ("int %2"
400019ae:	be 07 00 00 00       	mov    $0x7,%esi
400019b3:	ba 0a 00 00 00       	mov    $0xa,%edx
400019b8:	8d 88 c1 d0 ff ff    	lea    -0x2f3f(%eax),%ecx
400019be:	eb 1c                	jmp    400019dc <flocktest_test_downgrade+0x9c>
        if (write(fd, "jjjjjjjjjj", 10) != 10) {
400019c0:	83 fb 0a             	cmp    $0xa,%ebx
400019c3:	75 21                	jne    400019e6 <flocktest_test_downgrade+0xa6>
400019c5:	89 f0                	mov    %esi,%eax
400019c7:	89 eb                	mov    %ebp,%ebx
400019c9:	cd 30                	int    $0x30
        if (write(fd, "jjjjjjjjjj", 10) != 10) {
400019cb:	83 fb 0a             	cmp    $0xa,%ebx
400019ce:	75 16                	jne    400019e6 <flocktest_test_downgrade+0xa6>
400019d0:	85 c0                	test   %eax,%eax
400019d2:	75 12                	jne    400019e6 <flocktest_test_downgrade+0xa6>
    for (int i = 0; i < 100; i++) {
400019d4:	83 c7 01             	add    $0x1,%edi
400019d7:	83 ff 64             	cmp    $0x64,%edi
400019da:	74 4a                	je     40001a26 <flocktest_test_downgrade+0xe6>
400019dc:	89 f0                	mov    %esi,%eax
400019de:	89 eb                	mov    %ebp,%ebx
400019e0:	cd 30                	int    $0x30
        if (write(fd, "jjjjjjjjjj", 10) != 10) {
400019e2:	85 c0                	test   %eax,%eax
400019e4:	74 da                	je     400019c0 <flocktest_test_downgrade+0x80>
            printf("error: write aa %d new file failed\n", i);
400019e6:	83 ec 08             	sub    $0x8,%esp
400019e9:	57                   	push   %edi
400019ea:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400019ee:	8d 83 18 d3 ff ff    	lea    -0x2ce8(%ebx),%eax
400019f4:	50                   	push   %eax
400019f5:	e8 f6 e8 ff ff       	call   400002f0 <printf>
            exit();
400019fa:	83 c4 10             	add    $0x10,%esp
}
400019fd:	83 c4 1c             	add    $0x1c,%esp
40001a00:	5b                   	pop    %ebx
40001a01:	5e                   	pop    %esi
40001a02:	5f                   	pop    %edi
40001a03:	5d                   	pop    %ebp
40001a04:	c3                   	ret
40001a05:	8d 76 00             	lea    0x0(%esi),%esi
        printf("ERROR in flocktest_test_downgrade: create flockfile failed.\n");
40001a08:	83 ec 0c             	sub    $0xc,%esp
40001a0b:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001a0f:	8d 83 04 da ff ff    	lea    -0x25fc(%ebx),%eax
40001a15:	50                   	push   %eax
40001a16:	e8 d5 e8 ff ff       	call   400002f0 <printf>
        exit();
40001a1b:	83 c4 10             	add    $0x10,%esp
}
40001a1e:	83 c4 1c             	add    $0x1c,%esp
40001a21:	5b                   	pop    %ebx
40001a22:	5e                   	pop    %esi
40001a23:	5f                   	pop    %edi
40001a24:	5d                   	pop    %ebp
40001a25:	c3                   	ret
    asm volatile ("int %2"
40001a26:	be 0d 00 00 00       	mov    $0xd,%esi
40001a2b:	bf 04 00 00 00       	mov    $0x4,%edi
40001a30:	89 eb                	mov    %ebp,%ebx
40001a32:	89 f0                	mov    %esi,%eax
40001a34:	89 f9                	mov    %edi,%ecx
40001a36:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001a38:	85 c0                	test   %eax,%eax
40001a3a:	0f 85 97 01 00 00    	jne    40001bd7 <flocktest_test_downgrade+0x297>
    asm volatile ("int %2"
40001a40:	b8 05 00 00 00       	mov    $0x5,%eax
40001a45:	89 eb                	mov    %ebp,%ebx
40001a47:	cd 30                	int    $0x30
    int len = strlen(path) + 1;
40001a49:	83 ec 0c             	sub    $0xc,%esp
40001a4c:	8b 6c 24 18          	mov    0x18(%esp),%ebp
40001a50:	55                   	push   %ebp
40001a51:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001a55:	e8 f6 f0 ff ff       	call   40000b50 <strlen>
    asm volatile ("int %2"
40001a5a:	b9 02 00 00 00       	mov    $0x2,%ecx
40001a5f:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
40001a61:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001a64:	89 f8                	mov    %edi,%eax
40001a66:	cd 30                	int    $0x30
40001a68:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    if ((fd = open("flockfile", O_RDWR)) < 0) {
40001a6c:	83 c4 10             	add    $0x10,%esp
40001a6f:	85 db                	test   %ebx,%ebx
40001a71:	0f 88 21 01 00 00    	js     40001b98 <flocktest_test_downgrade+0x258>
40001a77:	85 c0                	test   %eax,%eax
40001a79:	0f 85 19 01 00 00    	jne    40001b98 <flocktest_test_downgrade+0x258>
    asm volatile ("int %2"
40001a7f:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001a83:	89 f0                	mov    %esi,%eax
40001a85:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001a87:	85 c0                	test   %eax,%eax
40001a89:	0f 85 73 01 00 00    	jne    40001c02 <flocktest_test_downgrade+0x2c2>
    asm volatile ("int %2"
40001a8f:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001a93:	b9 01 00 00 00       	mov    $0x1,%ecx
40001a98:	89 f0                	mov    %esi,%eax
40001a9a:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001a9c:	85 c0                	test   %eax,%eax
40001a9e:	0f 85 4c 01 00 00    	jne    40001bf0 <flocktest_test_downgrade+0x2b0>
    asm volatile ("int %2"
40001aa4:	8b 44 24 08          	mov    0x8(%esp),%eax
40001aa8:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001aac:	ba 64 00 00 00       	mov    $0x64,%edx
40001ab1:	8d a8 0c 00 00 00    	lea    0xc(%eax),%ebp
40001ab7:	b8 06 00 00 00       	mov    $0x6,%eax
40001abc:	89 e9                	mov    %ebp,%ecx
40001abe:	cd 30                	int    $0x30
    return errno ? -1 : ret;
40001ac0:	85 c0                	test   %eax,%eax
40001ac2:	0f 85 1e 01 00 00    	jne    40001be6 <flocktest_test_downgrade+0x2a6>
40001ac8:	89 df                	mov    %ebx,%edi
    if (i != 100) {
40001aca:	83 fb 64             	cmp    $0x64,%ebx
40001acd:	74 35                	je     40001b04 <flocktest_test_downgrade+0x1c4>
        printf("ERROR in flocktest_test_downgrade: did not read 100 characters from flockfile!\n");
40001acf:	83 ec 0c             	sub    $0xc,%esp
40001ad2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001ad6:	8d 83 44 db ff ff    	lea    -0x24bc(%ebx),%eax
40001adc:	50                   	push   %eax
40001add:	e8 0e e8 ff ff       	call   400002f0 <printf>
        printf("ERROR: %d\n", i);
40001ae2:	58                   	pop    %eax
40001ae3:	5a                   	pop    %edx
40001ae4:	57                   	push   %edi
40001ae5:	8d 83 cc d0 ff ff    	lea    -0x2f34(%ebx),%eax
        printf("ERROR in flocktest_test_downgrade: release shared flock failed!\n");
40001aeb:	50                   	push   %eax
40001aec:	e8 ff e7 ff ff       	call   400002f0 <printf>
    asm volatile ("int %2"
40001af1:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40001af5:	b8 05 00 00 00       	mov    $0x5,%eax
40001afa:	cd 30                	int    $0x30
        exit();
40001afc:	83 c4 10             	add    $0x10,%esp
40001aff:	e9 f9 fe ff ff       	jmp    400019fd <flocktest_test_downgrade+0xbd>
    printf("Read from flockfile: ");
40001b04:	83 ec 0c             	sub    $0xc,%esp
40001b07:	8d 7d 64             	lea    0x64(%ebp),%edi
40001b0a:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001b0e:	8d 83 d7 d0 ff ff    	lea    -0x2f29(%ebx),%eax
40001b14:	8d b3 ed d0 ff ff    	lea    -0x2f13(%ebx),%esi
40001b1a:	50                   	push   %eax
40001b1b:	e8 d0 e7 ff ff       	call   400002f0 <printf>
    for (int k = 0; k < 100; k++) {
40001b20:	83 c4 10             	add    $0x10,%esp
40001b23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("%c", buf[k]);
40001b28:	0f be 45 00          	movsbl 0x0(%ebp),%eax
40001b2c:	83 ec 08             	sub    $0x8,%esp
    for (int k = 0; k < 100; k++) {
40001b2f:	83 c5 01             	add    $0x1,%ebp
        printf("%c", buf[k]);
40001b32:	50                   	push   %eax
40001b33:	56                   	push   %esi
40001b34:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40001b38:	e8 b3 e7 ff ff       	call   400002f0 <printf>
    for (int k = 0; k < 100; k++) {
40001b3d:	83 c4 10             	add    $0x10,%esp
40001b40:	39 fd                	cmp    %edi,%ebp
40001b42:	75 e4                	jne    40001b28 <flocktest_test_downgrade+0x1e8>
    printf("\n");
40001b44:	83 ec 0c             	sub    $0xc,%esp
40001b47:	8b 74 24 14          	mov    0x14(%esp),%esi
40001b4b:	8d 86 08 d1 ff ff    	lea    -0x2ef8(%esi),%eax
40001b51:	89 f3                	mov    %esi,%ebx
40001b53:	50                   	push   %eax
40001b54:	e8 97 e7 ff ff       	call   400002f0 <printf>
    asm volatile ("int %2"
40001b59:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40001b5d:	b8 0d 00 00 00       	mov    $0xd,%eax
40001b62:	b9 04 00 00 00       	mov    $0x4,%ecx
40001b67:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40001b69:	83 c4 10             	add    $0x10,%esp
40001b6c:	85 c0                	test   %eax,%eax
40001b6e:	0f 85 a0 00 00 00    	jne    40001c14 <flocktest_test_downgrade+0x2d4>
    asm volatile ("int %2"
40001b74:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001b78:	b8 05 00 00 00       	mov    $0x5,%eax
40001b7d:	cd 30                	int    $0x30
    printf("=====flocktest_test_downgrade ok=====\n\n"); 
40001b7f:	83 ec 0c             	sub    $0xc,%esp
40001b82:	8d 86 94 db ff ff    	lea    -0x246c(%esi),%eax
40001b88:	89 f3                	mov    %esi,%ebx
40001b8a:	50                   	push   %eax
40001b8b:	e8 60 e7 ff ff       	call   400002f0 <printf>
40001b90:	83 c4 10             	add    $0x10,%esp
40001b93:	e9 65 fe ff ff       	jmp    400019fd <flocktest_test_downgrade+0xbd>
        printf("ERROR in flocktest_test_downgrade: open flockfile failed.\n");
40001b98:	83 ec 0c             	sub    $0xc,%esp
40001b9b:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001b9f:	8d 83 c0 da ff ff    	lea    -0x2540(%ebx),%eax
40001ba5:	50                   	push   %eax
40001ba6:	e8 45 e7 ff ff       	call   400002f0 <printf>
        exit();
40001bab:	83 c4 10             	add    $0x10,%esp
40001bae:	e9 4a fe ff ff       	jmp    400019fd <flocktest_test_downgrade+0xbd>
        printf("ERROR in flocktest_test_downgrade: could not obtain an exclusive lock\n");
40001bb3:	83 ec 0c             	sub    $0xc,%esp
40001bb6:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001bba:	8d 83 44 da ff ff    	lea    -0x25bc(%ebx),%eax
        printf("ERROR in flockreader: release shared flock failed!\n");
40001bc0:	50                   	push   %eax
40001bc1:	e8 2a e7 ff ff       	call   400002f0 <printf>
40001bc6:	b8 05 00 00 00       	mov    $0x5,%eax
40001bcb:	89 eb                	mov    %ebp,%ebx
40001bcd:	cd 30                	int    $0x30
        exit();
40001bcf:	83 c4 10             	add    $0x10,%esp
40001bd2:	e9 26 fe ff ff       	jmp    400019fd <flocktest_test_downgrade+0xbd>
        printf("ERROR in flockreader: release shared flock failed!\n");
40001bd7:	83 ec 0c             	sub    $0xc,%esp
40001bda:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001bde:	8d 83 8c da ff ff    	lea    -0x2574(%ebx),%eax
40001be4:	eb da                	jmp    40001bc0 <flocktest_test_downgrade+0x280>
    return errno ? -1 : ret;
40001be6:	bf ff ff ff ff       	mov    $0xffffffff,%edi
40001beb:	e9 df fe ff ff       	jmp    40001acf <flocktest_test_downgrade+0x18f>
        printf("ERROR in flocktest_test_downgrade: could not downgrade to shared lock\n");
40001bf0:	83 ec 0c             	sub    $0xc,%esp
40001bf3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001bf7:	8d 83 fc da ff ff    	lea    -0x2504(%ebx),%eax
40001bfd:	e9 e9 fe ff ff       	jmp    40001aeb <flocktest_test_downgrade+0x1ab>
        printf("ERROR in flocktest_test_downgrade: could not obtain an exclusive lock\n");
40001c02:	83 ec 0c             	sub    $0xc,%esp
40001c05:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001c09:	8d 83 44 da ff ff    	lea    -0x25bc(%ebx),%eax
40001c0f:	e9 d7 fe ff ff       	jmp    40001aeb <flocktest_test_downgrade+0x1ab>
        printf("ERROR in flocktest_test_downgrade: release shared flock failed!\n");
40001c14:	83 ec 0c             	sub    $0xc,%esp
40001c17:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001c1b:	8d 83 bc db ff ff    	lea    -0x2444(%ebx),%eax
40001c21:	e9 c5 fe ff ff       	jmp    40001aeb <flocktest_test_downgrade+0x1ab>

40001c26 <__x86.get_pc_thunk.si>:
40001c26:	8b 34 24             	mov    (%esp),%esi
40001c29:	c3                   	ret

40001c2a <__x86.get_pc_thunk.di>:
40001c2a:	8b 3c 24             	mov    (%esp),%edi
40001c2d:	c3                   	ret
40001c2e:	66 90                	xchg   %ax,%ax

40001c30 <__udivdi3>:
40001c30:	f3 0f 1e fb          	endbr32
40001c34:	55                   	push   %ebp
40001c35:	57                   	push   %edi
40001c36:	56                   	push   %esi
40001c37:	53                   	push   %ebx
40001c38:	83 ec 1c             	sub    $0x1c,%esp
40001c3b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40001c3f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
40001c43:	8b 74 24 34          	mov    0x34(%esp),%esi
40001c47:	8b 5c 24 38          	mov    0x38(%esp),%ebx
40001c4b:	85 c0                	test   %eax,%eax
40001c4d:	75 19                	jne    40001c68 <__udivdi3+0x38>
40001c4f:	39 de                	cmp    %ebx,%esi
40001c51:	73 4d                	jae    40001ca0 <__udivdi3+0x70>
40001c53:	31 ff                	xor    %edi,%edi
40001c55:	89 e8                	mov    %ebp,%eax
40001c57:	89 f2                	mov    %esi,%edx
40001c59:	f7 f3                	div    %ebx
40001c5b:	89 fa                	mov    %edi,%edx
40001c5d:	83 c4 1c             	add    $0x1c,%esp
40001c60:	5b                   	pop    %ebx
40001c61:	5e                   	pop    %esi
40001c62:	5f                   	pop    %edi
40001c63:	5d                   	pop    %ebp
40001c64:	c3                   	ret
40001c65:	8d 76 00             	lea    0x0(%esi),%esi
40001c68:	39 c6                	cmp    %eax,%esi
40001c6a:	73 14                	jae    40001c80 <__udivdi3+0x50>
40001c6c:	31 ff                	xor    %edi,%edi
40001c6e:	31 c0                	xor    %eax,%eax
40001c70:	89 fa                	mov    %edi,%edx
40001c72:	83 c4 1c             	add    $0x1c,%esp
40001c75:	5b                   	pop    %ebx
40001c76:	5e                   	pop    %esi
40001c77:	5f                   	pop    %edi
40001c78:	5d                   	pop    %ebp
40001c79:	c3                   	ret
40001c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001c80:	0f bd f8             	bsr    %eax,%edi
40001c83:	83 f7 1f             	xor    $0x1f,%edi
40001c86:	75 48                	jne    40001cd0 <__udivdi3+0xa0>
40001c88:	39 f0                	cmp    %esi,%eax
40001c8a:	72 06                	jb     40001c92 <__udivdi3+0x62>
40001c8c:	31 c0                	xor    %eax,%eax
40001c8e:	39 dd                	cmp    %ebx,%ebp
40001c90:	72 de                	jb     40001c70 <__udivdi3+0x40>
40001c92:	b8 01 00 00 00       	mov    $0x1,%eax
40001c97:	eb d7                	jmp    40001c70 <__udivdi3+0x40>
40001c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001ca0:	89 d9                	mov    %ebx,%ecx
40001ca2:	85 db                	test   %ebx,%ebx
40001ca4:	75 0b                	jne    40001cb1 <__udivdi3+0x81>
40001ca6:	b8 01 00 00 00       	mov    $0x1,%eax
40001cab:	31 d2                	xor    %edx,%edx
40001cad:	f7 f3                	div    %ebx
40001caf:	89 c1                	mov    %eax,%ecx
40001cb1:	31 d2                	xor    %edx,%edx
40001cb3:	89 f0                	mov    %esi,%eax
40001cb5:	f7 f1                	div    %ecx
40001cb7:	89 c6                	mov    %eax,%esi
40001cb9:	89 e8                	mov    %ebp,%eax
40001cbb:	89 f7                	mov    %esi,%edi
40001cbd:	f7 f1                	div    %ecx
40001cbf:	89 fa                	mov    %edi,%edx
40001cc1:	83 c4 1c             	add    $0x1c,%esp
40001cc4:	5b                   	pop    %ebx
40001cc5:	5e                   	pop    %esi
40001cc6:	5f                   	pop    %edi
40001cc7:	5d                   	pop    %ebp
40001cc8:	c3                   	ret
40001cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001cd0:	89 f9                	mov    %edi,%ecx
40001cd2:	ba 20 00 00 00       	mov    $0x20,%edx
40001cd7:	29 fa                	sub    %edi,%edx
40001cd9:	d3 e0                	shl    %cl,%eax
40001cdb:	89 44 24 08          	mov    %eax,0x8(%esp)
40001cdf:	89 d1                	mov    %edx,%ecx
40001ce1:	89 d8                	mov    %ebx,%eax
40001ce3:	d3 e8                	shr    %cl,%eax
40001ce5:	89 c1                	mov    %eax,%ecx
40001ce7:	8b 44 24 08          	mov    0x8(%esp),%eax
40001ceb:	09 c1                	or     %eax,%ecx
40001ced:	89 f0                	mov    %esi,%eax
40001cef:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40001cf3:	89 f9                	mov    %edi,%ecx
40001cf5:	d3 e3                	shl    %cl,%ebx
40001cf7:	89 d1                	mov    %edx,%ecx
40001cf9:	d3 e8                	shr    %cl,%eax
40001cfb:	89 f9                	mov    %edi,%ecx
40001cfd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40001d01:	89 eb                	mov    %ebp,%ebx
40001d03:	d3 e6                	shl    %cl,%esi
40001d05:	89 d1                	mov    %edx,%ecx
40001d07:	d3 eb                	shr    %cl,%ebx
40001d09:	09 f3                	or     %esi,%ebx
40001d0b:	89 c6                	mov    %eax,%esi
40001d0d:	89 f2                	mov    %esi,%edx
40001d0f:	89 d8                	mov    %ebx,%eax
40001d11:	f7 74 24 08          	divl   0x8(%esp)
40001d15:	89 d6                	mov    %edx,%esi
40001d17:	89 c3                	mov    %eax,%ebx
40001d19:	f7 64 24 0c          	mull   0xc(%esp)
40001d1d:	39 d6                	cmp    %edx,%esi
40001d1f:	72 1f                	jb     40001d40 <__udivdi3+0x110>
40001d21:	89 f9                	mov    %edi,%ecx
40001d23:	d3 e5                	shl    %cl,%ebp
40001d25:	39 c5                	cmp    %eax,%ebp
40001d27:	73 04                	jae    40001d2d <__udivdi3+0xfd>
40001d29:	39 d6                	cmp    %edx,%esi
40001d2b:	74 13                	je     40001d40 <__udivdi3+0x110>
40001d2d:	89 d8                	mov    %ebx,%eax
40001d2f:	31 ff                	xor    %edi,%edi
40001d31:	e9 3a ff ff ff       	jmp    40001c70 <__udivdi3+0x40>
40001d36:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001d3d:	00 
40001d3e:	66 90                	xchg   %ax,%ax
40001d40:	8d 43 ff             	lea    -0x1(%ebx),%eax
40001d43:	31 ff                	xor    %edi,%edi
40001d45:	e9 26 ff ff ff       	jmp    40001c70 <__udivdi3+0x40>
40001d4a:	66 90                	xchg   %ax,%ax
40001d4c:	66 90                	xchg   %ax,%ax
40001d4e:	66 90                	xchg   %ax,%ax

40001d50 <__umoddi3>:
40001d50:	f3 0f 1e fb          	endbr32
40001d54:	55                   	push   %ebp
40001d55:	57                   	push   %edi
40001d56:	56                   	push   %esi
40001d57:	53                   	push   %ebx
40001d58:	83 ec 1c             	sub    $0x1c,%esp
40001d5b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
40001d5f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40001d63:	8b 74 24 30          	mov    0x30(%esp),%esi
40001d67:	8b 7c 24 38          	mov    0x38(%esp),%edi
40001d6b:	89 da                	mov    %ebx,%edx
40001d6d:	85 c0                	test   %eax,%eax
40001d6f:	75 17                	jne    40001d88 <__umoddi3+0x38>
40001d71:	39 fb                	cmp    %edi,%ebx
40001d73:	73 53                	jae    40001dc8 <__umoddi3+0x78>
40001d75:	89 f0                	mov    %esi,%eax
40001d77:	f7 f7                	div    %edi
40001d79:	89 d0                	mov    %edx,%eax
40001d7b:	31 d2                	xor    %edx,%edx
40001d7d:	83 c4 1c             	add    $0x1c,%esp
40001d80:	5b                   	pop    %ebx
40001d81:	5e                   	pop    %esi
40001d82:	5f                   	pop    %edi
40001d83:	5d                   	pop    %ebp
40001d84:	c3                   	ret
40001d85:	8d 76 00             	lea    0x0(%esi),%esi
40001d88:	89 f1                	mov    %esi,%ecx
40001d8a:	39 c3                	cmp    %eax,%ebx
40001d8c:	73 12                	jae    40001da0 <__umoddi3+0x50>
40001d8e:	89 f0                	mov    %esi,%eax
40001d90:	83 c4 1c             	add    $0x1c,%esp
40001d93:	5b                   	pop    %ebx
40001d94:	5e                   	pop    %esi
40001d95:	5f                   	pop    %edi
40001d96:	5d                   	pop    %ebp
40001d97:	c3                   	ret
40001d98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001d9f:	00 
40001da0:	0f bd e8             	bsr    %eax,%ebp
40001da3:	83 f5 1f             	xor    $0x1f,%ebp
40001da6:	75 48                	jne    40001df0 <__umoddi3+0xa0>
40001da8:	39 d8                	cmp    %ebx,%eax
40001daa:	0f 82 d0 00 00 00    	jb     40001e80 <__umoddi3+0x130>
40001db0:	39 fe                	cmp    %edi,%esi
40001db2:	0f 83 c8 00 00 00    	jae    40001e80 <__umoddi3+0x130>
40001db8:	89 c8                	mov    %ecx,%eax
40001dba:	83 c4 1c             	add    $0x1c,%esp
40001dbd:	5b                   	pop    %ebx
40001dbe:	5e                   	pop    %esi
40001dbf:	5f                   	pop    %edi
40001dc0:	5d                   	pop    %ebp
40001dc1:	c3                   	ret
40001dc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001dc8:	89 f9                	mov    %edi,%ecx
40001dca:	85 ff                	test   %edi,%edi
40001dcc:	75 0b                	jne    40001dd9 <__umoddi3+0x89>
40001dce:	b8 01 00 00 00       	mov    $0x1,%eax
40001dd3:	31 d2                	xor    %edx,%edx
40001dd5:	f7 f7                	div    %edi
40001dd7:	89 c1                	mov    %eax,%ecx
40001dd9:	89 d8                	mov    %ebx,%eax
40001ddb:	31 d2                	xor    %edx,%edx
40001ddd:	f7 f1                	div    %ecx
40001ddf:	89 f0                	mov    %esi,%eax
40001de1:	f7 f1                	div    %ecx
40001de3:	89 d0                	mov    %edx,%eax
40001de5:	31 d2                	xor    %edx,%edx
40001de7:	eb 94                	jmp    40001d7d <__umoddi3+0x2d>
40001de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001df0:	89 e9                	mov    %ebp,%ecx
40001df2:	ba 20 00 00 00       	mov    $0x20,%edx
40001df7:	29 ea                	sub    %ebp,%edx
40001df9:	d3 e0                	shl    %cl,%eax
40001dfb:	89 44 24 08          	mov    %eax,0x8(%esp)
40001dff:	89 d1                	mov    %edx,%ecx
40001e01:	89 f8                	mov    %edi,%eax
40001e03:	d3 e8                	shr    %cl,%eax
40001e05:	89 54 24 04          	mov    %edx,0x4(%esp)
40001e09:	8b 54 24 04          	mov    0x4(%esp),%edx
40001e0d:	89 c1                	mov    %eax,%ecx
40001e0f:	8b 44 24 08          	mov    0x8(%esp),%eax
40001e13:	09 c1                	or     %eax,%ecx
40001e15:	89 d8                	mov    %ebx,%eax
40001e17:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40001e1b:	89 e9                	mov    %ebp,%ecx
40001e1d:	d3 e7                	shl    %cl,%edi
40001e1f:	89 d1                	mov    %edx,%ecx
40001e21:	d3 e8                	shr    %cl,%eax
40001e23:	89 e9                	mov    %ebp,%ecx
40001e25:	89 7c 24 0c          	mov    %edi,0xc(%esp)
40001e29:	d3 e3                	shl    %cl,%ebx
40001e2b:	89 c7                	mov    %eax,%edi
40001e2d:	89 d1                	mov    %edx,%ecx
40001e2f:	89 f0                	mov    %esi,%eax
40001e31:	d3 e8                	shr    %cl,%eax
40001e33:	89 fa                	mov    %edi,%edx
40001e35:	89 e9                	mov    %ebp,%ecx
40001e37:	09 d8                	or     %ebx,%eax
40001e39:	d3 e6                	shl    %cl,%esi
40001e3b:	f7 74 24 08          	divl   0x8(%esp)
40001e3f:	89 d3                	mov    %edx,%ebx
40001e41:	f7 64 24 0c          	mull   0xc(%esp)
40001e45:	89 c7                	mov    %eax,%edi
40001e47:	89 d1                	mov    %edx,%ecx
40001e49:	39 d3                	cmp    %edx,%ebx
40001e4b:	72 06                	jb     40001e53 <__umoddi3+0x103>
40001e4d:	75 10                	jne    40001e5f <__umoddi3+0x10f>
40001e4f:	39 c6                	cmp    %eax,%esi
40001e51:	73 0c                	jae    40001e5f <__umoddi3+0x10f>
40001e53:	2b 44 24 0c          	sub    0xc(%esp),%eax
40001e57:	1b 54 24 08          	sbb    0x8(%esp),%edx
40001e5b:	89 d1                	mov    %edx,%ecx
40001e5d:	89 c7                	mov    %eax,%edi
40001e5f:	89 f2                	mov    %esi,%edx
40001e61:	29 fa                	sub    %edi,%edx
40001e63:	19 cb                	sbb    %ecx,%ebx
40001e65:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
40001e6a:	89 d8                	mov    %ebx,%eax
40001e6c:	d3 e0                	shl    %cl,%eax
40001e6e:	89 e9                	mov    %ebp,%ecx
40001e70:	d3 ea                	shr    %cl,%edx
40001e72:	d3 eb                	shr    %cl,%ebx
40001e74:	09 d0                	or     %edx,%eax
40001e76:	89 da                	mov    %ebx,%edx
40001e78:	83 c4 1c             	add    $0x1c,%esp
40001e7b:	5b                   	pop    %ebx
40001e7c:	5e                   	pop    %esi
40001e7d:	5f                   	pop    %edi
40001e7e:	5d                   	pop    %ebp
40001e7f:	c3                   	ret
40001e80:	89 da                	mov    %ebx,%edx
40001e82:	89 f1                	mov    %esi,%ecx
40001e84:	29 f9                	sub    %edi,%ecx
40001e86:	19 c2                	sbb    %eax,%edx
40001e88:	89 c8                	mov    %ecx,%eax
40001e8a:	e9 2b ff ff ff       	jmp    40001dba <__umoddi3+0x6a>
