
obj/user/shell/shell:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:

    return E_INVAL_CMD;
}

int main(int argc, char *argv[])
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	57                   	push   %edi
4000000e:	e8 a3 13 00 00       	call   400013b6 <__x86.get_pc_thunk.di>
40000013:	81 c7 e1 6f 00 00    	add    $0x6fe1,%edi
40000019:	56                   	push   %esi
4000001a:	53                   	push   %ebx
4000001b:	51                   	push   %ecx
4000001c:	81 ec a4 00 00 00    	sub    $0xa4,%esp

static gcc_inline int sys_open(char *path, int omode)
{
    int errno;
    int fd;
    int len = strlen(path) + 1;
40000022:	8d b7 e8 d3 ff ff    	lea    -0x2c18(%edi),%esi
40000028:	89 fb                	mov    %edi,%ebx
4000002a:	89 bd 74 ff ff ff    	mov    %edi,-0x8c(%ebp)
40000030:	56                   	push   %esi
40000031:	e8 2a 0c 00 00       	call   40000c60 <strlen>

    asm volatile ("int %2"
40000036:	31 c9                	xor    %ecx,%ecx
40000038:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000003a:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000003d:	b8 04 00 00 00       	mov    $0x4,%eax
40000042:	cd 30                	int    $0x30
                    "b" (path),
                    "c" (omode),
                    "d" (len)
                  : "cc", "memory");

    return errno ? -1 : fd;
40000044:	83 c4 10             	add    $0x10,%esp
40000047:	85 c0                	test   %eax,%eax
40000049:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
4000004e:	0f 45 d8             	cmovne %eax,%ebx
    asm volatile ("int %2"
40000051:	b8 05 00 00 00       	mov    $0x5,%eax
40000056:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40000058:	85 c0                	test   %eax,%eax
4000005a:	0f 85 16 01 00 00    	jne    40000176 <main+0x176>
40000060:	8d 87 48 d0 ff ff    	lea    -0x2fb8(%edi),%eax
40000066:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
4000006c:	8d 87 63 d0 ff ff    	lea    -0x2f9d(%edi),%eax
40000072:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
40000078:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
4000007e:	8d 75 84             	lea    -0x7c(%ebp),%esi
    asm volatile ("int %2"
40000081:	bf 64 00 00 00       	mov    $0x64,%edi
40000086:	8d 90 76 d0 ff ff    	lea    -0x2f8a(%eax),%edx
4000008c:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
40000092:	8d 90 e4 ff ff ff    	lea    -0x1c(%eax),%edx
40000098:	89 95 70 ff ff ff    	mov    %edx,-0x90(%ebp)
4000009e:	8d 90 84 d0 ff ff    	lea    -0x2f7c(%eax),%edx
400000a4:	8d 80 90 d0 ff ff    	lea    -0x2f70(%eax),%eax
400000aa:	89 95 58 ff ff ff    	mov    %edx,-0xa8(%ebp)
400000b0:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
400000b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400000bd:	00 
400000be:	66 90                	xchg   %ax,%ax
400000c0:	b8 01 00 00 00       	mov    $0x1,%eax
400000c5:	89 f3                	mov    %esi,%ebx
400000c7:	89 f9                	mov    %edi,%ecx
400000c9:	cd 30                	int    $0x30

    ASSERT(close(open(".", O_RDONLY)) != -1);

    while (1) {
        readline(line, CMDLEN);
        if ((ret = process_cmd(line)) != 0) {
400000cb:	89 f0                	mov    %esi,%eax
400000cd:	e8 5e 10 00 00       	call   40001130 <process_cmd>
400000d2:	85 c0                	test   %eax,%eax
400000d4:	74 ea                	je     400000c0 <main+0xc0>
    ASSERT(err < NERRORS);
400000d6:	83 f8 06             	cmp    $0x6,%eax
400000d9:	77 2d                	ja     40000108 <main+0x108>
    const char *str = errstrs[err];
400000db:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
400000e1:	8b 04 82             	mov    (%edx,%eax,4),%eax
    ASSERT(str != NULL);
400000e4:	85 c0                	test   %eax,%eax
400000e6:	74 5b                	je     40000143 <main+0x143>
    printf("Error: %s.\n", str);
400000e8:	83 ec 08             	sub    $0x8,%esp
400000eb:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
400000f1:	50                   	push   %eax
400000f2:	ff b5 6c ff ff ff    	push   -0x94(%ebp)
400000f8:	e8 03 03 00 00       	call   40000400 <printf>
}
400000fd:	83 c4 10             	add    $0x10,%esp
40000100:	eb be                	jmp    400000c0 <main+0xc0>
40000102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ASSERT(err < NERRORS);
40000108:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
4000010e:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
40000114:	ff b5 64 ff ff ff    	push   -0x9c(%ebp)
4000011a:	6a 25                	push   $0x25
4000011c:	ff b5 60 ff ff ff    	push   -0xa0(%ebp)
40000122:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
40000128:	e8 23 01 00 00       	call   40000250 <panic>
4000012d:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    const char *str = errstrs[err];
40000133:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
    ASSERT(err < NERRORS);
40000139:	83 c4 10             	add    $0x10,%esp
    const char *str = errstrs[err];
4000013c:	8b 04 82             	mov    (%edx,%eax,4),%eax
    ASSERT(str != NULL);
4000013f:	85 c0                	test   %eax,%eax
40000141:	75 a5                	jne    400000e8 <main+0xe8>
40000143:	ff b5 58 ff ff ff    	push   -0xa8(%ebp)
40000149:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
4000014f:	ff b5 64 ff ff ff    	push   -0x9c(%ebp)
40000155:	6a 27                	push   $0x27
40000157:	ff b5 60 ff ff ff    	push   -0xa0(%ebp)
4000015d:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
40000163:	e8 e8 00 00 00       	call   40000250 <panic>
40000168:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
4000016e:	83 c4 10             	add    $0x10,%esp
40000171:	e9 72 ff ff ff       	jmp    400000e8 <main+0xe8>
    ASSERT(close(open(".", O_RDONLY)) != -1);
40000176:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
4000017c:	8d 83 f0 d5 ff ff    	lea    -0x2a10(%ebx),%eax
40000182:	50                   	push   %eax
40000183:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40000189:	50                   	push   %eax
4000018a:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
40000190:	8d 83 63 d0 ff ff    	lea    -0x2f9d(%ebx),%eax
40000196:	68 90 00 00 00       	push   $0x90
4000019b:	50                   	push   %eax
4000019c:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
400001a2:	e8 a9 00 00 00       	call   40000250 <panic>
400001a7:	83 c4 10             	add    $0x10,%esp
400001aa:	e9 c9 fe ff ff       	jmp    40000078 <main+0x78>

400001af <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
400001af:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
400001b5:	75 04                	jne    400001bb <args_exist>

400001b7 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
400001b7:	6a 00                	push   $0x0
	pushl	$0
400001b9:	6a 00                	push   $0x0

400001bb <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
400001bb:	e8 40 fe ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
400001c0:	50                   	push   %eax

400001c1 <spin>:
spin:
	jmp	spin
400001c1:	eb fe                	jmp    400001c1 <spin>
400001c3:	66 90                	xchg   %ax,%ax
400001c5:	66 90                	xchg   %ax,%ax
400001c7:	66 90                	xchg   %ax,%ax
400001c9:	66 90                	xchg   %ax,%ax
400001cb:	66 90                	xchg   %ax,%ax
400001cd:	66 90                	xchg   %ax,%ax
400001cf:	90                   	nop

400001d0 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
400001d0:	53                   	push   %ebx
400001d1:	e8 c1 00 00 00       	call   40000297 <__x86.get_pc_thunk.bx>
400001d6:	81 c3 1e 6e 00 00    	add    $0x6e1e,%ebx
400001dc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
400001df:	ff 74 24 18          	push   0x18(%esp)
400001e3:	ff 74 24 18          	push   0x18(%esp)
400001e7:	8d 83 0c d0 ff ff    	lea    -0x2ff4(%ebx),%eax
400001ed:	50                   	push   %eax
400001ee:	e8 0d 02 00 00       	call   40000400 <printf>
    vcprintf(fmt, ap);
400001f3:	58                   	pop    %eax
400001f4:	5a                   	pop    %edx
400001f5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001f9:	50                   	push   %eax
400001fa:	ff 74 24 24          	push   0x24(%esp)
400001fe:	e8 9d 01 00 00       	call   400003a0 <vcprintf>
    va_end(ap);
}
40000203:	83 c4 18             	add    $0x18,%esp
40000206:	5b                   	pop    %ebx
40000207:	c3                   	ret
40000208:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000020f:	00 

40000210 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000210:	53                   	push   %ebx
40000211:	e8 81 00 00 00       	call   40000297 <__x86.get_pc_thunk.bx>
40000216:	81 c3 de 6d 00 00    	add    $0x6dde,%ebx
4000021c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
4000021f:	ff 74 24 18          	push   0x18(%esp)
40000223:	ff 74 24 18          	push   0x18(%esp)
40000227:	8d 83 18 d0 ff ff    	lea    -0x2fe8(%ebx),%eax
4000022d:	50                   	push   %eax
4000022e:	e8 cd 01 00 00       	call   40000400 <printf>
    vcprintf(fmt, ap);
40000233:	58                   	pop    %eax
40000234:	5a                   	pop    %edx
40000235:	8d 44 24 24          	lea    0x24(%esp),%eax
40000239:	50                   	push   %eax
4000023a:	ff 74 24 24          	push   0x24(%esp)
4000023e:	e8 5d 01 00 00       	call   400003a0 <vcprintf>
    va_end(ap);
}
40000243:	83 c4 18             	add    $0x18,%esp
40000246:	5b                   	pop    %ebx
40000247:	c3                   	ret
40000248:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000024f:	00 

40000250 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000250:	53                   	push   %ebx
40000251:	e8 41 00 00 00       	call   40000297 <__x86.get_pc_thunk.bx>
40000256:	81 c3 9e 6d 00 00    	add    $0x6d9e,%ebx
4000025c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000025f:	ff 74 24 18          	push   0x18(%esp)
40000263:	ff 74 24 18          	push   0x18(%esp)
40000267:	8d 83 24 d0 ff ff    	lea    -0x2fdc(%ebx),%eax
4000026d:	50                   	push   %eax
4000026e:	e8 8d 01 00 00       	call   40000400 <printf>
    vcprintf(fmt, ap);
40000273:	58                   	pop    %eax
40000274:	5a                   	pop    %edx
40000275:	8d 44 24 24          	lea    0x24(%esp),%eax
40000279:	50                   	push   %eax
4000027a:	ff 74 24 24          	push   0x24(%esp)
4000027e:	e8 1d 01 00 00       	call   400003a0 <vcprintf>
40000283:	83 c4 10             	add    $0x10,%esp
40000286:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000028d:	00 
4000028e:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
40000290:	e8 3b 09 00 00       	call   40000bd0 <yield>
    while (1)
40000295:	eb f9                	jmp    40000290 <panic+0x40>

40000297 <__x86.get_pc_thunk.bx>:
40000297:	8b 1c 24             	mov    (%esp),%ebx
4000029a:	c3                   	ret
4000029b:	66 90                	xchg   %ax,%ax
4000029d:	66 90                	xchg   %ax,%ax
4000029f:	90                   	nop

400002a0 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
400002a0:	55                   	push   %ebp
400002a1:	57                   	push   %edi
400002a2:	56                   	push   %esi
400002a3:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
400002a4:	8b 44 24 14          	mov    0x14(%esp),%eax
400002a8:	0f b6 00             	movzbl (%eax),%eax
400002ab:	3c 2b                	cmp    $0x2b,%al
400002ad:	0f 84 8d 00 00 00    	je     40000340 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
400002b3:	3c 2d                	cmp    $0x2d,%al
400002b5:	74 59                	je     40000310 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002b7:	8d 50 d0             	lea    -0x30(%eax),%edx
400002ba:	80 fa 09             	cmp    $0x9,%dl
400002bd:	77 71                	ja     40000330 <atoi+0x90>
    int negative = 0;
400002bf:	31 ff                	xor    %edi,%edi
    int loc = 0;
400002c1:	31 f6                	xor    %esi,%esi
        loc++;
400002c3:	89 f2                	mov    %esi,%edx
    int acc = 0;
400002c5:	31 c9                	xor    %ecx,%ecx
400002c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400002ce:	00 
400002cf:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
400002d0:	83 e8 30             	sub    $0x30,%eax
400002d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
400002d6:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
400002d9:	0f be c0             	movsbl %al,%eax
400002dc:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002df:	8b 44 24 14          	mov    0x14(%esp),%eax
400002e3:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
400002e7:	8d 68 d0             	lea    -0x30(%eax),%ebp
400002ea:	89 eb                	mov    %ebp,%ebx
400002ec:	80 fb 09             	cmp    $0x9,%bl
400002ef:	76 df                	jbe    400002d0 <atoi+0x30>
    }
    if (numstart == loc) {
400002f1:	39 f2                	cmp    %esi,%edx
400002f3:	74 3b                	je     40000330 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
400002f5:	89 c8                	mov    %ecx,%eax
400002f7:	f7 d8                	neg    %eax
400002f9:	85 ff                	test   %edi,%edi
400002fb:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
400002fe:	8b 44 24 18          	mov    0x18(%esp),%eax
40000302:	89 08                	mov    %ecx,(%eax)
    return loc;
}
40000304:	89 d0                	mov    %edx,%eax
40000306:	5b                   	pop    %ebx
40000307:	5e                   	pop    %esi
40000308:	5f                   	pop    %edi
40000309:	5d                   	pop    %ebp
4000030a:	c3                   	ret
4000030b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000310:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
40000314:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000319:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000031e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000322:	8d 50 d0             	lea    -0x30(%eax),%edx
40000325:	80 fa 09             	cmp    $0x9,%dl
40000328:	76 99                	jbe    400002c3 <atoi+0x23>
4000032a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000330:	31 d2                	xor    %edx,%edx
}
40000332:	5b                   	pop    %ebx
40000333:	89 d0                	mov    %edx,%eax
40000335:	5e                   	pop    %esi
40000336:	5f                   	pop    %edi
40000337:	5d                   	pop    %ebp
40000338:	c3                   	ret
40000339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000340:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000344:	31 ff                	xor    %edi,%edi
        loc++;
40000346:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000034b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000034f:	8d 50 d0             	lea    -0x30(%eax),%edx
40000352:	80 fa 09             	cmp    $0x9,%dl
40000355:	0f 86 68 ff ff ff    	jbe    400002c3 <atoi+0x23>
        return 0;
4000035b:	31 d2                	xor    %edx,%edx
4000035d:	eb d3                	jmp    40000332 <atoi+0x92>
4000035f:	90                   	nop

40000360 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
40000360:	53                   	push   %ebx
40000361:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000365:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000036a:	8b 02                	mov    (%edx),%eax
4000036c:	8d 48 01             	lea    0x1(%eax),%ecx
4000036f:	89 0a                	mov    %ecx,(%edx)
40000371:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000375:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
4000037b:	75 14                	jne    40000391 <putch+0x31>
        b->buf[b->idx] = 0;
4000037d:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
40000384:	8d 5a 08             	lea    0x8(%edx),%ebx
    asm volatile ("int %0"
40000387:	31 c0                	xor    %eax,%eax
40000389:	cd 30                	int    $0x30
        b->idx = 0;
4000038b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
40000391:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
40000395:	5b                   	pop    %ebx
40000396:	c3                   	ret
40000397:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000039e:	00 
4000039f:	90                   	nop

400003a0 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
400003a0:	53                   	push   %ebx
400003a1:	e8 f1 fe ff ff       	call   40000297 <__x86.get_pc_thunk.bx>
400003a6:	81 c3 4e 6c 00 00    	add    $0x6c4e,%ebx
400003ac:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
400003b2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
400003b9:	00 
    b.cnt = 0;
400003ba:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400003c1:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
400003c2:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400003c9:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400003d0:	8d 44 24 10          	lea    0x10(%esp),%eax
400003d4:	50                   	push   %eax
400003d5:	8d 83 6c 93 ff ff    	lea    -0x6c94(%ebx),%eax
400003db:	50                   	push   %eax
400003dc:	e8 3f 01 00 00       	call   40000520 <vprintfmt>

    b.buf[b.idx] = 0;
400003e1:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400003e5:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400003e9:	31 c0                	xor    %eax,%eax
400003eb:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400003f0:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
400003f2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400003f6:	81 c4 28 02 00 00    	add    $0x228,%esp
400003fc:	5b                   	pop    %ebx
400003fd:	c3                   	ret
400003fe:	66 90                	xchg   %ax,%ax

40000400 <printf>:

int printf(const char *fmt, ...)
{
40000400:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
40000403:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000407:	50                   	push   %eax
40000408:	ff 74 24 1c          	push   0x1c(%esp)
4000040c:	e8 8f ff ff ff       	call   400003a0 <vcprintf>
    va_end(ap);

    return cnt;
}
40000411:	83 c4 1c             	add    $0x1c,%esp
40000414:	c3                   	ret
40000415:	66 90                	xchg   %ax,%ax
40000417:	66 90                	xchg   %ax,%ax
40000419:	66 90                	xchg   %ax,%ax
4000041b:	66 90                	xchg   %ax,%ax
4000041d:	66 90                	xchg   %ax,%ax
4000041f:	90                   	nop

40000420 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000420:	e8 86 07 00 00       	call   40000bab <__x86.get_pc_thunk.cx>
40000425:	81 c1 cf 6b 00 00    	add    $0x6bcf,%ecx
{
4000042b:	55                   	push   %ebp
4000042c:	57                   	push   %edi
4000042d:	89 d7                	mov    %edx,%edi
4000042f:	56                   	push   %esi
40000430:	89 c6                	mov    %eax,%esi
40000432:	53                   	push   %ebx
40000433:	83 ec 2c             	sub    $0x2c,%esp
40000436:	8b 44 24 40          	mov    0x40(%esp),%eax
4000043a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000043e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000442:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000449:	00 
{
4000044a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000044e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000452:	8b 44 24 48          	mov    0x48(%esp),%eax
40000456:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000045a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000045e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000462:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000466:	89 44 24 10          	mov    %eax,0x10(%esp)
4000046a:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
4000046e:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
40000471:	73 55                	jae    400004c8 <printnum+0xa8>
        while (--width > 0)
40000473:	83 fa 01             	cmp    $0x1,%edx
40000476:	7e 17                	jle    4000048f <printnum+0x6f>
40000478:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000047f:	00 
            putch(padc, putdat);
40000480:	83 ec 08             	sub    $0x8,%esp
40000483:	57                   	push   %edi
40000484:	55                   	push   %ebp
40000485:	ff d6                	call   *%esi
        while (--width > 0)
40000487:	83 c4 10             	add    $0x10,%esp
4000048a:	83 eb 01             	sub    $0x1,%ebx
4000048d:	75 f1                	jne    40000480 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
4000048f:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000493:	ff 74 24 14          	push   0x14(%esp)
40000497:	ff 74 24 14          	push   0x14(%esp)
4000049b:	ff 74 24 14          	push   0x14(%esp)
4000049f:	ff 74 24 14          	push   0x14(%esp)
400004a3:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
400004a7:	e8 e4 2f 00 00       	call   40003490 <__umoddi3>
400004ac:	0f be 84 03 30 d0 ff 	movsbl -0x2fd0(%ebx,%eax,1),%eax
400004b3:	ff 
400004b4:	89 44 24 50          	mov    %eax,0x50(%esp)
}
400004b8:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
400004bb:	89 f0                	mov    %esi,%eax
}
400004bd:	5b                   	pop    %ebx
400004be:	5e                   	pop    %esi
400004bf:	5f                   	pop    %edi
400004c0:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
400004c1:	ff e0                	jmp    *%eax
400004c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
400004c8:	83 ec 0c             	sub    $0xc,%esp
400004cb:	55                   	push   %ebp
400004cc:	53                   	push   %ebx
400004cd:	50                   	push   %eax
400004ce:	83 ec 08             	sub    $0x8,%esp
400004d1:	ff 74 24 34          	push   0x34(%esp)
400004d5:	ff 74 24 34          	push   0x34(%esp)
400004d9:	ff 74 24 34          	push   0x34(%esp)
400004dd:	ff 74 24 34          	push   0x34(%esp)
400004e1:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400004e5:	e8 86 2e 00 00       	call   40003370 <__udivdi3>
400004ea:	83 c4 18             	add    $0x18,%esp
400004ed:	52                   	push   %edx
400004ee:	89 fa                	mov    %edi,%edx
400004f0:	50                   	push   %eax
400004f1:	89 f0                	mov    %esi,%eax
400004f3:	e8 28 ff ff ff       	call   40000420 <printnum>
400004f8:	83 c4 20             	add    $0x20,%esp
400004fb:	eb 92                	jmp    4000048f <printnum+0x6f>
400004fd:	8d 76 00             	lea    0x0(%esi),%esi

40000500 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
40000500:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
40000504:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
40000508:	8b 10                	mov    (%eax),%edx
4000050a:	3b 50 04             	cmp    0x4(%eax),%edx
4000050d:	73 0b                	jae    4000051a <sprintputch+0x1a>
        *b->buf++ = ch;
4000050f:	8d 4a 01             	lea    0x1(%edx),%ecx
40000512:	89 08                	mov    %ecx,(%eax)
40000514:	8b 44 24 04          	mov    0x4(%esp),%eax
40000518:	88 02                	mov    %al,(%edx)
}
4000051a:	c3                   	ret
4000051b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000520 <vprintfmt>:
{
40000520:	e8 7e 06 00 00       	call   40000ba3 <__x86.get_pc_thunk.ax>
40000525:	05 cf 6a 00 00       	add    $0x6acf,%eax
4000052a:	55                   	push   %ebp
4000052b:	57                   	push   %edi
4000052c:	56                   	push   %esi
4000052d:	53                   	push   %ebx
4000052e:	83 ec 2c             	sub    $0x2c,%esp
40000531:	8b 74 24 40          	mov    0x40(%esp),%esi
40000535:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000539:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000053d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000541:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000545:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000548:	83 f8 25             	cmp    $0x25,%eax
4000054b:	75 19                	jne    40000566 <vprintfmt+0x46>
4000054d:	eb 29                	jmp    40000578 <vprintfmt+0x58>
4000054f:	90                   	nop
            putch(ch, putdat);
40000550:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000553:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000556:	57                   	push   %edi
40000557:	50                   	push   %eax
40000558:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000055a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000055e:	83 c4 10             	add    $0x10,%esp
40000561:	83 f8 25             	cmp    $0x25,%eax
40000564:	74 12                	je     40000578 <vprintfmt+0x58>
            if (ch == '\0')
40000566:	85 c0                	test   %eax,%eax
40000568:	75 e6                	jne    40000550 <vprintfmt+0x30>
}
4000056a:	83 c4 2c             	add    $0x2c,%esp
4000056d:	5b                   	pop    %ebx
4000056e:	5e                   	pop    %esi
4000056f:	5f                   	pop    %edi
40000570:	5d                   	pop    %ebp
40000571:	c3                   	ret
40000572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
40000578:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
4000057d:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
40000582:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
40000589:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000590:	ff 
        lflag = 0;
40000591:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
40000598:	00 
40000599:	89 54 24 14          	mov    %edx,0x14(%esp)
4000059d:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400005a1:	0f b6 0b             	movzbl (%ebx),%ecx
400005a4:	8d 6b 01             	lea    0x1(%ebx),%ebp
400005a7:	8d 41 dd             	lea    -0x23(%ecx),%eax
400005aa:	3c 55                	cmp    $0x55,%al
400005ac:	77 12                	ja     400005c0 <.L21>
400005ae:	8b 54 24 0c          	mov    0xc(%esp),%edx
400005b2:	0f b6 c0             	movzbl %al,%eax
400005b5:	8b b4 82 98 d4 ff ff 	mov    -0x2b68(%edx,%eax,4),%esi
400005bc:	01 d6                	add    %edx,%esi
400005be:	ff e6                	jmp    *%esi

400005c0 <.L21>:
            putch('%', putdat);
400005c0:	8b 74 24 40          	mov    0x40(%esp),%esi
400005c4:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
400005c7:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
400005c9:	57                   	push   %edi
400005ca:	6a 25                	push   $0x25
400005cc:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
400005ce:	83 c4 10             	add    $0x10,%esp
400005d1:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
400005d5:	0f 84 66 ff ff ff    	je     40000541 <vprintfmt+0x21>
400005db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400005e0:	83 ed 01             	sub    $0x1,%ebp
400005e3:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400005e7:	75 f7                	jne    400005e0 <.L21+0x20>
400005e9:	e9 53 ff ff ff       	jmp    40000541 <vprintfmt+0x21>
400005ee:	66 90                	xchg   %ax,%ax

400005f0 <.L31>:
                ch = *fmt;
400005f0:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
400005f4:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
400005f7:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
400005f9:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
400005fd:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000600:	83 f9 09             	cmp    $0x9,%ecx
40000603:	77 28                	ja     4000062d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
40000605:	8b 74 24 40          	mov    0x40(%esp),%esi
40000609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
40000610:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
40000613:	8d 14 92             	lea    (%edx,%edx,4),%edx
40000616:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
4000061a:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
4000061d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000620:	83 f9 09             	cmp    $0x9,%ecx
40000623:	76 eb                	jbe    40000610 <.L31+0x20>
40000625:	89 54 24 14          	mov    %edx,0x14(%esp)
40000629:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000062d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000631:	85 f6                	test   %esi,%esi
40000633:	0f 89 68 ff ff ff    	jns    400005a1 <vprintfmt+0x81>
                width = precision, precision = -1;
40000639:	8b 44 24 14          	mov    0x14(%esp),%eax
4000063d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000644:	ff 
40000645:	89 44 24 08          	mov    %eax,0x8(%esp)
40000649:	e9 53 ff ff ff       	jmp    400005a1 <vprintfmt+0x81>

4000064e <.L35>:
            altflag = 1;
4000064e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000655:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000657:	e9 45 ff ff ff       	jmp    400005a1 <vprintfmt+0x81>

4000065c <.L34>:
            putch(ch, putdat);
4000065c:	8b 74 24 40          	mov    0x40(%esp),%esi
40000660:	83 ec 08             	sub    $0x8,%esp
40000663:	57                   	push   %edi
40000664:	6a 25                	push   $0x25
40000666:	ff d6                	call   *%esi
            break;
40000668:	83 c4 10             	add    $0x10,%esp
4000066b:	e9 d1 fe ff ff       	jmp    40000541 <vprintfmt+0x21>

40000670 <.L33>:
            precision = va_arg(ap, int);
40000670:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
40000674:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
40000676:	8b 00                	mov    (%eax),%eax
40000678:	89 44 24 14          	mov    %eax,0x14(%esp)
4000067c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000680:	83 c0 04             	add    $0x4,%eax
40000683:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
40000687:	eb a4                	jmp    4000062d <.L31+0x3d>

40000689 <.L32>:
            if (width < 0)
40000689:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000068d:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
4000068f:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000691:	85 c9                	test   %ecx,%ecx
40000693:	0f 49 c1             	cmovns %ecx,%eax
40000696:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
4000069a:	e9 02 ff ff ff       	jmp    400005a1 <vprintfmt+0x81>

4000069f <.L30>:
            putch(va_arg(ap, int), putdat);
4000069f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006a3:	8b 74 24 40          	mov    0x40(%esp),%esi
400006a7:	83 ec 08             	sub    $0x8,%esp
400006aa:	57                   	push   %edi
400006ab:	8d 58 04             	lea    0x4(%eax),%ebx
400006ae:	8b 44 24 58          	mov    0x58(%esp),%eax
400006b2:	ff 30                	push   (%eax)
400006b4:	ff d6                	call   *%esi
400006b6:	89 5c 24 5c          	mov    %ebx,0x5c(%esp)
            break;
400006ba:	83 c4 10             	add    $0x10,%esp
400006bd:	e9 7f fe ff ff       	jmp    40000541 <vprintfmt+0x21>

400006c2 <.L24>:
    if (lflag >= 2)
400006c2:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006c7:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400006cb:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006cf:	0f 8f d8 01 00 00    	jg     400008ad <.L25+0xe0>
        return va_arg(*ap, unsigned long);
400006d5:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400006d9:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400006dc:	31 db                	xor    %ebx,%ebx
400006de:	ba 0a 00 00 00       	mov    $0xa,%edx
400006e3:	8b 09                	mov    (%ecx),%ecx
400006e5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400006e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
400006f0:	83 ec 0c             	sub    $0xc,%esp
400006f3:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
400006f8:	50                   	push   %eax
400006f9:	89 f0                	mov    %esi,%eax
400006fb:	ff 74 24 18          	push   0x18(%esp)
400006ff:	52                   	push   %edx
40000700:	89 fa                	mov    %edi,%edx
40000702:	53                   	push   %ebx
40000703:	51                   	push   %ecx
40000704:	e8 17 fd ff ff       	call   40000420 <printnum>
            break;
40000709:	83 c4 20             	add    $0x20,%esp
4000070c:	e9 30 fe ff ff       	jmp    40000541 <vprintfmt+0x21>

40000711 <.L26>:
            putch('0', putdat);
40000711:	8b 74 24 40          	mov    0x40(%esp),%esi
40000715:	83 ec 08             	sub    $0x8,%esp
40000718:	57                   	push   %edi
40000719:	6a 30                	push   $0x30
4000071b:	ff d6                	call   *%esi
            putch('x', putdat);
4000071d:	59                   	pop    %ecx
4000071e:	5b                   	pop    %ebx
4000071f:	57                   	push   %edi
40000720:	6a 78                	push   $0x78
            num = (unsigned long long)
40000722:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000724:	ff d6                	call   *%esi
            num = (unsigned long long)
40000726:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000072a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000072f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000731:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000734:	83 c0 04             	add    $0x4,%eax
40000737:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000073b:	eb b3                	jmp    400006f0 <.L24+0x2e>

4000073d <.L22>:
    if (lflag >= 2)
4000073d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000742:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000746:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000074a:	0f 8f 6e 01 00 00    	jg     400008be <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000750:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000754:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000757:	31 db                	xor    %ebx,%ebx
40000759:	ba 10 00 00 00       	mov    $0x10,%edx
4000075e:	8b 09                	mov    (%ecx),%ecx
40000760:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000764:	eb 8a                	jmp    400006f0 <.L24+0x2e>

40000766 <.L29>:
    if (lflag >= 2)
40000766:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
4000076b:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
4000076f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
40000773:	0f 8f 5b 01 00 00    	jg     400008d4 <.L25+0x107>
        return va_arg(*ap, long);
40000779:	8b 00                	mov    (%eax),%eax
4000077b:	89 c3                	mov    %eax,%ebx
4000077d:	89 c1                	mov    %eax,%ecx
4000077f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000783:	c1 fb 1f             	sar    $0x1f,%ebx
40000786:	83 c0 04             	add    $0x4,%eax
40000789:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
4000078d:	85 db                	test   %ebx,%ebx
4000078f:	0f 88 68 01 00 00    	js     400008fd <.L19+0xc>
        return va_arg(*ap, unsigned long long);
40000795:	ba 0a 00 00 00       	mov    $0xa,%edx
4000079a:	e9 51 ff ff ff       	jmp    400006f0 <.L24+0x2e>

4000079f <.L28>:
            lflag++;
4000079f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400007a4:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
400007a6:	e9 f6 fd ff ff       	jmp    400005a1 <vprintfmt+0x81>

400007ab <.L27>:
            putch('X', putdat);
400007ab:	8b 74 24 40          	mov    0x40(%esp),%esi
400007af:	83 ec 08             	sub    $0x8,%esp
400007b2:	57                   	push   %edi
400007b3:	6a 58                	push   $0x58
400007b5:	ff d6                	call   *%esi
            putch('X', putdat);
400007b7:	58                   	pop    %eax
400007b8:	5a                   	pop    %edx
400007b9:	57                   	push   %edi
400007ba:	6a 58                	push   $0x58
400007bc:	ff d6                	call   *%esi
            putch('X', putdat);
400007be:	59                   	pop    %ecx
400007bf:	5b                   	pop    %ebx
400007c0:	57                   	push   %edi
400007c1:	6a 58                	push   $0x58
400007c3:	ff d6                	call   *%esi
            break;
400007c5:	83 c4 10             	add    $0x10,%esp
400007c8:	e9 74 fd ff ff       	jmp    40000541 <vprintfmt+0x21>

400007cd <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
400007cd:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
400007d1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
400007d5:	8b 54 24 14          	mov    0x14(%esp),%edx
400007d9:	8b 74 24 40          	mov    0x40(%esp),%esi
400007dd:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
400007e0:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
400007e5:	89 44 24 14          	mov    %eax,0x14(%esp)
400007e9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400007ed:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
400007ef:	0f 95 c0             	setne  %al
400007f2:	85 c9                	test   %ecx,%ecx
400007f4:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
400007f7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
400007fb:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
400007fd:	85 db                	test   %ebx,%ebx
400007ff:	0f 84 21 01 00 00    	je     40000926 <.L19+0x35>
            if (width > 0 && padc != '-')
40000805:	84 c0                	test   %al,%al
40000807:	0f 85 48 01 00 00    	jne    40000955 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
4000080d:	89 d8                	mov    %ebx,%eax
4000080f:	8d 5b 01             	lea    0x1(%ebx),%ebx
40000812:	0f be 08             	movsbl (%eax),%ecx
40000815:	89 c8                	mov    %ecx,%eax
40000817:	85 c9                	test   %ecx,%ecx
40000819:	74 64                	je     4000087f <.L25+0xb2>
4000081b:	89 74 24 40          	mov    %esi,0x40(%esp)
4000081f:	89 d6                	mov    %edx,%esi
40000821:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000825:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000829:	eb 2a                	jmp    40000855 <.L25+0x88>
4000082b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000830:	83 e8 20             	sub    $0x20,%eax
40000833:	83 f8 5e             	cmp    $0x5e,%eax
40000836:	76 2d                	jbe    40000865 <.L25+0x98>
                    putch('?', putdat);
40000838:	83 ec 08             	sub    $0x8,%esp
4000083b:	57                   	push   %edi
4000083c:	6a 3f                	push   $0x3f
4000083e:	ff 54 24 50          	call   *0x50(%esp)
40000842:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000845:	0f be 03             	movsbl (%ebx),%eax
40000848:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000084b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000084e:	0f be c8             	movsbl %al,%ecx
40000851:	85 c9                	test   %ecx,%ecx
40000853:	74 1e                	je     40000873 <.L25+0xa6>
40000855:	85 f6                	test   %esi,%esi
40000857:	78 05                	js     4000085e <.L25+0x91>
                                         || --precision >= 0); width--)
40000859:	83 ee 01             	sub    $0x1,%esi
4000085c:	72 15                	jb     40000873 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000085e:	8b 14 24             	mov    (%esp),%edx
40000861:	85 d2                	test   %edx,%edx
40000863:	75 cb                	jne    40000830 <.L25+0x63>
                    putch(ch, putdat);
40000865:	83 ec 08             	sub    $0x8,%esp
40000868:	57                   	push   %edi
40000869:	51                   	push   %ecx
4000086a:	ff 54 24 50          	call   *0x50(%esp)
4000086e:	83 c4 10             	add    $0x10,%esp
40000871:	eb d2                	jmp    40000845 <.L25+0x78>
40000873:	89 6c 24 08          	mov    %ebp,0x8(%esp)
40000877:	8b 74 24 40          	mov    0x40(%esp),%esi
4000087b:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
4000087f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000883:	85 c0                	test   %eax,%eax
40000885:	7e 19                	jle    400008a0 <.L25+0xd3>
40000887:	89 c3                	mov    %eax,%ebx
40000889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
40000890:	83 ec 08             	sub    $0x8,%esp
40000893:	57                   	push   %edi
40000894:	6a 20                	push   $0x20
40000896:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000898:	83 c4 10             	add    $0x10,%esp
4000089b:	83 eb 01             	sub    $0x1,%ebx
4000089e:	75 f0                	jne    40000890 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
400008a0:	8b 44 24 14          	mov    0x14(%esp),%eax
400008a4:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008a8:	e9 94 fc ff ff       	jmp    40000541 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
400008ad:	8b 08                	mov    (%eax),%ecx
400008af:	8b 58 04             	mov    0x4(%eax),%ebx
400008b2:	83 c0 08             	add    $0x8,%eax
400008b5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008b9:	e9 d7 fe ff ff       	jmp    40000795 <.L29+0x2f>
400008be:	8b 08                	mov    (%eax),%ecx
400008c0:	8b 58 04             	mov    0x4(%eax),%ebx
400008c3:	83 c0 08             	add    $0x8,%eax
400008c6:	ba 10 00 00 00       	mov    $0x10,%edx
400008cb:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008cf:	e9 1c fe ff ff       	jmp    400006f0 <.L24+0x2e>
        return va_arg(*ap, long long);
400008d4:	8b 08                	mov    (%eax),%ecx
400008d6:	8b 58 04             	mov    0x4(%eax),%ebx
400008d9:	83 c0 08             	add    $0x8,%eax
400008dc:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008e0:	e9 a8 fe ff ff       	jmp    4000078d <.L29+0x27>

400008e5 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
400008e5:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400008ea:	89 eb                	mov    %ebp,%ebx
400008ec:	e9 b0 fc ff ff       	jmp    400005a1 <vprintfmt+0x81>

400008f1 <.L19>:
            padc = '-';
400008f1:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400008f6:	89 eb                	mov    %ebp,%ebx
400008f8:	e9 a4 fc ff ff       	jmp    400005a1 <vprintfmt+0x81>
400008fd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
40000901:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
40000904:	31 db                	xor    %ebx,%ebx
40000906:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
4000090a:	57                   	push   %edi
4000090b:	6a 2d                	push   $0x2d
4000090d:	ff d6                	call   *%esi
                num = -(long long) num;
4000090f:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000913:	ba 0a 00 00 00       	mov    $0xa,%edx
40000918:	f7 d9                	neg    %ecx
4000091a:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
4000091e:	83 c4 10             	add    $0x10,%esp
40000921:	e9 ca fd ff ff       	jmp    400006f0 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000926:	84 c0                	test   %al,%al
40000928:	0f 85 99 00 00 00    	jne    400009c7 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000092e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000932:	89 74 24 40          	mov    %esi,0x40(%esp)
40000936:	b9 28 00 00 00       	mov    $0x28,%ecx
4000093b:	89 d6                	mov    %edx,%esi
4000093d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000941:	b8 28 00 00 00       	mov    $0x28,%eax
40000946:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000094a:	8d 9b 42 d0 ff ff    	lea    -0x2fbe(%ebx),%ebx
40000950:	e9 00 ff ff ff       	jmp    40000855 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000955:	83 ec 08             	sub    $0x8,%esp
40000958:	52                   	push   %edx
40000959:	89 54 24 28          	mov    %edx,0x28(%esp)
4000095d:	ff 74 24 24          	push   0x24(%esp)
40000961:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000965:	e8 26 03 00 00       	call   40000c90 <strnlen>
4000096a:	29 44 24 18          	sub    %eax,0x18(%esp)
4000096e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000972:	83 c4 10             	add    $0x10,%esp
40000975:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000979:	85 c9                	test   %ecx,%ecx
4000097b:	0f 8e 99 00 00 00    	jle    40000a1a <.L19+0x129>
                    putch(padc, putdat);
40000981:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000986:	89 54 24 10          	mov    %edx,0x10(%esp)
4000098a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000098e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000992:	83 ec 08             	sub    $0x8,%esp
40000995:	57                   	push   %edi
40000996:	53                   	push   %ebx
40000997:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
40000999:	83 c4 10             	add    $0x10,%esp
4000099c:	83 ed 01             	sub    $0x1,%ebp
4000099f:	75 f1                	jne    40000992 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
400009a1:	8b 44 24 18          	mov    0x18(%esp),%eax
400009a5:	8b 54 24 10          	mov    0x10(%esp),%edx
400009a9:	89 6c 24 08          	mov    %ebp,0x8(%esp)
400009ad:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400009b1:	8d 58 01             	lea    0x1(%eax),%ebx
400009b4:	0f be 00             	movsbl (%eax),%eax
400009b7:	0f be c8             	movsbl %al,%ecx
400009ba:	85 c9                	test   %ecx,%ecx
400009bc:	0f 85 59 fe ff ff    	jne    4000081b <.L25+0x4e>
400009c2:	e9 d9 fe ff ff       	jmp    400008a0 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
400009c7:	83 ec 08             	sub    $0x8,%esp
400009ca:	52                   	push   %edx
400009cb:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400009cf:	8d 8b 41 d0 ff ff    	lea    -0x2fbf(%ebx),%ecx
400009d5:	89 54 24 28          	mov    %edx,0x28(%esp)
400009d9:	51                   	push   %ecx
400009da:	89 4c 24 28          	mov    %ecx,0x28(%esp)
400009de:	e8 ad 02 00 00       	call   40000c90 <strnlen>
400009e3:	29 44 24 18          	sub    %eax,0x18(%esp)
400009e7:	8b 44 24 18          	mov    0x18(%esp),%eax
400009eb:	83 c4 10             	add    $0x10,%esp
400009ee:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400009f2:	85 c0                	test   %eax,%eax
400009f4:	7f 8b                	jg     40000981 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
400009f6:	b9 28 00 00 00       	mov    $0x28,%ecx
400009fb:	b8 28 00 00 00       	mov    $0x28,%eax
40000a00:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000a04:	89 74 24 40          	mov    %esi,0x40(%esp)
40000a08:	89 d6                	mov    %edx,%esi
40000a0a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000a0e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000a12:	83 c3 01             	add    $0x1,%ebx
40000a15:	e9 3b fe ff ff       	jmp    40000855 <.L25+0x88>
40000a1a:	8b 44 24 18          	mov    0x18(%esp),%eax
40000a1e:	0f be 08             	movsbl (%eax),%ecx
40000a21:	89 c8                	mov    %ecx,%eax
40000a23:	85 c9                	test   %ecx,%ecx
40000a25:	75 d9                	jne    40000a00 <.L19+0x10f>
40000a27:	e9 74 fe ff ff       	jmp    400008a0 <.L25+0xd3>
40000a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000a30 <printfmt>:
{
40000a30:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000a33:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000a37:	50                   	push   %eax
40000a38:	ff 74 24 1c          	push   0x1c(%esp)
40000a3c:	ff 74 24 1c          	push   0x1c(%esp)
40000a40:	ff 74 24 1c          	push   0x1c(%esp)
40000a44:	e8 d7 fa ff ff       	call   40000520 <vprintfmt>
}
40000a49:	83 c4 1c             	add    $0x1c,%esp
40000a4c:	c3                   	ret
40000a4d:	8d 76 00             	lea    0x0(%esi),%esi

40000a50 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a50:	e8 4e 01 00 00       	call   40000ba3 <__x86.get_pc_thunk.ax>
40000a55:	05 9f 65 00 00       	add    $0x659f,%eax
{
40000a5a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a5d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a61:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a68:	ff 
40000a69:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a70:	00 
40000a71:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a75:	ff 74 24 28          	push   0x28(%esp)
40000a79:	ff 74 24 28          	push   0x28(%esp)
40000a7d:	8d 80 0c 95 ff ff    	lea    -0x6af4(%eax),%eax
40000a83:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a87:	52                   	push   %edx
40000a88:	50                   	push   %eax
40000a89:	e8 92 fa ff ff       	call   40000520 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a8e:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a92:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a95:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a99:	83 c4 2c             	add    $0x2c,%esp
40000a9c:	c3                   	ret
40000a9d:	8d 76 00             	lea    0x0(%esi),%esi

40000aa0 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000aa0:	e8 fe 00 00 00       	call   40000ba3 <__x86.get_pc_thunk.ax>
40000aa5:	05 4f 65 00 00       	add    $0x654f,%eax
{
40000aaa:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000aad:	8b 54 24 20          	mov    0x20(%esp),%edx
40000ab1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000ab8:	ff 
40000ab9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000ac0:	00 
40000ac1:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000ac5:	8d 54 24 28          	lea    0x28(%esp),%edx
40000ac9:	52                   	push   %edx
40000aca:	ff 74 24 28          	push   0x28(%esp)
40000ace:	8d 80 0c 95 ff ff    	lea    -0x6af4(%eax),%eax
40000ad4:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000ad8:	52                   	push   %edx
40000ad9:	50                   	push   %eax
40000ada:	e8 41 fa ff ff       	call   40000520 <vprintfmt>
    *b.buf = '\0';
40000adf:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ae3:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
40000ae6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000aea:	83 c4 2c             	add    $0x2c,%esp
40000aed:	c3                   	ret
40000aee:	66 90                	xchg   %ax,%ax

40000af0 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000af0:	e8 b2 00 00 00       	call   40000ba7 <__x86.get_pc_thunk.dx>
40000af5:	81 c2 ff 64 00 00    	add    $0x64ff,%edx
{
40000afb:	83 ec 1c             	sub    $0x1c,%esp
40000afe:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000b02:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000b06:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000b0d:	00 
40000b0e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b12:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000b16:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000b1a:	ff 74 24 2c          	push   0x2c(%esp)
40000b1e:	ff 74 24 2c          	push   0x2c(%esp)
40000b22:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b26:	50                   	push   %eax
40000b27:	8d 82 0c 95 ff ff    	lea    -0x6af4(%edx),%eax
40000b2d:	50                   	push   %eax
40000b2e:	e8 ed f9 ff ff       	call   40000520 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000b33:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b37:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000b3a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b3e:	83 c4 2c             	add    $0x2c,%esp
40000b41:	c3                   	ret
40000b42:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b49:	00 
40000b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000b50 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000b50:	e8 52 00 00 00       	call   40000ba7 <__x86.get_pc_thunk.dx>
40000b55:	81 c2 9f 64 00 00    	add    $0x649f,%edx
{
40000b5b:	83 ec 1c             	sub    $0x1c,%esp
40000b5e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000b62:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000b66:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000b6d:	00 
40000b6e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b72:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000b76:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000b7a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000b7e:	50                   	push   %eax
40000b7f:	ff 74 24 2c          	push   0x2c(%esp)
40000b83:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b87:	50                   	push   %eax
40000b88:	8d 82 0c 95 ff ff    	lea    -0x6af4(%edx),%eax
40000b8e:	50                   	push   %eax
40000b8f:	e8 8c f9 ff ff       	call   40000520 <vprintfmt>
    *b.buf = '\0';
40000b94:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b98:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000b9b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b9f:	83 c4 2c             	add    $0x2c,%esp
40000ba2:	c3                   	ret

40000ba3 <__x86.get_pc_thunk.ax>:
40000ba3:	8b 04 24             	mov    (%esp),%eax
40000ba6:	c3                   	ret

40000ba7 <__x86.get_pc_thunk.dx>:
40000ba7:	8b 14 24             	mov    (%esp),%edx
40000baa:	c3                   	ret

40000bab <__x86.get_pc_thunk.cx>:
40000bab:	8b 0c 24             	mov    (%esp),%ecx
40000bae:	c3                   	ret
40000baf:	90                   	nop

40000bb0 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000bb0:	53                   	push   %ebx
    asm volatile ("int %2"
40000bb1:	b8 02 00 00 00       	mov    $0x2,%eax
40000bb6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000bba:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000bbe:	cd 30                	int    $0x30
    return errno ? -1 : pid;
40000bc0:	85 c0                	test   %eax,%eax
40000bc2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000bc7:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000bca:	5b                   	pop    %ebx
40000bcb:	c3                   	ret
40000bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000bd0 <yield>:
    asm volatile ("int %0"
40000bd0:	b8 03 00 00 00       	mov    $0x3,%eax
40000bd5:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000bd7:	c3                   	ret
40000bd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bdf:	00 

40000be0 <produce>:

void produce(int item)
{
40000be0:	53                   	push   %ebx
}

static gcc_inline void sys_produce(unsigned int item)
{
	int errno; 
    asm volatile ("int %1"
40000be1:	b8 0e 00 00 00       	mov    $0xe,%eax
40000be6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000bea:	cd 30                	int    $0x30
    sys_produce(item);
}
40000bec:	5b                   	pop    %ebx
40000bed:	c3                   	ret
40000bee:	66 90                	xchg   %ax,%ax

40000bf0 <consume>:

int consume(void)
{
40000bf0:	53                   	push   %ebx

static gcc_inline int sys_consume(void)
{
	int errno, item;

    asm volatile ("int %2"
40000bf1:	b8 0f 00 00 00       	mov    $0xf,%eax
40000bf6:	cd 30                	int    $0x30
    return sys_consume();
40000bf8:	89 d8                	mov    %ebx,%eax
40000bfa:	5b                   	pop    %ebx
40000bfb:	c3                   	ret
40000bfc:	66 90                	xchg   %ax,%ax
40000bfe:	66 90                	xchg   %ax,%ax

40000c00 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000c00:	8b 44 24 04          	mov    0x4(%esp),%eax
40000c04:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000c0a:	c3                   	ret
40000c0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000c10 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000c10:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000c14:	b8 01 00 00 00       	mov    $0x1,%eax
40000c19:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000c1c:	85 c0                	test   %eax,%eax
40000c1e:	74 13                	je     40000c33 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000c20:	b9 01 00 00 00       	mov    $0x1,%ecx
40000c25:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000c28:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000c2a:	89 c8                	mov    %ecx,%eax
40000c2c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000c2f:	85 c0                	test   %eax,%eax
40000c31:	75 f5                	jne    40000c28 <spinlock_acquire+0x18>
}
40000c33:	c3                   	ret
40000c34:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c3b:	00 
40000c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000c40 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000c40:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000c44:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000c46:	84 c0                	test   %al,%al
40000c48:	74 05                	je     40000c4f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000c4a:	31 c0                	xor    %eax,%eax
40000c4c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000c4f:	c3                   	ret

40000c50 <spinlock_holding>:
    return *lk;
40000c50:	8b 44 24 04          	mov    0x4(%esp),%eax
40000c54:	8b 00                	mov    (%eax),%eax
}
40000c56:	c3                   	ret
40000c57:	66 90                	xchg   %ax,%ax
40000c59:	66 90                	xchg   %ax,%ax
40000c5b:	66 90                	xchg   %ax,%ax
40000c5d:	66 90                	xchg   %ax,%ax
40000c5f:	90                   	nop

40000c60 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000c60:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000c64:	31 c0                	xor    %eax,%eax
40000c66:	80 3a 00             	cmpb   $0x0,(%edx)
40000c69:	74 15                	je     40000c80 <strlen+0x20>
40000c6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000c70:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000c73:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000c77:	75 f7                	jne    40000c70 <strlen+0x10>
40000c79:	c3                   	ret
40000c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000c80:	c3                   	ret
40000c81:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c88:	00 
40000c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c90 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000c90:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c94:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c98:	31 c0                	xor    %eax,%eax
40000c9a:	85 d2                	test   %edx,%edx
40000c9c:	75 09                	jne    40000ca7 <strnlen+0x17>
40000c9e:	c3                   	ret
40000c9f:	90                   	nop
        n++;
40000ca0:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000ca3:	39 c2                	cmp    %eax,%edx
40000ca5:	74 09                	je     40000cb0 <strnlen+0x20>
40000ca7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000cab:	75 f3                	jne    40000ca0 <strnlen+0x10>
40000cad:	c3                   	ret
40000cae:	66 90                	xchg   %ax,%ax
    return n;
}
40000cb0:	c3                   	ret
40000cb1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cb8:	00 
40000cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000cc0 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000cc0:	53                   	push   %ebx
40000cc1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000cc5:	31 c0                	xor    %eax,%eax
{
40000cc7:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000ccb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000cd0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000cd4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000cd7:	83 c0 01             	add    $0x1,%eax
40000cda:	84 d2                	test   %dl,%dl
40000cdc:	75 f2                	jne    40000cd0 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000cde:	89 c8                	mov    %ecx,%eax
40000ce0:	5b                   	pop    %ebx
40000ce1:	c3                   	ret
40000ce2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ce9:	00 
40000cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000cf0 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000cf0:	56                   	push   %esi
40000cf1:	53                   	push   %ebx
40000cf2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000cf6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000cfa:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000cfe:	85 db                	test   %ebx,%ebx
40000d00:	74 21                	je     40000d23 <strncpy+0x33>
40000d02:	01 f3                	add    %esi,%ebx
40000d04:	89 f0                	mov    %esi,%eax
40000d06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d0d:	00 
40000d0e:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000d10:	0f b6 0a             	movzbl (%edx),%ecx
40000d13:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000d16:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000d19:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000d1c:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000d1f:	39 c3                	cmp    %eax,%ebx
40000d21:	75 ed                	jne    40000d10 <strncpy+0x20>
    }
    return ret;
}
40000d23:	89 f0                	mov    %esi,%eax
40000d25:	5b                   	pop    %ebx
40000d26:	5e                   	pop    %esi
40000d27:	c3                   	ret
40000d28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d2f:	00 

40000d30 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000d30:	56                   	push   %esi
40000d31:	53                   	push   %ebx
40000d32:	8b 44 24 14          	mov    0x14(%esp),%eax
40000d36:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000d3a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000d3e:	85 c0                	test   %eax,%eax
40000d40:	74 29                	je     40000d6b <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000d42:	89 f2                	mov    %esi,%edx
40000d44:	83 e8 01             	sub    $0x1,%eax
40000d47:	74 1f                	je     40000d68 <strlcpy+0x38>
40000d49:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000d4c:	eb 0f                	jmp    40000d5d <strlcpy+0x2d>
40000d4e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000d50:	83 c2 01             	add    $0x1,%edx
40000d53:	83 c1 01             	add    $0x1,%ecx
40000d56:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000d59:	39 da                	cmp    %ebx,%edx
40000d5b:	74 07                	je     40000d64 <strlcpy+0x34>
40000d5d:	0f b6 01             	movzbl (%ecx),%eax
40000d60:	84 c0                	test   %al,%al
40000d62:	75 ec                	jne    40000d50 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000d64:	89 d0                	mov    %edx,%eax
40000d66:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000d68:	c6 02 00             	movb   $0x0,(%edx)
}
40000d6b:	5b                   	pop    %ebx
40000d6c:	5e                   	pop    %esi
40000d6d:	c3                   	ret
40000d6e:	66 90                	xchg   %ax,%ax

40000d70 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000d70:	53                   	push   %ebx
40000d71:	8b 54 24 08          	mov    0x8(%esp),%edx
40000d75:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000d79:	0f b6 02             	movzbl (%edx),%eax
40000d7c:	84 c0                	test   %al,%al
40000d7e:	75 18                	jne    40000d98 <strcmp+0x28>
40000d80:	eb 30                	jmp    40000db2 <strcmp+0x42>
40000d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d88:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000d8c:	83 c2 01             	add    $0x1,%edx
40000d8f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000d92:	84 c0                	test   %al,%al
40000d94:	74 12                	je     40000da8 <strcmp+0x38>
40000d96:	89 d9                	mov    %ebx,%ecx
40000d98:	0f b6 19             	movzbl (%ecx),%ebx
40000d9b:	38 c3                	cmp    %al,%bl
40000d9d:	74 e9                	je     40000d88 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d9f:	29 d8                	sub    %ebx,%eax
}
40000da1:	5b                   	pop    %ebx
40000da2:	c3                   	ret
40000da3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000da8:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000dac:	31 c0                	xor    %eax,%eax
40000dae:	29 d8                	sub    %ebx,%eax
}
40000db0:	5b                   	pop    %ebx
40000db1:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000db2:	0f b6 19             	movzbl (%ecx),%ebx
40000db5:	31 c0                	xor    %eax,%eax
40000db7:	eb e6                	jmp    40000d9f <strcmp+0x2f>
40000db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000dc0 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000dc0:	53                   	push   %ebx
40000dc1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000dc5:	8b 44 24 08          	mov    0x8(%esp),%eax
40000dc9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000dcd:	85 d2                	test   %edx,%edx
40000dcf:	75 16                	jne    40000de7 <strncmp+0x27>
40000dd1:	eb 2d                	jmp    40000e00 <strncmp+0x40>
40000dd3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dd8:	3a 19                	cmp    (%ecx),%bl
40000dda:	75 12                	jne    40000dee <strncmp+0x2e>
        n--, p++, q++;
40000ddc:	83 c0 01             	add    $0x1,%eax
40000ddf:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000de2:	83 ea 01             	sub    $0x1,%edx
40000de5:	74 19                	je     40000e00 <strncmp+0x40>
40000de7:	0f b6 18             	movzbl (%eax),%ebx
40000dea:	84 db                	test   %bl,%bl
40000dec:	75 ea                	jne    40000dd8 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000dee:	0f b6 00             	movzbl (%eax),%eax
40000df1:	0f b6 11             	movzbl (%ecx),%edx
}
40000df4:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000df5:	29 d0                	sub    %edx,%eax
}
40000df7:	c3                   	ret
40000df8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dff:	00 
        return 0;
40000e00:	31 c0                	xor    %eax,%eax
}
40000e02:	5b                   	pop    %ebx
40000e03:	c3                   	ret
40000e04:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e0b:	00 
40000e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000e10 <strchr>:

char *strchr(const char *s, char c)
{
40000e10:	8b 44 24 04          	mov    0x4(%esp),%eax
40000e14:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000e19:	0f b6 10             	movzbl (%eax),%edx
40000e1c:	84 d2                	test   %dl,%dl
40000e1e:	75 13                	jne    40000e33 <strchr+0x23>
40000e20:	eb 1e                	jmp    40000e40 <strchr+0x30>
40000e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000e28:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000e2c:	83 c0 01             	add    $0x1,%eax
40000e2f:	84 d2                	test   %dl,%dl
40000e31:	74 0d                	je     40000e40 <strchr+0x30>
        if (*s == c)
40000e33:	38 d1                	cmp    %dl,%cl
40000e35:	75 f1                	jne    40000e28 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000e37:	c3                   	ret
40000e38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e3f:	00 
    return 0;
40000e40:	31 c0                	xor    %eax,%eax
}
40000e42:	c3                   	ret
40000e43:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e4a:	00 
40000e4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000e50 <strfind>:

char *strfind(const char *s, char c)
{
40000e50:	53                   	push   %ebx
40000e51:	8b 44 24 08          	mov    0x8(%esp),%eax
40000e55:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000e59:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000e5c:	38 d3                	cmp    %dl,%bl
40000e5e:	74 1f                	je     40000e7f <strfind+0x2f>
40000e60:	89 d1                	mov    %edx,%ecx
40000e62:	84 db                	test   %bl,%bl
40000e64:	75 0e                	jne    40000e74 <strfind+0x24>
40000e66:	eb 17                	jmp    40000e7f <strfind+0x2f>
40000e68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e6f:	00 
40000e70:	84 d2                	test   %dl,%dl
40000e72:	74 0b                	je     40000e7f <strfind+0x2f>
    for (; *s; s++)
40000e74:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000e78:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000e7b:	38 ca                	cmp    %cl,%dl
40000e7d:	75 f1                	jne    40000e70 <strfind+0x20>
            break;
    return (char *) s;
}
40000e7f:	5b                   	pop    %ebx
40000e80:	c3                   	ret
40000e81:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e88:	00 
40000e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000e90 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000e90:	55                   	push   %ebp
40000e91:	57                   	push   %edi
40000e92:	56                   	push   %esi
40000e93:	53                   	push   %ebx
40000e94:	8b 54 24 14          	mov    0x14(%esp),%edx
40000e98:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000e9c:	0f b6 02             	movzbl (%edx),%eax
40000e9f:	3c 20                	cmp    $0x20,%al
40000ea1:	75 10                	jne    40000eb3 <strtol+0x23>
40000ea3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ea8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000eac:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000eaf:	3c 20                	cmp    $0x20,%al
40000eb1:	74 f5                	je     40000ea8 <strtol+0x18>
40000eb3:	3c 09                	cmp    $0x9,%al
40000eb5:	74 f1                	je     40000ea8 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000eb7:	3c 2b                	cmp    $0x2b,%al
40000eb9:	0f 84 b1 00 00 00    	je     40000f70 <strtol+0xe0>
    int neg = 0;
40000ebf:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000ec1:	3c 2d                	cmp    $0x2d,%al
40000ec3:	0f 84 97 00 00 00    	je     40000f60 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000ec9:	0f b6 02             	movzbl (%edx),%eax
40000ecc:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000ed3:	ff 
40000ed4:	75 1d                	jne    40000ef3 <strtol+0x63>
40000ed6:	3c 30                	cmp    $0x30,%al
40000ed8:	0f 84 a2 00 00 00    	je     40000f80 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000ede:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000ee3:	19 c0                	sbb    %eax,%eax
40000ee5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000ee9:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000eee:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000ef3:	31 c9                	xor    %ecx,%ecx
40000ef5:	eb 1c                	jmp    40000f13 <strtol+0x83>
40000ef7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000efe:	00 
40000eff:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000f00:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000f03:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000f07:	7d 2a                	jge    40000f33 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000f09:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000f0e:	83 c2 01             	add    $0x1,%edx
40000f11:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000f13:	0f be 02             	movsbl (%edx),%eax
40000f16:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000f19:	89 eb                	mov    %ebp,%ebx
40000f1b:	80 fb 09             	cmp    $0x9,%bl
40000f1e:	76 e0                	jbe    40000f00 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000f20:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000f23:	89 eb                	mov    %ebp,%ebx
40000f25:	80 fb 19             	cmp    $0x19,%bl
40000f28:	77 26                	ja     40000f50 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000f2a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000f2d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000f31:	7c d6                	jl     40000f09 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000f33:	85 f6                	test   %esi,%esi
40000f35:	74 02                	je     40000f39 <strtol+0xa9>
        *endptr = (char *) s;
40000f37:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000f39:	89 c8                	mov    %ecx,%eax
}
40000f3b:	5b                   	pop    %ebx
40000f3c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000f3d:	f7 d8                	neg    %eax
40000f3f:	85 ff                	test   %edi,%edi
}
40000f41:	5f                   	pop    %edi
40000f42:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000f43:	0f 45 c8             	cmovne %eax,%ecx
}
40000f46:	89 c8                	mov    %ecx,%eax
40000f48:	c3                   	ret
40000f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000f50:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000f53:	89 eb                	mov    %ebp,%ebx
40000f55:	80 fb 19             	cmp    $0x19,%bl
40000f58:	77 d9                	ja     40000f33 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000f5a:	83 e8 37             	sub    $0x37,%eax
40000f5d:	eb a4                	jmp    40000f03 <strtol+0x73>
40000f5f:	90                   	nop
        s++, neg = 1;
40000f60:	83 c2 01             	add    $0x1,%edx
40000f63:	bf 01 00 00 00       	mov    $0x1,%edi
40000f68:	e9 5c ff ff ff       	jmp    40000ec9 <strtol+0x39>
40000f6d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000f70:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000f73:	31 ff                	xor    %edi,%edi
40000f75:	e9 4f ff ff ff       	jmp    40000ec9 <strtol+0x39>
40000f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000f80:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000f84:	74 25                	je     40000fab <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000f86:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000f8a:	85 c0                	test   %eax,%eax
40000f8c:	74 0d                	je     40000f9b <strtol+0x10b>
40000f8e:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f95:	00 
40000f96:	e9 58 ff ff ff       	jmp    40000ef3 <strtol+0x63>
        s++, base = 8;
40000f9b:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000fa2:	00 
40000fa3:	83 c2 01             	add    $0x1,%edx
40000fa6:	e9 48 ff ff ff       	jmp    40000ef3 <strtol+0x63>
        s += 2, base = 16;
40000fab:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000fb2:	00 
40000fb3:	83 c2 02             	add    $0x2,%edx
40000fb6:	e9 38 ff ff ff       	jmp    40000ef3 <strtol+0x63>
40000fbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000fc0 <memset>:

void *memset(void *v, int c, size_t n)
{
40000fc0:	57                   	push   %edi
40000fc1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000fc5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000fc9:	85 c9                	test   %ecx,%ecx
40000fcb:	74 19                	je     40000fe6 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000fcd:	89 f8                	mov    %edi,%eax
40000fcf:	09 c8                	or     %ecx,%eax
40000fd1:	a8 03                	test   $0x3,%al
40000fd3:	75 1b                	jne    40000ff0 <memset+0x30>
        c &= 0xFF;
40000fd5:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000fda:	c1 e9 02             	shr    $0x2,%ecx
40000fdd:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000fe3:	fc                   	cld
40000fe4:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000fe6:	89 f8                	mov    %edi,%eax
40000fe8:	5f                   	pop    %edi
40000fe9:	c3                   	ret
40000fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000ff0:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ff4:	fc                   	cld
40000ff5:	f3 aa                	rep stos %al,%es:(%edi)
}
40000ff7:	89 f8                	mov    %edi,%eax
40000ff9:	5f                   	pop    %edi
40000ffa:	c3                   	ret
40000ffb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001000 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40001000:	57                   	push   %edi
40001001:	56                   	push   %esi
40001002:	8b 44 24 0c          	mov    0xc(%esp),%eax
40001006:	8b 74 24 10          	mov    0x10(%esp),%esi
4000100a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
4000100e:	39 c6                	cmp    %eax,%esi
40001010:	73 26                	jae    40001038 <memmove+0x38>
40001012:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40001015:	39 d0                	cmp    %edx,%eax
40001017:	73 1f                	jae    40001038 <memmove+0x38>
        s += n;
        d += n;
40001019:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
4000101c:	89 fe                	mov    %edi,%esi
4000101e:	09 ce                	or     %ecx,%esi
40001020:	09 d6                	or     %edx,%esi
40001022:	83 e6 03             	and    $0x3,%esi
40001025:	74 39                	je     40001060 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40001027:	83 ef 01             	sub    $0x1,%edi
4000102a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
4000102d:	fd                   	std
4000102e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40001030:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40001031:	5e                   	pop    %esi
40001032:	5f                   	pop    %edi
40001033:	c3                   	ret
40001034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40001038:	89 c2                	mov    %eax,%edx
4000103a:	09 ca                	or     %ecx,%edx
4000103c:	09 f2                	or     %esi,%edx
4000103e:	83 e2 03             	and    $0x3,%edx
40001041:	74 0d                	je     40001050 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40001043:	89 c7                	mov    %eax,%edi
40001045:	fc                   	cld
40001046:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40001048:	5e                   	pop    %esi
40001049:	5f                   	pop    %edi
4000104a:	c3                   	ret
4000104b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40001050:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40001053:	89 c7                	mov    %eax,%edi
40001055:	fc                   	cld
40001056:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001058:	eb ee                	jmp    40001048 <memmove+0x48>
4000105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40001060:	83 ef 04             	sub    $0x4,%edi
40001063:	8d 72 fc             	lea    -0x4(%edx),%esi
40001066:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40001069:	fd                   	std
4000106a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
4000106c:	eb c2                	jmp    40001030 <memmove+0x30>
4000106e:	66 90                	xchg   %ax,%ax

40001070 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40001070:	eb 8e                	jmp    40001000 <memmove>
40001072:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001079:	00 
4000107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001080 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40001080:	56                   	push   %esi
40001081:	53                   	push   %ebx
40001082:	8b 74 24 14          	mov    0x14(%esp),%esi
40001086:	8b 44 24 0c          	mov    0xc(%esp),%eax
4000108a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
4000108e:	85 f6                	test   %esi,%esi
40001090:	74 2e                	je     400010c0 <memcmp+0x40>
40001092:	01 c6                	add    %eax,%esi
40001094:	eb 14                	jmp    400010aa <memcmp+0x2a>
40001096:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000109d:	00 
4000109e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
400010a0:	83 c0 01             	add    $0x1,%eax
400010a3:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
400010a6:	39 f0                	cmp    %esi,%eax
400010a8:	74 16                	je     400010c0 <memcmp+0x40>
        if (*s1 != *s2)
400010aa:	0f b6 08             	movzbl (%eax),%ecx
400010ad:	0f b6 1a             	movzbl (%edx),%ebx
400010b0:	38 d9                	cmp    %bl,%cl
400010b2:	74 ec                	je     400010a0 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
400010b4:	0f b6 c1             	movzbl %cl,%eax
400010b7:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
400010b9:	5b                   	pop    %ebx
400010ba:	5e                   	pop    %esi
400010bb:	c3                   	ret
400010bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
400010c0:	31 c0                	xor    %eax,%eax
}
400010c2:	5b                   	pop    %ebx
400010c3:	5e                   	pop    %esi
400010c4:	c3                   	ret
400010c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400010cc:	00 
400010cd:	8d 76 00             	lea    0x0(%esi),%esi

400010d0 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
400010d0:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
400010d4:	8b 54 24 0c          	mov    0xc(%esp),%edx
400010d8:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
400010da:	39 d0                	cmp    %edx,%eax
400010dc:	73 1a                	jae    400010f8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
400010de:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
400010e3:	eb 0a                	jmp    400010ef <memchr+0x1f>
400010e5:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
400010e8:	83 c0 01             	add    $0x1,%eax
400010eb:	39 c2                	cmp    %eax,%edx
400010ed:	74 09                	je     400010f8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
400010ef:	38 08                	cmp    %cl,(%eax)
400010f1:	75 f5                	jne    400010e8 <memchr+0x18>
            return (void *) s;
    return NULL;
}
400010f3:	c3                   	ret
400010f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
400010f8:	31 c0                	xor    %eax,%eax
}
400010fa:	c3                   	ret
400010fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001100 <memzero>:

void *memzero(void *v, size_t n)
{
40001100:	57                   	push   %edi
40001101:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40001105:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40001109:	85 c9                	test   %ecx,%ecx
4000110b:	74 0f                	je     4000111c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
4000110d:	89 f8                	mov    %edi,%eax
4000110f:	09 c8                	or     %ecx,%eax
40001111:	83 e0 03             	and    $0x3,%eax
40001114:	75 0a                	jne    40001120 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40001116:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40001119:	fc                   	cld
4000111a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
4000111c:	89 f8                	mov    %edi,%eax
4000111e:	5f                   	pop    %edi
4000111f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001120:	31 c0                	xor    %eax,%eax
40001122:	fc                   	cld
40001123:	f3 aa                	rep stos %al,%es:(%edi)
}
40001125:	89 f8                	mov    %edi,%eax
40001127:	5f                   	pop    %edi
40001128:	c3                   	ret
40001129:	66 90                	xchg   %ax,%ax
4000112b:	66 90                	xchg   %ax,%ax
4000112d:	66 90                	xchg   %ax,%ax
4000112f:	90                   	nop

40001130 <process_cmd>:
{
40001130:	55                   	push   %ebp
40001131:	89 e5                	mov    %esp,%ebp
40001133:	57                   	push   %edi
40001134:	e8 7d 02 00 00       	call   400013b6 <__x86.get_pc_thunk.di>
40001139:	81 c7 bb 5e 00 00    	add    $0x5ebb,%edi
4000113f:	56                   	push   %esi
40001140:	53                   	push   %ebx
40001141:	83 ec 1c             	sub    $0x1c,%esp
    while (*line != '\0') {
40001144:	0f b6 10             	movzbl (%eax),%edx
40001147:	89 7d e4             	mov    %edi,-0x1c(%ebp)
4000114a:	84 d2                	test   %dl,%dl
4000114c:	0f 84 08 02 00 00    	je     4000135a <process_cmd+0x22a>
        while (*line == ' ') {
40001152:	80 fa 20             	cmp    $0x20,%dl
40001155:	0f 85 d6 00 00 00    	jne    40001231 <process_cmd+0x101>
4000115b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
40001162:	89 c1                	mov    %eax,%ecx
40001164:	31 f6                	xor    %esi,%esi
40001166:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000116d:	00 
4000116e:	66 90                	xchg   %ax,%ax
40001170:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
            line++;
40001174:	83 c1 01             	add    $0x1,%ecx
        while (*line == ' ') {
40001177:	80 fb 20             	cmp    $0x20,%bl
4000117a:	74 f4                	je     40001170 <process_cmd+0x40>
        if (*line == '-') {
4000117c:	80 fb 2d             	cmp    $0x2d,%bl
4000117f:	0f 84 8b 00 00 00    	je     40001210 <process_cmd+0xe0>
        else if (*line != '\0') {
40001185:	84 db                	test   %bl,%bl
40001187:	0f 85 b6 00 00 00    	jne    40001243 <process_cmd+0x113>
    argv = alloca(argc * sizeof(char *));
4000118d:	8d 0c b5 1b 00 00 00 	lea    0x1b(,%esi,4),%ecx
40001194:	89 e7                	mov    %esp,%edi
40001196:	89 cb                	mov    %ecx,%ebx
40001198:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
4000119e:	29 cf                	sub    %ecx,%edi
400011a0:	83 e3 f0             	and    $0xfffffff0,%ebx
400011a3:	39 fc                	cmp    %edi,%esp
400011a5:	74 12                	je     400011b9 <process_cmd+0x89>
400011a7:	81 ec 00 10 00 00    	sub    $0x1000,%esp
400011ad:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
400011b4:	00 
400011b5:	39 fc                	cmp    %edi,%esp
400011b7:	75 ee                	jne    400011a7 <process_cmd+0x77>
400011b9:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
400011bf:	29 dc                	sub    %ebx,%esp
400011c1:	85 db                	test   %ebx,%ebx
400011c3:	0f 85 8a 00 00 00    	jne    40001253 <process_cmd+0x123>
    optv = alloca(optc * sizeof(char *));
400011c9:	8b 7d e0             	mov    -0x20(%ebp),%edi
    argv = alloca(argc * sizeof(char *));
400011cc:	8d 4c 24 0f          	lea    0xf(%esp),%ecx
    optv = alloca(optc * sizeof(char *));
400011d0:	89 e3                	mov    %esp,%ebx
    argv = alloca(argc * sizeof(char *));
400011d2:	83 e1 f0             	and    $0xfffffff0,%ecx
400011d5:	89 4d dc             	mov    %ecx,-0x24(%ebp)
    optv = alloca(optc * sizeof(char *));
400011d8:	8d 0c bd 1b 00 00 00 	lea    0x1b(,%edi,4),%ecx
400011df:	89 cf                	mov    %ecx,%edi
400011e1:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
400011e7:	83 e7 f0             	and    $0xfffffff0,%edi
400011ea:	29 cb                	sub    %ecx,%ebx
400011ec:	39 dc                	cmp    %ebx,%esp
400011ee:	74 6d                	je     4000125d <process_cmd+0x12d>
400011f0:	81 ec 00 10 00 00    	sub    $0x1000,%esp
400011f6:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
400011fd:	00 
400011fe:	eb ec                	jmp    400011ec <process_cmd+0xbc>
        if (*line == '-') {
40001200:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
40001207:	89 c1                	mov    %eax,%ecx
40001209:	31 f6                	xor    %esi,%esi
4000120b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
            *optc += 1;
40001210:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        while (*line != ' ' && *line != '\0') {
40001214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001218:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
            line++;
4000121c:	83 c1 01             	add    $0x1,%ecx
        while (*line != ' ' && *line != '\0') {
4000121f:	f6 c3 df             	test   $0xdf,%bl
40001222:	75 f4                	jne    40001218 <process_cmd+0xe8>
    while (*line != '\0') {
40001224:	84 db                	test   %bl,%bl
40001226:	0f 85 44 ff ff ff    	jne    40001170 <process_cmd+0x40>
4000122c:	e9 5c ff ff ff       	jmp    4000118d <process_cmd+0x5d>
        if (*line == '-') {
40001231:	80 fa 2d             	cmp    $0x2d,%dl
40001234:	74 ca                	je     40001200 <process_cmd+0xd0>
40001236:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
        while (*line == ' ') {
4000123d:	89 d3                	mov    %edx,%ebx
        if (*line == '-') {
4000123f:	89 c1                	mov    %eax,%ecx
40001241:	31 f6                	xor    %esi,%esi
            *argc += 1;
40001243:	83 c6 01             	add    $0x1,%esi
        while (*line != ' ' && *line != '\0') {
40001246:	81 e3 df 00 00 00    	and    $0xdf,%ebx
4000124c:	75 ca                	jne    40001218 <process_cmd+0xe8>
4000124e:	e9 3a ff ff ff       	jmp    4000118d <process_cmd+0x5d>
    argv = alloca(argc * sizeof(char *));
40001253:	83 4c 1c fc 00       	orl    $0x0,-0x4(%esp,%ebx,1)
40001258:	e9 6c ff ff ff       	jmp    400011c9 <process_cmd+0x99>
    optv = alloca(optc * sizeof(char *));
4000125d:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
40001263:	29 fc                	sub    %edi,%esp
40001265:	85 ff                	test   %edi,%edi
40001267:	0f 85 3f 01 00 00    	jne    400013ac <process_cmd+0x27c>
4000126d:	8d 4c 24 0f          	lea    0xf(%esp),%ecx
40001271:	8b 5d dc             	mov    -0x24(%ebp),%ebx
40001274:	83 e1 f0             	and    $0xfffffff0,%ecx
40001277:	89 4d d8             	mov    %ecx,-0x28(%ebp)
    while (*line != '\0') {
4000127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        while (*line == ' ') {
40001280:	80 fa 20             	cmp    $0x20,%dl
40001283:	0f 85 87 00 00 00    	jne    40001310 <process_cmd+0x1e0>
40001289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
            line++;
40001294:	83 c0 01             	add    $0x1,%eax
        while (*line == ' ') {
40001297:	80 fa 20             	cmp    $0x20,%dl
4000129a:	74 f4                	je     40001290 <process_cmd+0x160>
        if (*line == '-') {
4000129c:	80 fa 2d             	cmp    $0x2d,%dl
4000129f:	74 77                	je     40001318 <process_cmd+0x1e8>
        else if (*line != '\0') {
400012a1:	84 d2                	test   %dl,%dl
400012a3:	0f 85 9f 00 00 00    	jne    40001348 <process_cmd+0x218>
    while (*line != '\0') {
400012a9:	0f b6 10             	movzbl (%eax),%edx
400012ac:	84 d2                	test   %dl,%dl
400012ae:	75 d0                	jne    40001280 <process_cmd+0x150>
    if (argc == 0) {
400012b0:	85 f6                	test   %esi,%esi
400012b2:	0f 84 a9 00 00 00    	je     40001361 <process_cmd+0x231>
    for (cmd = commands; cmd->func != NULL; cmd++) {
400012b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
400012bb:	8b 88 1c 00 00 00    	mov    0x1c(%eax),%ecx
400012c1:	8d b8 0c 00 00 00    	lea    0xc(%eax),%edi
400012c7:	85 c9                	test   %ecx,%ecx
400012c9:	74 36                	je     40001301 <process_cmd+0x1d1>
400012cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        arg_idx = cmd->infix ? 1 : 0;
400012d0:	31 c0                	xor    %eax,%eax
400012d2:	80 7f 04 00          	cmpb   $0x0,0x4(%edi)
400012d6:	0f 95 c0             	setne  %al
        if (arg_idx >= argc) {
400012d9:	39 f0                	cmp    %esi,%eax
400012db:	7d 1a                	jge    400012f7 <process_cmd+0x1c7>
        if (strcmp(argv[arg_idx], cmd->name) == 0) {
400012dd:	8b 5d dc             	mov    -0x24(%ebp),%ebx
400012e0:	83 ec 08             	sub    $0x8,%esp
400012e3:	ff 37                	push   (%edi)
400012e5:	ff 34 83             	push   (%ebx,%eax,4)
400012e8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
400012eb:	e8 80 fa ff ff       	call   40000d70 <strcmp>
400012f0:	83 c4 10             	add    $0x10,%esp
400012f3:	85 c0                	test   %eax,%eax
400012f5:	74 7c                	je     40001373 <process_cmd+0x243>
    for (cmd = commands; cmd->func != NULL; cmd++) {
400012f7:	8b 47 24             	mov    0x24(%edi),%eax
400012fa:	83 c7 14             	add    $0x14,%edi
400012fd:	85 c0                	test   %eax,%eax
400012ff:	75 cf                	jne    400012d0 <process_cmd+0x1a0>
    return E_INVAL_CMD;
40001301:	b8 01 00 00 00       	mov    $0x1,%eax
}
40001306:	8d 65 f4             	lea    -0xc(%ebp),%esp
40001309:	5b                   	pop    %ebx
4000130a:	5e                   	pop    %esi
4000130b:	5f                   	pop    %edi
4000130c:	5d                   	pop    %ebp
4000130d:	c3                   	ret
4000130e:	66 90                	xchg   %ax,%ax
        if (*line == '-') {
40001310:	80 fa 2d             	cmp    $0x2d,%dl
40001313:	75 33                	jne    40001348 <process_cmd+0x218>
40001315:	8d 76 00             	lea    0x0(%esi),%esi
            *optv = line;
40001318:	89 01                	mov    %eax,(%ecx)
            optv++;
4000131a:	83 c1 04             	add    $0x4,%ecx
        while (*line != ' ' && *line != '\0') {
4000131d:	8d 76 00             	lea    0x0(%esi),%esi
            line++;
40001320:	89 c7                	mov    %eax,%edi
        while (*line != ' ' && *line != '\0') {
40001322:	0f b6 50 01          	movzbl 0x1(%eax),%edx
            line++;
40001326:	83 c0 01             	add    $0x1,%eax
        while (*line != ' ' && *line != '\0') {
40001329:	f6 c2 df             	test   $0xdf,%dl
4000132c:	75 f2                	jne    40001320 <process_cmd+0x1f0>
        if (*line == ' ') {
4000132e:	80 fa 20             	cmp    $0x20,%dl
40001331:	0f 85 72 ff ff ff    	jne    400012a9 <process_cmd+0x179>
            *line = '\0';
40001337:	c6 00 00             	movb   $0x0,(%eax)
            line++;
4000133a:	8d 47 02             	lea    0x2(%edi),%eax
4000133d:	e9 67 ff ff ff       	jmp    400012a9 <process_cmd+0x179>
40001342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            *argv = line;
40001348:	89 03                	mov    %eax,(%ebx)
            argv++;
4000134a:	83 c3 04             	add    $0x4,%ebx
        while (*line != ' ' && *line != '\0') {
4000134d:	81 e2 df 00 00 00    	and    $0xdf,%edx
40001353:	75 cb                	jne    40001320 <process_cmd+0x1f0>
40001355:	e9 4f ff ff ff       	jmp    400012a9 <process_cmd+0x179>
    *optc = 0;
4000135a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
        return (optc == 0) ? E_OK : E_INVAL_CMD;
40001361:	8b 55 e0             	mov    -0x20(%ebp),%edx
40001364:	31 c0                	xor    %eax,%eax
40001366:	85 d2                	test   %edx,%edx
40001368:	0f 95 c0             	setne  %al
}
4000136b:	8d 65 f4             	lea    -0xc(%ebp),%esp
4000136e:	5b                   	pop    %ebx
4000136f:	5e                   	pop    %esi
40001370:	5f                   	pop    %edi
40001371:	5d                   	pop    %ebp
40001372:	c3                   	ret
                return E_FEW_ARGS;
40001373:	b8 02 00 00 00       	mov    $0x2,%eax
            if (cmd->minargs > argc - 1) {
40001378:	39 77 08             	cmp    %esi,0x8(%edi)
4000137b:	7d 89                	jge    40001306 <process_cmd+0x1d6>
            if (0 < cmd->maxargs && cmd->maxargs < argc - 1) {
4000137d:	8b 57 0c             	mov    0xc(%edi),%edx
40001380:	85 d2                	test   %edx,%edx
40001382:	7e 10                	jle    40001394 <process_cmd+0x264>
40001384:	8d 4e ff             	lea    -0x1(%esi),%ecx
                return E_MANY_ARGS;
40001387:	b8 03 00 00 00       	mov    $0x3,%eax
            if (0 < cmd->maxargs && cmd->maxargs < argc - 1) {
4000138c:	39 ca                	cmp    %ecx,%edx
4000138e:	0f 8c 72 ff ff ff    	jl     40001306 <process_cmd+0x1d6>
            return cmd->func(argc, argv, optc, optv);
40001394:	ff 75 d8             	push   -0x28(%ebp)
40001397:	ff 75 e0             	push   -0x20(%ebp)
4000139a:	ff 75 dc             	push   -0x24(%ebp)
4000139d:	56                   	push   %esi
4000139e:	ff 57 10             	call   *0x10(%edi)
400013a1:	83 c4 10             	add    $0x10,%esp
}
400013a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
400013a7:	5b                   	pop    %ebx
400013a8:	5e                   	pop    %esi
400013a9:	5f                   	pop    %edi
400013aa:	5d                   	pop    %ebp
400013ab:	c3                   	ret
    optv = alloca(optc * sizeof(char *));
400013ac:	83 4c 3c fc 00       	orl    $0x0,-0x4(%esp,%edi,1)
400013b1:	e9 b7 fe ff ff       	jmp    4000126d <process_cmd+0x13d>

400013b6 <__x86.get_pc_thunk.di>:
400013b6:	8b 3c 24             	mov    (%esp),%edi
400013b9:	c3                   	ret
400013ba:	66 90                	xchg   %ax,%ax
400013bc:	66 90                	xchg   %ax,%ax
400013be:	66 90                	xchg   %ax,%ax

400013c0 <recurse_dir>:
    ASSERT(*cwd == '/');
}

static err_t recurse_dir(char *name, err_t (*cmd)(int argc, char **argv, int optc, char **optv),
                         int optc, char **optv, int dir, char *src, char *dst)
{
400013c0:	55                   	push   %ebp
400013c1:	89 e5                	mov    %esp,%ebp
400013c3:	57                   	push   %edi
400013c4:	56                   	push   %esi
400013c5:	e8 3d 1b 00 00       	call   40002f07 <__x86.get_pc_thunk.si>
400013ca:	81 c6 2a 5c 00 00    	add    $0x5c2a,%esi
400013d0:	53                   	push   %ebx
400013d1:	83 ec 4c             	sub    $0x4c,%esp
    err_t ret = E_OK;
    struct dirent de;
    int argc = 3;
    char *sub_argv[3];
    sub_argv[0] = name;
400013d4:	89 45 cc             	mov    %eax,-0x34(%ebp)
{
400013d7:	8b 7d 0c             	mov    0xc(%ebp),%edi
    sub_argv[1] = alloca(CWD_SIZE);
400013da:	89 e0                	mov    %esp,%eax
{
400013dc:	89 55 b8             	mov    %edx,-0x48(%ebp)
400013df:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
400013e2:	89 75 c4             	mov    %esi,-0x3c(%ebp)
    sub_argv[1] = alloca(CWD_SIZE);
400013e5:	39 c4                	cmp    %eax,%esp
400013e7:	74 12                	je     400013fb <recurse_dir+0x3b>
400013e9:	81 ec 00 10 00 00    	sub    $0x1000,%esp
400013ef:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
400013f6:	00 
400013f7:	39 c4                	cmp    %eax,%esp
400013f9:	75 ee                	jne    400013e9 <recurse_dir+0x29>
400013fb:	81 ec b0 00 00 00    	sub    $0xb0,%esp
40001401:	83 8c 24 ac 00 00 00 	orl    $0x0,0xac(%esp)
40001408:	00 
    if (dst != NULL) {
40001409:	8b 55 14             	mov    0x14(%ebp),%edx
    sub_argv[1] = alloca(CWD_SIZE);
4000140c:	8d 44 24 0f          	lea    0xf(%esp),%eax
    int argc = 3;
40001410:	c7 45 ac 03 00 00 00 	movl   $0x3,-0x54(%ebp)
    sub_argv[1] = alloca(CWD_SIZE);
40001417:	83 e0 f0             	and    $0xfffffff0,%eax
4000141a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    if (dst != NULL) {
4000141d:	85 d2                	test   %edx,%edx
4000141f:	74 37                	je     40001458 <recurse_dir+0x98>
        sub_argv[2] = alloca(CWD_SIZE);
40001421:	89 e0                	mov    %esp,%eax
40001423:	39 c4                	cmp    %eax,%esp
40001425:	74 12                	je     40001439 <recurse_dir+0x79>
40001427:	81 ec 00 10 00 00    	sub    $0x1000,%esp
4000142d:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
40001434:	00 
40001435:	39 c4                	cmp    %eax,%esp
40001437:	75 ee                	jne    40001427 <recurse_dir+0x67>
40001439:	81 ec b0 00 00 00    	sub    $0xb0,%esp
4000143f:	83 8c 24 ac 00 00 00 	orl    $0x0,0xac(%esp)
40001446:	00 
40001447:	8d 44 24 0f          	lea    0xf(%esp),%eax
        argc = 2;
4000144b:	c7 45 ac 02 00 00 00 	movl   $0x2,-0x54(%ebp)
        sub_argv[2] = alloca(CWD_SIZE);
40001452:	83 e0 f0             	and    $0xfffffff0,%eax
40001455:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        argc = 2;
40001458:	8d 4d d8             	lea    -0x28(%ebp),%ecx
    asm volatile ("int %2"
4000145b:	be 06 00 00 00       	mov    $0x6,%esi
40001460:	ba 10 00 00 00       	mov    $0x10,%edx
40001465:	8d 76 00             	lea    0x0(%esi),%esi
40001468:	89 f0                	mov    %esi,%eax
4000146a:	89 fb                	mov    %edi,%ebx
4000146c:	cd 30                	int    $0x30
    }

    while (read(dir, (char *) &de, sizeof(struct dirent)) == sizeof(struct dirent)) {
4000146e:	85 c0                	test   %eax,%eax
40001470:	0f 85 ca 00 00 00    	jne    40001540 <recurse_dir+0x180>
40001476:	83 fb 10             	cmp    $0x10,%ebx
40001479:	0f 85 c1 00 00 00    	jne    40001540 <recurse_dir+0x180>
        if (de.inum != 0 && strcmp(de.name, ".") != 0 && strcmp(de.name, "..") != 0) {
4000147f:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
40001484:	74 e2                	je     40001468 <recurse_dir+0xa8>
40001486:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
40001489:	83 ec 08             	sub    $0x8,%esp
4000148c:	89 4d bc             	mov    %ecx,-0x44(%ebp)
4000148f:	89 55 c0             	mov    %edx,-0x40(%ebp)
40001492:	8d 83 e8 d3 ff ff    	lea    -0x2c18(%ebx),%eax
40001498:	50                   	push   %eax
40001499:	8d 45 da             	lea    -0x26(%ebp),%eax
4000149c:	89 45 b0             	mov    %eax,-0x50(%ebp)
4000149f:	50                   	push   %eax
400014a0:	e8 cb f8 ff ff       	call   40000d70 <strcmp>
400014a5:	83 c4 10             	add    $0x10,%esp
400014a8:	8b 55 c0             	mov    -0x40(%ebp),%edx
400014ab:	8b 4d bc             	mov    -0x44(%ebp),%ecx
400014ae:	85 c0                	test   %eax,%eax
400014b0:	74 b6                	je     40001468 <recurse_dir+0xa8>
400014b2:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
400014b5:	83 ec 08             	sub    $0x8,%esp
400014b8:	8d 83 e7 d3 ff ff    	lea    -0x2c19(%ebx),%eax
400014be:	50                   	push   %eax
400014bf:	ff 75 b0             	push   -0x50(%ebp)
400014c2:	e8 a9 f8 ff ff       	call   40000d70 <strcmp>
400014c7:	83 c4 10             	add    $0x10,%esp
400014ca:	8b 55 c0             	mov    -0x40(%ebp),%edx
400014cd:	8b 4d bc             	mov    -0x44(%ebp),%ecx
400014d0:	85 c0                	test   %eax,%eax
400014d2:	74 94                	je     40001468 <recurse_dir+0xa8>
            join_path(sub_argv[1], src, de.name);
400014d4:	83 ec 04             	sub    $0x4,%esp
400014d7:	ff 75 b0             	push   -0x50(%ebp)
400014da:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
400014dd:	ff 75 10             	push   0x10(%ebp)
400014e0:	ff 75 d0             	push   -0x30(%ebp)
400014e3:	e8 28 1a 00 00       	call   40002f10 <join_path>
            if (dst != NULL) {
400014e8:	8b 45 14             	mov    0x14(%ebp),%eax
400014eb:	83 c4 10             	add    $0x10,%esp
400014ee:	8b 55 c0             	mov    -0x40(%ebp),%edx
400014f1:	8b 4d bc             	mov    -0x44(%ebp),%ecx
400014f4:	85 c0                	test   %eax,%eax
400014f6:	74 1a                	je     40001512 <recurse_dir+0x152>
                join_path(sub_argv[2], dst, de.name);
400014f8:	83 ec 04             	sub    $0x4,%esp
400014fb:	ff 75 b0             	push   -0x50(%ebp)
400014fe:	ff 75 14             	push   0x14(%ebp)
40001501:	ff 75 d4             	push   -0x2c(%ebp)
40001504:	e8 07 1a 00 00       	call   40002f10 <join_path>
40001509:	8b 4d bc             	mov    -0x44(%ebp),%ecx
4000150c:	8b 55 c0             	mov    -0x40(%ebp),%edx
4000150f:	83 c4 10             	add    $0x10,%esp
            }
            if ((ret = (*cmd)(argc, sub_argv, optc, optv)) != E_OK) {
40001512:	8d 45 cc             	lea    -0x34(%ebp),%eax
40001515:	89 4d bc             	mov    %ecx,-0x44(%ebp)
40001518:	89 55 c0             	mov    %edx,-0x40(%ebp)
4000151b:	ff 75 08             	push   0x8(%ebp)
4000151e:	ff 75 b4             	push   -0x4c(%ebp)
40001521:	50                   	push   %eax
40001522:	ff 75 ac             	push   -0x54(%ebp)
40001525:	8b 45 b8             	mov    -0x48(%ebp),%eax
40001528:	ff d0                	call   *%eax
4000152a:	8b 55 c0             	mov    -0x40(%ebp),%edx
4000152d:	8b 4d bc             	mov    -0x44(%ebp),%ecx
40001530:	83 c4 10             	add    $0x10,%esp
40001533:	85 c0                	test   %eax,%eax
40001535:	0f 84 2d ff ff ff    	je     40001468 <recurse_dir+0xa8>
4000153b:	eb 05                	jmp    40001542 <recurse_dir+0x182>
4000153d:	8d 76 00             	lea    0x0(%esi),%esi
                return ret;
            }
        }
    }

    return ret;
40001540:	31 c0                	xor    %eax,%eax
}
40001542:	8d 65 f4             	lea    -0xc(%ebp),%esp
40001545:	5b                   	pop    %ebx
40001546:	5e                   	pop    %esi
40001547:	5f                   	pop    %edi
40001548:	5d                   	pop    %ebp
40001549:	c3                   	ret
4000154a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001550 <cmd_cp>:
    int len;
    char buf[1024];
    err_t ret = E_OK;
    bool recurse = FALSE;

    for (optc--; optc >= 0; optc--) {
40001550:	e8 4e f6 ff ff       	call   40000ba3 <__x86.get_pc_thunk.ax>
40001555:	05 9f 5a 00 00       	add    $0x5a9f,%eax
{
4000155a:	55                   	push   %ebp
4000155b:	57                   	push   %edi
4000155c:	56                   	push   %esi
4000155d:	53                   	push   %ebx
4000155e:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
    for (optc--; optc >= 0; optc--) {
40001564:	8b b4 24 58 04 00 00 	mov    0x458(%esp),%esi
4000156b:	89 44 24 04          	mov    %eax,0x4(%esp)
{
4000156f:	8b 94 24 54 04 00 00 	mov    0x454(%esp),%edx
40001576:	8b bc 24 5c 04 00 00 	mov    0x45c(%esp),%edi
    for (optc--; optc >= 0; optc--) {
4000157d:	83 ee 01             	sub    $0x1,%esi
40001580:	79 13                	jns    40001595 <cmd_cp+0x45>
40001582:	e9 46 02 00 00       	jmp    400017cd <cmd_cp+0x27d>
40001587:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000158e:	00 
4000158f:	90                   	nop
40001590:	83 ee 01             	sub    $0x1,%esi
40001593:	72 1b                	jb     400015b0 <cmd_cp+0x60>
        switch (optv[optc][1]) {
40001595:	8b 04 b7             	mov    (%edi,%esi,4),%eax
40001598:	80 78 01 72          	cmpb   $0x72,0x1(%eax)
4000159c:	74 f2                	je     40001590 <cmd_cp+0x40>
        case 'r':
            recurse = TRUE;
            break;
        default:
            return E_INVAL_OPT;
4000159e:	be 04 00 00 00       	mov    $0x4,%esi
    ASSERT(close(srcfd) != -1);
    if (dstfd > 0) {
        ASSERT(close(dstfd) != -1);
    }
    return ret;
}
400015a3:	81 c4 3c 04 00 00    	add    $0x43c,%esp
400015a9:	89 f0                	mov    %esi,%eax
400015ab:	5b                   	pop    %ebx
400015ac:	5e                   	pop    %esi
400015ad:	5f                   	pop    %edi
400015ae:	5d                   	pop    %ebp
400015af:	c3                   	ret
400015b0:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    dst = argv[2];
400015b5:	8b 42 08             	mov    0x8(%edx),%eax
    src = argv[1];
400015b8:	8b 6a 04             	mov    0x4(%edx),%ebp
    int len = strlen(path) + 1;
400015bb:	83 ec 0c             	sub    $0xc,%esp
    dst = argv[2];
400015be:	89 44 24 14          	mov    %eax,0x14(%esp)
400015c2:	55                   	push   %ebp
400015c3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400015c7:	e8 94 f6 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
400015cc:	31 c9                	xor    %ecx,%ecx
400015ce:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400015d0:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400015d3:	b8 04 00 00 00       	mov    $0x4,%eax
400015d8:	cd 30                	int    $0x30
400015da:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    return errno ? -1 : fd;
400015de:	83 c4 10             	add    $0x10,%esp
    if ((srcfd = open(src, O_RDONLY)) == -1) {
400015e1:	85 c0                	test   %eax,%eax
400015e3:	0f 85 da 01 00 00    	jne    400017c3 <cmd_cp+0x273>
400015e9:	83 fb ff             	cmp    $0xffffffff,%ebx
400015ec:	0f 84 d1 01 00 00    	je     400017c3 <cmd_cp+0x273>
    asm volatile ("int %2"
400015f2:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
400015f6:	b8 0c 00 00 00       	mov    $0xc,%eax
400015fb:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400015fd:	85 c0                	test   %eax,%eax
400015ff:	0f 85 2f 02 00 00    	jne    40001834 <cmd_cp+0x2e4>
    switch (stat.type) {
40001605:	0f b7 44 24 1c       	movzwl 0x1c(%esp),%eax
4000160a:	66 83 f8 01          	cmp    $0x1,%ax
4000160e:	0f 84 e4 00 00 00    	je     400016f8 <cmd_cp+0x1a8>
40001614:	66 83 f8 02          	cmp    $0x2,%ax
40001618:	0f 85 ba 00 00 00    	jne    400016d8 <cmd_cp+0x188>
    int len = strlen(path) + 1;
4000161e:	83 ec 0c             	sub    $0xc,%esp
40001621:	8b 7c 24 14          	mov    0x14(%esp),%edi
40001625:	57                   	push   %edi
40001626:	8b 5c 24 14          	mov    0x14(%esp),%ebx
4000162a:	e8 31 f6 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
4000162f:	b9 02 02 00 00       	mov    $0x202,%ecx
40001634:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001636:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001639:	b8 04 00 00 00       	mov    $0x4,%eax
4000163e:	cd 30                	int    $0x30
40001640:	89 de                	mov    %ebx,%esi
        ASSERT((dstfd = open(dst, O_CREATE | O_RDWR)) != -1);
40001642:	83 c4 10             	add    $0x10,%esp
40001645:	83 fb ff             	cmp    $0xffffffff,%ebx
40001648:	0f 84 89 01 00 00    	je     400017d7 <cmd_cp+0x287>
4000164e:	85 c0                	test   %eax,%eax
40001650:	0f 85 81 01 00 00    	jne    400017d7 <cmd_cp+0x287>
40001656:	8d 4c 24 30          	lea    0x30(%esp),%ecx
    asm volatile ("int %2"
4000165a:	bd 06 00 00 00       	mov    $0x6,%ebp
4000165f:	bf 00 04 00 00       	mov    $0x400,%edi
40001664:	eb 23                	jmp    40001689 <cmd_cp+0x139>
40001666:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000166d:	00 
4000166e:	66 90                	xchg   %ax,%ax
    asm volatile ("int %2"
40001670:	b8 07 00 00 00       	mov    $0x7,%eax
40001675:	89 f3                	mov    %esi,%ebx
40001677:	cd 30                	int    $0x30
    return errno ? -1 : ret;
40001679:	85 c0                	test   %eax,%eax
4000167b:	0f 85 0f 01 00 00    	jne    40001790 <cmd_cp+0x240>
            ASSERT(write(dstfd, buf, len) == len);
40001681:	39 d3                	cmp    %edx,%ebx
40001683:	0f 85 07 01 00 00    	jne    40001790 <cmd_cp+0x240>
    asm volatile ("int %2"
40001689:	8b 1c 24             	mov    (%esp),%ebx
4000168c:	89 e8                	mov    %ebp,%eax
4000168e:	89 fa                	mov    %edi,%edx
40001690:	cd 30                	int    $0x30
40001692:	89 da                	mov    %ebx,%edx
    return errno ? -1 : ret;
40001694:	85 c0                	test   %eax,%eax
40001696:	75 04                	jne    4000169c <cmd_cp+0x14c>
        while ((len = read(srcfd, buf, 1024)) > 0) {
40001698:	85 db                	test   %ebx,%ebx
4000169a:	7f d4                	jg     40001670 <cmd_cp+0x120>
    asm volatile ("int %2"
4000169c:	8b 1c 24             	mov    (%esp),%ebx
4000169f:	b8 05 00 00 00       	mov    $0x5,%eax
400016a4:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400016a6:	85 c0                	test   %eax,%eax
400016a8:	0f 85 dc 01 00 00    	jne    4000188a <cmd_cp+0x33a>
    if (dstfd > 0) {
400016ae:	85 f6                	test   %esi,%esi
400016b0:	7e 11                	jle    400016c3 <cmd_cp+0x173>
    asm volatile ("int %2"
400016b2:	b8 05 00 00 00       	mov    $0x5,%eax
400016b7:	89 f3                	mov    %esi,%ebx
400016b9:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400016bb:	85 c0                	test   %eax,%eax
400016bd:	0f 85 44 01 00 00    	jne    40001807 <cmd_cp+0x2b7>
    return ret;
400016c3:	31 f6                	xor    %esi,%esi
}
400016c5:	81 c4 3c 04 00 00    	add    $0x43c,%esp
400016cb:	89 f0                	mov    %esi,%eax
400016cd:	5b                   	pop    %ebx
400016ce:	5e                   	pop    %esi
400016cf:	5f                   	pop    %edi
400016d0:	5d                   	pop    %ebp
400016d1:	c3                   	ret
400016d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    asm volatile ("int %2"
400016d8:	8b 1c 24             	mov    (%esp),%ebx
400016db:	b8 05 00 00 00       	mov    $0x5,%eax
400016e0:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400016e2:	85 c0                	test   %eax,%eax
400016e4:	0f 85 75 01 00 00    	jne    4000185f <cmd_cp+0x30f>
    return ret;
400016ea:	be 05 00 00 00       	mov    $0x5,%esi
400016ef:	e9 af fe ff ff       	jmp    400015a3 <cmd_cp+0x53>
400016f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (!recurse) {
400016f8:	80 7c 24 0f 00       	cmpb   $0x0,0xf(%esp)
400016fd:	74 d9                	je     400016d8 <cmd_cp+0x188>
    int len = strlen(path) + 1;
400016ff:	83 ec 0c             	sub    $0xc,%esp
40001702:	ff 74 24 14          	push   0x14(%esp)
40001706:	8b 5c 24 14          	mov    0x14(%esp),%ebx
4000170a:	e8 51 f5 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
4000170f:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    int len = strlen(path) + 1;
40001713:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001716:	b8 08 00 00 00       	mov    $0x8,%eax
4000171b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000171d:	83 c4 10             	add    $0x10,%esp
40001720:	85 c0                	test   %eax,%eax
40001722:	0f 85 8d 01 00 00    	jne    400018b5 <cmd_cp+0x365>
        if ((ret = recurse_dir("cp", &cmd_cp, optc, optv, srcfd, src, dst)) != E_OK) {
40001728:	ff 74 24 08          	push   0x8(%esp)
4000172c:	89 f1                	mov    %esi,%ecx
4000172e:	55                   	push   %ebp
4000172f:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001733:	53                   	push   %ebx
40001734:	57                   	push   %edi
40001735:	8b 44 24 14          	mov    0x14(%esp),%eax
40001739:	8d 90 5c a5 ff ff    	lea    -0x5aa4(%eax),%edx
4000173f:	8d 80 a6 d0 ff ff    	lea    -0x2f5a(%eax),%eax
40001745:	e8 76 fc ff ff       	call   400013c0 <recurse_dir>
4000174a:	89 c6                	mov    %eax,%esi
    asm volatile ("int %2"
4000174c:	b8 05 00 00 00       	mov    $0x5,%eax
40001751:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001753:	83 c4 10             	add    $0x10,%esp
40001756:	85 c0                	test   %eax,%eax
40001758:	0f 84 45 fe ff ff    	je     400015a3 <cmd_cp+0x53>
    ASSERT(close(srcfd) != -1);
4000175e:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001762:	8d 83 9e d1 ff ff    	lea    -0x2e62(%ebx),%eax
40001768:	50                   	push   %eax
40001769:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
4000176f:	50                   	push   %eax
40001770:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40001776:	68 c9 00 00 00       	push   $0xc9
4000177b:	50                   	push   %eax
4000177c:	e8 cf ea ff ff       	call   40000250 <panic>
40001781:	83 c4 10             	add    $0x10,%esp
40001784:	e9 1a fe ff ff       	jmp    400015a3 <cmd_cp+0x53>
40001789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            ASSERT(write(dstfd, buf, len) == len);
40001790:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001794:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40001798:	8d 83 65 d1 ff ff    	lea    -0x2e9b(%ebx),%eax
4000179e:	50                   	push   %eax
4000179f:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
400017a5:	50                   	push   %eax
400017a6:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
400017ac:	68 b6 00 00 00       	push   $0xb6
400017b1:	50                   	push   %eax
400017b2:	e8 99 ea ff ff       	call   40000250 <panic>
400017b7:	83 c4 10             	add    $0x10,%esp
400017ba:	8b 4c 24 08          	mov    0x8(%esp),%ecx
400017be:	e9 c6 fe ff ff       	jmp    40001689 <cmd_cp+0x139>
        return E_CANT_OPEN;
400017c3:	be 06 00 00 00       	mov    $0x6,%esi
400017c8:	e9 d6 fd ff ff       	jmp    400015a3 <cmd_cp+0x53>
    bool recurse = FALSE;
400017cd:	c6 44 24 0f 00       	movb   $0x0,0xf(%esp)
400017d2:	e9 de fd ff ff       	jmp    400015b5 <cmd_cp+0x65>
        ASSERT((dstfd = open(dst, O_CREATE | O_RDWR)) != -1);
400017d7:	8b 5c 24 04          	mov    0x4(%esp),%ebx
400017db:	be ff ff ff ff       	mov    $0xffffffff,%esi
400017e0:	8d 83 14 d6 ff ff    	lea    -0x29ec(%ebx),%eax
400017e6:	50                   	push   %eax
400017e7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
400017ed:	50                   	push   %eax
400017ee:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
400017f4:	68 b4 00 00 00       	push   $0xb4
400017f9:	50                   	push   %eax
400017fa:	e8 51 ea ff ff       	call   40000250 <panic>
400017ff:	83 c4 10             	add    $0x10,%esp
40001802:	e9 4f fe ff ff       	jmp    40001656 <cmd_cp+0x106>
        ASSERT(close(dstfd) != -1);
40001807:	8b 5c 24 04          	mov    0x4(%esp),%ebx
    return ret;
4000180b:	31 f6                	xor    %esi,%esi
        ASSERT(close(dstfd) != -1);
4000180d:	8d 83 b1 d1 ff ff    	lea    -0x2e4f(%ebx),%eax
40001813:	50                   	push   %eax
40001814:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
4000181a:	50                   	push   %eax
4000181b:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40001821:	68 cb 00 00 00       	push   $0xcb
40001826:	50                   	push   %eax
40001827:	e8 24 ea ff ff       	call   40000250 <panic>
4000182c:	83 c4 10             	add    $0x10,%esp
4000182f:	e9 91 fe ff ff       	jmp    400016c5 <cmd_cp+0x175>
    ASSERT(fstat(srcfd, &stat) != -1);
40001834:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001838:	8d 83 35 d1 ff ff    	lea    -0x2ecb(%ebx),%eax
4000183e:	50                   	push   %eax
4000183f:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40001845:	50                   	push   %eax
40001846:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
4000184c:	68 b0 00 00 00       	push   $0xb0
40001851:	50                   	push   %eax
40001852:	e8 f9 e9 ff ff       	call   40000250 <panic>
40001857:	83 c4 10             	add    $0x10,%esp
4000185a:	e9 a6 fd ff ff       	jmp    40001605 <cmd_cp+0xb5>
    ASSERT(close(srcfd) != -1);
4000185f:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001863:	8d 83 9e d1 ff ff    	lea    -0x2e62(%ebx),%eax
40001869:	50                   	push   %eax
4000186a:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40001870:	50                   	push   %eax
40001871:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40001877:	68 c9 00 00 00       	push   $0xc9
4000187c:	50                   	push   %eax
4000187d:	e8 ce e9 ff ff       	call   40000250 <panic>
40001882:	83 c4 10             	add    $0x10,%esp
40001885:	e9 60 fe ff ff       	jmp    400016ea <cmd_cp+0x19a>
4000188a:	8b 5c 24 04          	mov    0x4(%esp),%ebx
4000188e:	8d 83 9e d1 ff ff    	lea    -0x2e62(%ebx),%eax
40001894:	50                   	push   %eax
40001895:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
4000189b:	50                   	push   %eax
4000189c:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
400018a2:	68 c9 00 00 00       	push   $0xc9
400018a7:	50                   	push   %eax
400018a8:	e8 a3 e9 ff ff       	call   40000250 <panic>
400018ad:	83 c4 10             	add    $0x10,%esp
400018b0:	e9 f9 fd ff ff       	jmp    400016ae <cmd_cp+0x15e>
        ASSERT((dstfd = mkdir(dst)) != -1);
400018b5:	8b 5c 24 04          	mov    0x4(%esp),%ebx
400018b9:	8d 83 83 d1 ff ff    	lea    -0x2e7d(%ebx),%eax
400018bf:	50                   	push   %eax
400018c0:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
400018c6:	50                   	push   %eax
400018c7:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
400018cd:	68 be 00 00 00       	push   $0xbe
400018d2:	50                   	push   %eax
400018d3:	e8 78 e9 ff ff       	call   40000250 <panic>
400018d8:	83 c4 10             	add    $0x10,%esp
400018db:	e9 48 fe ff ff       	jmp    40001728 <cmd_cp+0x1d8>

400018e0 <cmd_rm>:
    int fd;
    struct file_stat stat;
    err_t ret = E_OK;
    bool recurse = FALSE;

    for (optc--; optc >= 0; optc--) {
400018e0:	e8 be f2 ff ff       	call   40000ba3 <__x86.get_pc_thunk.ax>
400018e5:	05 0f 57 00 00       	add    $0x570f,%eax
{
400018ea:	55                   	push   %ebp
400018eb:	57                   	push   %edi
400018ec:	56                   	push   %esi
400018ed:	53                   	push   %ebx
400018ee:	83 ec 3c             	sub    $0x3c,%esp
    for (optc--; optc >= 0; optc--) {
400018f1:	8b 74 24 58          	mov    0x58(%esp),%esi
{
400018f5:	8b 7c 24 5c          	mov    0x5c(%esp),%edi
400018f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    for (optc--; optc >= 0; optc--) {
400018fd:	83 ee 01             	sub    $0x1,%esi
40001900:	79 13                	jns    40001915 <cmd_rm+0x35>
40001902:	e9 50 01 00 00       	jmp    40001a57 <cmd_rm+0x177>
40001907:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000190e:	00 
4000190f:	90                   	nop
40001910:	83 ee 01             	sub    $0x1,%esi
40001913:	72 1b                	jb     40001930 <cmd_rm+0x50>
        switch (optv[optc][1]) {
40001915:	8b 04 b7             	mov    (%edi,%esi,4),%eax
40001918:	80 78 01 72          	cmpb   $0x72,0x1(%eax)
4000191c:	74 f2                	je     40001910 <cmd_rm+0x30>
        case 'r':
            recurse = TRUE;
            break;
        default:
            return E_INVAL_OPT;
4000191e:	ba 04 00 00 00       	mov    $0x4,%edx
    ASSERT(unlink(path) != -1);

end:
    ASSERT(close(fd) != -1);
    return ret;
}
40001923:	83 c4 3c             	add    $0x3c,%esp
40001926:	89 d0                	mov    %edx,%eax
40001928:	5b                   	pop    %ebx
40001929:	5e                   	pop    %esi
4000192a:	5f                   	pop    %edi
4000192b:	5d                   	pop    %ebp
4000192c:	c3                   	ret
4000192d:	8d 76 00             	lea    0x0(%esi),%esi
40001930:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    path = argv[1];
40001935:	8b 44 24 54          	mov    0x54(%esp),%eax
    int len = strlen(path) + 1;
40001939:	83 ec 0c             	sub    $0xc,%esp
4000193c:	8b 68 04             	mov    0x4(%eax),%ebp
4000193f:	55                   	push   %ebp
40001940:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001944:	e8 17 f3 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40001949:	31 c9                	xor    %ecx,%ecx
4000194b:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
4000194d:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001950:	b8 04 00 00 00       	mov    $0x4,%eax
40001955:	cd 30                	int    $0x30
40001957:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    if ((fd = open(path, O_RDONLY)) == -1) {
4000195b:	83 c4 10             	add    $0x10,%esp
4000195e:	83 fb ff             	cmp    $0xffffffff,%ebx
40001961:	0f 84 e6 00 00 00    	je     40001a4d <cmd_rm+0x16d>
40001967:	85 c0                	test   %eax,%eax
40001969:	0f 85 de 00 00 00    	jne    40001a4d <cmd_rm+0x16d>
    asm volatile ("int %2"
4000196f:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
40001973:	b8 0c 00 00 00       	mov    $0xc,%eax
40001978:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000197a:	85 c0                	test   %eax,%eax
4000197c:	0f 85 0c 01 00 00    	jne    40001a8e <cmd_rm+0x1ae>
    switch (stat.type) {
40001982:	0f b7 44 24 1c       	movzwl 0x1c(%esp),%eax
40001987:	66 83 f8 01          	cmp    $0x1,%ax
4000198b:	0f 84 7f 00 00 00    	je     40001a10 <cmd_rm+0x130>
            ret = E_INVAL_TYPE;
40001991:	ba 05 00 00 00       	mov    $0x5,%edx
    switch (stat.type) {
40001996:	66 83 f8 02          	cmp    $0x2,%ax
4000199a:	75 2c                	jne    400019c8 <cmd_rm+0xe8>
    int len = strlen(path) + 1;
4000199c:	83 ec 0c             	sub    $0xc,%esp
4000199f:	55                   	push   %ebp
400019a0:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400019a4:	e8 b7 f2 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
400019a9:	89 eb                	mov    %ebp,%ebx
    int len = strlen(path) + 1;
400019ab:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
400019ae:	b8 0b 00 00 00       	mov    $0xb,%eax
400019b3:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400019b5:	83 c4 10             	add    $0x10,%esp
400019b8:	85 c0                	test   %eax,%eax
400019ba:	0f 85 a1 00 00 00    	jne    40001a61 <cmd_rm+0x181>
            ret = E_INVAL_TYPE;
400019c0:	31 d2                	xor    %edx,%edx
400019c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    asm volatile ("int %2"
400019c8:	8b 5c 24 08          	mov    0x8(%esp),%ebx
400019cc:	b8 05 00 00 00       	mov    $0x5,%eax
400019d1:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400019d3:	85 c0                	test   %eax,%eax
400019d5:	0f 84 48 ff ff ff    	je     40001923 <cmd_rm+0x43>
    ASSERT(close(fd) != -1);
400019db:	8b 5c 24 04          	mov    0x4(%esp),%ebx
400019df:	89 54 24 08          	mov    %edx,0x8(%esp)
400019e3:	8d 83 ee d1 ff ff    	lea    -0x2e12(%ebx),%eax
400019e9:	50                   	push   %eax
400019ea:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
400019f0:	50                   	push   %eax
400019f1:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
400019f7:	68 26 01 00 00       	push   $0x126
400019fc:	50                   	push   %eax
400019fd:	e8 4e e8 ff ff       	call   40000250 <panic>
40001a02:	83 c4 10             	add    $0x10,%esp
40001a05:	8b 54 24 08          	mov    0x8(%esp),%edx
40001a09:	e9 15 ff ff ff       	jmp    40001923 <cmd_rm+0x43>
40001a0e:	66 90                	xchg   %ax,%ax
        if (!recurse) {
40001a10:	80 7c 24 0f 00       	cmpb   $0x0,0xf(%esp)
            ret = E_INVAL_TYPE;
40001a15:	ba 05 00 00 00       	mov    $0x5,%edx
        if (!recurse) {
40001a1a:	74 ac                	je     400019c8 <cmd_rm+0xe8>
        if ((ret = recurse_dir("rm", &cmd_rm, optc, optv, fd, path, NULL)) != E_OK) {
40001a1c:	6a 00                	push   $0x0
40001a1e:	89 f1                	mov    %esi,%ecx
40001a20:	55                   	push   %ebp
40001a21:	ff 74 24 10          	push   0x10(%esp)
40001a25:	57                   	push   %edi
40001a26:	8b 44 24 14          	mov    0x14(%esp),%eax
40001a2a:	8d 90 ec a8 ff ff    	lea    -0x5714(%eax),%edx
40001a30:	8d 80 ac d0 ff ff    	lea    -0x2f54(%eax),%eax
40001a36:	e8 85 f9 ff ff       	call   400013c0 <recurse_dir>
40001a3b:	83 c4 10             	add    $0x10,%esp
40001a3e:	89 c2                	mov    %eax,%edx
40001a40:	85 c0                	test   %eax,%eax
40001a42:	0f 84 54 ff ff ff    	je     4000199c <cmd_rm+0xbc>
40001a48:	e9 7b ff ff ff       	jmp    400019c8 <cmd_rm+0xe8>
        return E_CANT_OPEN;
40001a4d:	ba 06 00 00 00       	mov    $0x6,%edx
40001a52:	e9 cc fe ff ff       	jmp    40001923 <cmd_rm+0x43>
    bool recurse = FALSE;
40001a57:	c6 44 24 0f 00       	movb   $0x0,0xf(%esp)
40001a5c:	e9 d4 fe ff ff       	jmp    40001935 <cmd_rm+0x55>
    ASSERT(unlink(path) != -1);
40001a61:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001a65:	8d 83 db d1 ff ff    	lea    -0x2e25(%ebx),%eax
40001a6b:	50                   	push   %eax
40001a6c:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40001a72:	50                   	push   %eax
40001a73:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40001a79:	68 23 01 00 00       	push   $0x123
40001a7e:	50                   	push   %eax
40001a7f:	e8 cc e7 ff ff       	call   40000250 <panic>
40001a84:	83 c4 10             	add    $0x10,%esp
            ret = E_INVAL_TYPE;
40001a87:	31 d2                	xor    %edx,%edx
40001a89:	e9 3a ff ff ff       	jmp    400019c8 <cmd_rm+0xe8>
    ASSERT(fstat(fd, &stat) != -1);
40001a8e:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001a92:	8d 83 c4 d1 ff ff    	lea    -0x2e3c(%ebx),%eax
40001a98:	50                   	push   %eax
40001a99:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40001a9f:	50                   	push   %eax
40001aa0:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40001aa6:	68 10 01 00 00       	push   $0x110
40001aab:	50                   	push   %eax
40001aac:	e8 9f e7 ff ff       	call   40000250 <panic>
40001ab1:	83 c4 10             	add    $0x10,%esp
40001ab4:	e9 c9 fe ff ff       	jmp    40001982 <cmd_rm+0xa2>
40001ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40001ac0 <cmd_mv>:
{
40001ac0:	55                   	push   %ebp
40001ac1:	e8 45 14 00 00       	call   40002f0b <__x86.get_pc_thunk.bp>
40001ac6:	81 c5 2e 55 00 00    	add    $0x552e,%ebp
40001acc:	57                   	push   %edi
40001acd:	56                   	push   %esi
        return E_INVAL_OPT;
40001ace:	be 04 00 00 00       	mov    $0x4,%esi
{
40001ad3:	53                   	push   %ebx
40001ad4:	83 ec 3c             	sub    $0x3c,%esp
    if (optc > 0) {
40001ad7:	8b 54 24 58          	mov    0x58(%esp),%edx
{
40001adb:	8b 44 24 54          	mov    0x54(%esp),%eax
    if (optc > 0) {
40001adf:	85 d2                	test   %edx,%edx
40001ae1:	0f 8f d0 00 00 00    	jg     40001bb7 <cmd_mv+0xf7>
    src = argv[1];
40001ae7:	8b 78 04             	mov    0x4(%eax),%edi
    dst = argv[2];
40001aea:	8b 40 08             	mov    0x8(%eax),%eax
    int len = strlen(path) + 1;
40001aed:	83 ec 0c             	sub    $0xc,%esp
40001af0:	89 eb                	mov    %ebp,%ebx
40001af2:	89 44 24 18          	mov    %eax,0x18(%esp)
40001af6:	57                   	push   %edi
40001af7:	e8 64 f1 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40001afc:	31 c9                	xor    %ecx,%ecx
40001afe:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001b00:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001b03:	89 f0                	mov    %esi,%eax
40001b05:	cd 30                	int    $0x30
40001b07:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    if ((fd = open(src, O_RDONLY)) == -1) {
40001b0b:	83 c4 10             	add    $0x10,%esp
40001b0e:	83 fb ff             	cmp    $0xffffffff,%ebx
40001b11:	0f 84 b1 00 00 00    	je     40001bc8 <cmd_mv+0x108>
40001b17:	85 c0                	test   %eax,%eax
40001b19:	0f 85 a9 00 00 00    	jne    40001bc8 <cmd_mv+0x108>
    asm volatile ("int %2"
40001b1f:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
40001b23:	b8 0c 00 00 00       	mov    $0xc,%eax
40001b28:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001b2a:	85 c0                	test   %eax,%eax
40001b2c:	0f 85 49 01 00 00    	jne    40001c7b <cmd_mv+0x1bb>
    switch (stat.type) {
40001b32:	0f b7 44 24 1c       	movzwl 0x1c(%esp),%eax
40001b37:	66 83 f8 01          	cmp    $0x1,%ax
40001b3b:	0f 84 8f 00 00 00    	je     40001bd0 <cmd_mv+0x110>
40001b41:	be 05 00 00 00       	mov    $0x5,%esi
40001b46:	66 83 f8 02          	cmp    $0x2,%ax
40001b4a:	75 5c                	jne    40001ba8 <cmd_mv+0xe8>
    int oldlen = strlen(old) + 1;
40001b4c:	83 ec 0c             	sub    $0xc,%esp
40001b4f:	89 eb                	mov    %ebp,%ebx
40001b51:	57                   	push   %edi
40001b52:	e8 09 f1 ff ff       	call   40000c60 <strlen>
40001b57:	89 c6                	mov    %eax,%esi
    int newlen = strlen(new) + 1;
40001b59:	58                   	pop    %eax
40001b5a:	ff 74 24 18          	push   0x18(%esp)
40001b5e:	e8 fd f0 ff ff       	call   40000c60 <strlen>
    int oldlen = strlen(old) + 1;
40001b63:	8d 56 01             	lea    0x1(%esi),%edx
    asm volatile ("int %2"
40001b66:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
40001b6a:	89 fb                	mov    %edi,%ebx
    int newlen = strlen(new) + 1;
40001b6c:	8d 70 01             	lea    0x1(%eax),%esi
    asm volatile ("int %2"
40001b6f:	b8 0a 00 00 00       	mov    $0xa,%eax
40001b74:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001b76:	83 c4 10             	add    $0x10,%esp
40001b79:	85 c0                	test   %eax,%eax
40001b7b:	0f 85 4c 01 00 00    	jne    40001ccd <cmd_mv+0x20d>
    int len = strlen(path) + 1;
40001b81:	83 ec 0c             	sub    $0xc,%esp
40001b84:	89 eb                	mov    %ebp,%ebx
40001b86:	57                   	push   %edi
40001b87:	e8 d4 f0 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40001b8c:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001b8e:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001b91:	b8 0b 00 00 00       	mov    $0xb,%eax
40001b96:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001b98:	83 c4 10             	add    $0x10,%esp
40001b9b:	85 c0                	test   %eax,%eax
40001b9d:	0f 85 ad 00 00 00    	jne    40001c50 <cmd_mv+0x190>
40001ba3:	31 f6                	xor    %esi,%esi
40001ba5:	8d 76 00             	lea    0x0(%esi),%esi
    asm volatile ("int %2"
40001ba8:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001bac:	b8 05 00 00 00       	mov    $0x5,%eax
40001bb1:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001bb3:	85 c0                	test   %eax,%eax
40001bb5:	75 70                	jne    40001c27 <cmd_mv+0x167>
}
40001bb7:	83 c4 3c             	add    $0x3c,%esp
40001bba:	89 f0                	mov    %esi,%eax
40001bbc:	5b                   	pop    %ebx
40001bbd:	5e                   	pop    %esi
40001bbe:	5f                   	pop    %edi
40001bbf:	5d                   	pop    %ebp
40001bc0:	c3                   	ret
40001bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        return E_CANT_OPEN;
40001bc8:	be 06 00 00 00       	mov    $0x6,%esi
40001bcd:	eb e8                	jmp    40001bb7 <cmd_mv+0xf7>
40001bcf:	90                   	nop
    int len = strlen(path) + 1;
40001bd0:	83 ec 0c             	sub    $0xc,%esp
40001bd3:	89 eb                	mov    %ebp,%ebx
40001bd5:	8b 74 24 18          	mov    0x18(%esp),%esi
40001bd9:	56                   	push   %esi
40001bda:	e8 81 f0 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40001bdf:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001be1:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001be4:	b8 08 00 00 00       	mov    $0x8,%eax
40001be9:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001beb:	83 c4 10             	add    $0x10,%esp
40001bee:	85 c0                	test   %eax,%eax
40001bf0:	0f 85 ae 00 00 00    	jne    40001ca4 <cmd_mv+0x1e4>
        if ((ret = recurse_dir("mv", &cmd_mv, optc, optv, fd, src, dst)) != E_OK) {
40001bf6:	ff 74 24 0c          	push   0xc(%esp)
40001bfa:	8d 95 cc aa ff ff    	lea    -0x5534(%ebp),%edx
40001c00:	8d 85 a9 d0 ff ff    	lea    -0x2f57(%ebp),%eax
40001c06:	57                   	push   %edi
40001c07:	ff 74 24 10          	push   0x10(%esp)
40001c0b:	ff 74 24 68          	push   0x68(%esp)
40001c0f:	8b 4c 24 68          	mov    0x68(%esp),%ecx
40001c13:	e8 a8 f7 ff ff       	call   400013c0 <recurse_dir>
40001c18:	83 c4 10             	add    $0x10,%esp
40001c1b:	89 c6                	mov    %eax,%esi
40001c1d:	85 c0                	test   %eax,%eax
40001c1f:	0f 84 5c ff ff ff    	je     40001b81 <cmd_mv+0xc1>
40001c25:	eb 81                	jmp    40001ba8 <cmd_mv+0xe8>
    ASSERT(close(fd) != -1);
40001c27:	8d 85 ee d1 ff ff    	lea    -0x2e12(%ebp),%eax
40001c2d:	89 eb                	mov    %ebp,%ebx
40001c2f:	50                   	push   %eax
40001c30:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40001c36:	50                   	push   %eax
40001c37:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
40001c3d:	68 f5 00 00 00       	push   $0xf5
40001c42:	50                   	push   %eax
40001c43:	e8 08 e6 ff ff       	call   40000250 <panic>
40001c48:	83 c4 10             	add    $0x10,%esp
40001c4b:	e9 67 ff ff ff       	jmp    40001bb7 <cmd_mv+0xf7>
    ASSERT(unlink(src) != -1);
40001c50:	8d 85 24 d2 ff ff    	lea    -0x2ddc(%ebp),%eax
40001c56:	89 eb                	mov    %ebp,%ebx
    switch (stat.type) {
40001c58:	31 f6                	xor    %esi,%esi
    ASSERT(unlink(src) != -1);
40001c5a:	50                   	push   %eax
40001c5b:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40001c61:	50                   	push   %eax
40001c62:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
40001c68:	68 f2 00 00 00       	push   $0xf2
40001c6d:	50                   	push   %eax
40001c6e:	e8 dd e5 ff ff       	call   40000250 <panic>
40001c73:	83 c4 10             	add    $0x10,%esp
40001c76:	e9 2d ff ff ff       	jmp    40001ba8 <cmd_mv+0xe8>
    ASSERT(fstat(fd, &stat) != -1);
40001c7b:	8d 85 c4 d1 ff ff    	lea    -0x2e3c(%ebp),%eax
40001c81:	89 eb                	mov    %ebp,%ebx
40001c83:	50                   	push   %eax
40001c84:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40001c8a:	50                   	push   %eax
40001c8b:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
40001c91:	68 e1 00 00 00       	push   $0xe1
40001c96:	50                   	push   %eax
40001c97:	e8 b4 e5 ff ff       	call   40000250 <panic>
40001c9c:	83 c4 10             	add    $0x10,%esp
40001c9f:	e9 8e fe ff ff       	jmp    40001b32 <cmd_mv+0x72>
        ASSERT(mkdir(dst) != -1);
40001ca4:	8d 85 13 d2 ff ff    	lea    -0x2ded(%ebp),%eax
40001caa:	89 eb                	mov    %ebp,%ebx
40001cac:	50                   	push   %eax
40001cad:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40001cb3:	50                   	push   %eax
40001cb4:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
40001cba:	68 e8 00 00 00       	push   $0xe8
40001cbf:	50                   	push   %eax
40001cc0:	e8 8b e5 ff ff       	call   40000250 <panic>
40001cc5:	83 c4 10             	add    $0x10,%esp
40001cc8:	e9 29 ff ff ff       	jmp    40001bf6 <cmd_mv+0x136>
        ASSERT(link(src, dst) != -1);
40001ccd:	8d 85 fe d1 ff ff    	lea    -0x2e02(%ebp),%eax
40001cd3:	89 eb                	mov    %ebp,%ebx
40001cd5:	50                   	push   %eax
40001cd6:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40001cdc:	50                   	push   %eax
40001cdd:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
40001ce3:	68 e5 00 00 00       	push   $0xe5
40001ce8:	50                   	push   %eax
40001ce9:	e8 62 e5 ff ff       	call   40000250 <panic>
40001cee:	83 c4 10             	add    $0x10,%esp
40001cf1:	e9 8b fe ff ff       	jmp    40001b81 <cmd_mv+0xc1>
40001cf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001cfd:	00 
40001cfe:	66 90                	xchg   %ax,%ax

40001d00 <cmd_ls>:
{
40001d00:	55                   	push   %ebp
40001d01:	57                   	push   %edi
40001d02:	e8 af f6 ff ff       	call   400013b6 <__x86.get_pc_thunk.di>
40001d07:	81 c7 ed 52 00 00    	add    $0x52ed,%edi
40001d0d:	56                   	push   %esi
40001d0e:	53                   	push   %ebx
40001d0f:	83 ec 5c             	sub    $0x5c,%esp
    for (optc--; optc >= 0; optc--) {
40001d12:	8b 44 24 78          	mov    0x78(%esp),%eax
{
40001d16:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
    for (optc--; optc >= 0; optc--) {
40001d1a:	83 e8 01             	sub    $0x1,%eax
40001d1d:	79 0e                	jns    40001d2d <cmd_ls+0x2d>
40001d1f:	e9 93 01 00 00       	jmp    40001eb7 <cmd_ls+0x1b7>
40001d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001d28:	83 e8 01             	sub    $0x1,%eax
40001d2b:	72 1b                	jb     40001d48 <cmd_ls+0x48>
        switch (optv[optc][1]) {
40001d2d:	8b 14 81             	mov    (%ecx,%eax,4),%edx
40001d30:	80 7a 01 61          	cmpb   $0x61,0x1(%edx)
40001d34:	74 f2                	je     40001d28 <cmd_ls+0x28>
            return E_INVAL_OPT;
40001d36:	b8 04 00 00 00       	mov    $0x4,%eax
}
40001d3b:	83 c4 5c             	add    $0x5c,%esp
40001d3e:	5b                   	pop    %ebx
40001d3f:	5e                   	pop    %esi
40001d40:	5f                   	pop    %edi
40001d41:	5d                   	pop    %ebp
40001d42:	c3                   	ret
40001d43:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40001d48:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    argv++;  // Skip command
40001d4d:	8b 44 24 74          	mov    0x74(%esp),%eax
            path = ".";
40001d51:	8d b7 e8 d3 ff ff    	lea    -0x2c18(%edi),%esi
    argv++;  // Skip command
40001d57:	83 c0 04             	add    $0x4,%eax
40001d5a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        if (argc == 0) {
40001d5e:	8b 44 24 70          	mov    0x70(%esp),%eax
40001d62:	83 e8 01             	sub    $0x1,%eax
40001d65:	89 44 24 10          	mov    %eax,0x10(%esp)
40001d69:	0f 85 ad 00 00 00    	jne    40001e1c <cmd_ls+0x11c>
    int len = strlen(path) + 1;
40001d6f:	83 ec 0c             	sub    $0xc,%esp
40001d72:	89 fb                	mov    %edi,%ebx
40001d74:	56                   	push   %esi
40001d75:	e8 e6 ee ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40001d7a:	31 c9                	xor    %ecx,%ecx
40001d7c:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40001d7e:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40001d81:	b8 04 00 00 00       	mov    $0x4,%eax
40001d86:	cd 30                	int    $0x30
40001d88:	89 dd                	mov    %ebx,%ebp
        if ((fd = open(path, O_RDONLY)) == -1) {
40001d8a:	83 c4 10             	add    $0x10,%esp
40001d8d:	83 fb ff             	cmp    $0xffffffff,%ebx
40001d90:	0f 84 17 01 00 00    	je     40001ead <cmd_ls+0x1ad>
40001d96:	85 c0                	test   %eax,%eax
40001d98:	0f 85 0f 01 00 00    	jne    40001ead <cmd_ls+0x1ad>
    asm volatile ("int %2"
40001d9e:	8d 4c 24 3c          	lea    0x3c(%esp),%ecx
40001da2:	b8 0c 00 00 00       	mov    $0xc,%eax
40001da7:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001da9:	85 c0                	test   %eax,%eax
40001dab:	0f 85 17 01 00 00    	jne    40001ec8 <cmd_ls+0x1c8>
        switch (stat.type) {
40001db1:	0f b7 44 24 3c       	movzwl 0x3c(%esp),%eax
40001db6:	66 83 f8 01          	cmp    $0x1,%ax
40001dba:	74 74                	je     40001e30 <cmd_ls+0x130>
40001dbc:	66 83 f8 02          	cmp    $0x2,%ax
40001dc0:	74 1e                	je     40001de0 <cmd_ls+0xe0>
    asm volatile ("int %2"
40001dc2:	b8 05 00 00 00       	mov    $0x5,%eax
40001dc7:	89 eb                	mov    %ebp,%ebx
40001dc9:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001dcb:	85 c0                	test   %eax,%eax
40001dcd:	0f 85 41 01 00 00    	jne    40001f14 <cmd_ls+0x214>
            return E_INVAL_TYPE;
40001dd3:	b8 05 00 00 00       	mov    $0x5,%eax
40001dd8:	e9 5e ff ff ff       	jmp    40001d3b <cmd_ls+0x3b>
40001ddd:	8d 76 00             	lea    0x0(%esi),%esi
            printf("%s\n", path);
40001de0:	83 ec 08             	sub    $0x8,%esp
40001de3:	8d 87 5f d0 ff ff    	lea    -0x2fa1(%edi),%eax
40001de9:	89 fb                	mov    %edi,%ebx
40001deb:	56                   	push   %esi
40001dec:	50                   	push   %eax
40001ded:	e8 0e e6 ff ff       	call   40000400 <printf>
            break;
40001df2:	83 c4 10             	add    $0x10,%esp
    asm volatile ("int %2"
40001df5:	b8 05 00 00 00       	mov    $0x5,%eax
40001dfa:	89 eb                	mov    %ebp,%ebx
40001dfc:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001dfe:	85 c0                	test   %eax,%eax
40001e00:	0f 85 e8 00 00 00    	jne    40001eee <cmd_ls+0x1ee>
        argc--;
40001e06:	83 6c 24 10 01       	subl   $0x1,0x10(%esp)
40001e0b:	8b 44 24 10          	mov    0x10(%esp),%eax
        argv++;
40001e0f:	83 44 24 1c 04       	addl   $0x4,0x1c(%esp)
    } while (argc > 0);
40001e14:	85 c0                	test   %eax,%eax
40001e16:	0f 8e a5 00 00 00    	jle    40001ec1 <cmd_ls+0x1c1>
            path = *argv;
40001e1c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40001e20:	8b 30                	mov    (%eax),%esi
40001e22:	e9 48 ff ff ff       	jmp    40001d6f <cmd_ls+0x6f>
40001e27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001e2e:	00 
40001e2f:	90                   	nop
    asm volatile ("int %2"
40001e30:	8d 74 24 2c          	lea    0x2c(%esp),%esi
40001e34:	b8 06 00 00 00       	mov    $0x6,%eax
40001e39:	ba 10 00 00 00       	mov    $0x10,%edx
40001e3e:	89 eb                	mov    %ebp,%ebx
40001e40:	89 f1                	mov    %esi,%ecx
40001e42:	cd 30                	int    $0x30
            while (read(fd, (char *) &de, sizeof(struct dirent)) == sizeof(struct dirent)) {
40001e44:	83 fb 10             	cmp    $0x10,%ebx
40001e47:	75 ac                	jne    40001df5 <cmd_ls+0xf5>
                    printf("%s\n", de.name);
40001e49:	8d 4c 24 2e          	lea    0x2e(%esp),%ecx
40001e4d:	89 4c 24 14          	mov    %ecx,0x14(%esp)
40001e51:	8d 8f 5f d0 ff ff    	lea    -0x2fa1(%edi),%ecx
            while (read(fd, (char *) &de, sizeof(struct dirent)) == sizeof(struct dirent)) {
40001e57:	85 c0                	test   %eax,%eax
40001e59:	75 9a                	jne    40001df5 <cmd_ls+0xf5>
40001e5b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
40001e5f:	90                   	nop
                if (de.inum != 0 && (all || de.name[0] != '.')) {
40001e60:	66 83 7c 24 2c 00    	cmpw   $0x0,0x2c(%esp)
40001e66:	74 23                	je     40001e8b <cmd_ls+0x18b>
40001e68:	80 7c 24 0f 00       	cmpb   $0x0,0xf(%esp)
40001e6d:	75 07                	jne    40001e76 <cmd_ls+0x176>
40001e6f:	80 7c 24 2e 2e       	cmpb   $0x2e,0x2e(%esp)
40001e74:	74 15                	je     40001e8b <cmd_ls+0x18b>
                    printf("%s\n", de.name);
40001e76:	83 ec 08             	sub    $0x8,%esp
40001e79:	89 fb                	mov    %edi,%ebx
40001e7b:	ff 74 24 1c          	push   0x1c(%esp)
40001e7f:	ff 74 24 24          	push   0x24(%esp)
40001e83:	e8 78 e5 ff ff       	call   40000400 <printf>
40001e88:	83 c4 10             	add    $0x10,%esp
40001e8b:	b8 06 00 00 00       	mov    $0x6,%eax
40001e90:	ba 10 00 00 00       	mov    $0x10,%edx
40001e95:	89 eb                	mov    %ebp,%ebx
40001e97:	89 f1                	mov    %esi,%ecx
40001e99:	cd 30                	int    $0x30
            while (read(fd, (char *) &de, sizeof(struct dirent)) == sizeof(struct dirent)) {
40001e9b:	83 fb 10             	cmp    $0x10,%ebx
40001e9e:	0f 85 51 ff ff ff    	jne    40001df5 <cmd_ls+0xf5>
40001ea4:	85 c0                	test   %eax,%eax
40001ea6:	74 b8                	je     40001e60 <cmd_ls+0x160>
40001ea8:	e9 48 ff ff ff       	jmp    40001df5 <cmd_ls+0xf5>
            return E_CANT_OPEN;
40001ead:	b8 06 00 00 00       	mov    $0x6,%eax
40001eb2:	e9 84 fe ff ff       	jmp    40001d3b <cmd_ls+0x3b>
    bool all = FALSE;
40001eb7:	c6 44 24 0f 00       	movb   $0x0,0xf(%esp)
40001ebc:	e9 8c fe ff ff       	jmp    40001d4d <cmd_ls+0x4d>
    return E_OK;
40001ec1:	31 c0                	xor    %eax,%eax
40001ec3:	e9 73 fe ff ff       	jmp    40001d3b <cmd_ls+0x3b>
        ASSERT(fstat(fd, &stat) != -1);
40001ec8:	8d 87 c4 d1 ff ff    	lea    -0x2e3c(%edi),%eax
40001ece:	89 fb                	mov    %edi,%ebx
40001ed0:	50                   	push   %eax
40001ed1:	8d 87 48 d0 ff ff    	lea    -0x2fb8(%edi),%eax
40001ed7:	50                   	push   %eax
40001ed8:	8d 87 4f d1 ff ff    	lea    -0x2eb1(%edi),%eax
40001ede:	6a 56                	push   $0x56
40001ee0:	50                   	push   %eax
40001ee1:	e8 6a e3 ff ff       	call   40000250 <panic>
40001ee6:	83 c4 10             	add    $0x10,%esp
40001ee9:	e9 c3 fe ff ff       	jmp    40001db1 <cmd_ls+0xb1>
        ASSERT(close(fd) != -1);
40001eee:	8d 87 ee d1 ff ff    	lea    -0x2e12(%edi),%eax
40001ef4:	89 fb                	mov    %edi,%ebx
40001ef6:	50                   	push   %eax
40001ef7:	8d 87 48 d0 ff ff    	lea    -0x2fb8(%edi),%eax
40001efd:	50                   	push   %eax
40001efe:	8d 87 4f d1 ff ff    	lea    -0x2eb1(%edi),%eax
40001f04:	6a 6a                	push   $0x6a
40001f06:	50                   	push   %eax
40001f07:	e8 44 e3 ff ff       	call   40000250 <panic>
40001f0c:	83 c4 10             	add    $0x10,%esp
40001f0f:	e9 f2 fe ff ff       	jmp    40001e06 <cmd_ls+0x106>
            ASSERT(close(fd) != -1);
40001f14:	8d 87 ee d1 ff ff    	lea    -0x2e12(%edi),%eax
40001f1a:	89 fb                	mov    %edi,%ebx
40001f1c:	50                   	push   %eax
40001f1d:	8d 87 48 d0 ff ff    	lea    -0x2fb8(%edi),%eax
40001f23:	50                   	push   %eax
40001f24:	8d 87 4f d1 ff ff    	lea    -0x2eb1(%edi),%eax
40001f2a:	6a 66                	push   $0x66
40001f2c:	50                   	push   %eax
40001f2d:	e8 1e e3 ff ff       	call   40000250 <panic>
40001f32:	83 c4 10             	add    $0x10,%esp
40001f35:	e9 99 fe ff ff       	jmp    40001dd3 <cmd_ls+0xd3>
40001f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001f40 <cmd_pwd>:
{
40001f40:	53                   	push   %ebx
40001f41:	e8 51 e3 ff ff       	call   40000297 <__x86.get_pc_thunk.bx>
40001f46:	81 c3 ae 50 00 00    	add    $0x50ae,%ebx
40001f4c:	83 ec 08             	sub    $0x8,%esp
    if (optc > 0) {
40001f4f:	8b 44 24 18          	mov    0x18(%esp),%eax
40001f53:	85 c0                	test   %eax,%eax
40001f55:	7f 29                	jg     40001f80 <cmd_pwd+0x40>
    printf("%s\n", cwd);
40001f57:	83 ec 08             	sub    $0x8,%esp
40001f5a:	8d 83 2c 01 00 00    	lea    0x12c(%ebx),%eax
40001f60:	50                   	push   %eax
40001f61:	8d 83 5f d0 ff ff    	lea    -0x2fa1(%ebx),%eax
40001f67:	50                   	push   %eax
40001f68:	e8 93 e4 ff ff       	call   40000400 <printf>
    return E_OK;
40001f6d:	83 c4 10             	add    $0x10,%esp
40001f70:	31 c0                	xor    %eax,%eax
}
40001f72:	83 c4 08             	add    $0x8,%esp
40001f75:	5b                   	pop    %ebx
40001f76:	c3                   	ret
40001f77:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001f7e:	00 
40001f7f:	90                   	nop
40001f80:	83 c4 08             	add    $0x8,%esp
40001f83:	b8 04 00 00 00       	mov    $0x4,%eax
40001f88:	5b                   	pop    %ebx
40001f89:	c3                   	ret
40001f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001f90 <cmd_cd>:
{
40001f90:	55                   	push   %ebp
        return E_INVAL_OPT;
40001f91:	b8 04 00 00 00       	mov    $0x4,%eax
{
40001f96:	57                   	push   %edi
40001f97:	56                   	push   %esi
40001f98:	e8 6a 0f 00 00       	call   40002f07 <__x86.get_pc_thunk.si>
40001f9d:	81 c6 57 50 00 00    	add    $0x5057,%esi
40001fa3:	53                   	push   %ebx
40001fa4:	83 ec 1c             	sub    $0x1c,%esp
    if (optc > 0) {
40001fa7:	8b 54 24 38          	mov    0x38(%esp),%edx
40001fab:	85 d2                	test   %edx,%edx
40001fad:	0f 8f b9 00 00 00    	jg     4000206c <cmd_cd+0xdc>
    if (argc == 1) {
40001fb3:	83 7c 24 30 01       	cmpl   $0x1,0x30(%esp)
        path = "/";
40001fb8:	8d be 07 d4 ff ff    	lea    -0x2bf9(%esi),%edi
    if (argc == 1) {
40001fbe:	74 07                	je     40001fc7 <cmd_cd+0x37>
        path = argv[1];
40001fc0:	8b 44 24 34          	mov    0x34(%esp),%eax
40001fc4:	8b 78 04             	mov    0x4(%eax),%edi
    int len = strlen(path) + 1;
40001fc7:	83 ec 0c             	sub    $0xc,%esp
40001fca:	89 f3                	mov    %esi,%ebx
40001fcc:	57                   	push   %edi
40001fcd:	e8 8e ec ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40001fd2:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
40001fd4:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40001fd7:	b8 09 00 00 00       	mov    $0x9,%eax
40001fdc:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001fde:	83 c4 10             	add    $0x10,%esp
40001fe1:	85 c0                	test   %eax,%eax
40001fe3:	0f 85 0f 01 00 00    	jne    400020f8 <cmd_cd+0x168>
    if (*path == '/') {
40001fe9:	80 3f 2f             	cmpb   $0x2f,(%edi)
40001fec:	0f 84 86 00 00 00    	je     40002078 <cmd_cd+0xe8>
        ASSERT(strlen(cwd) + strlen(path) + 1 < CWD_SIZE);
40001ff2:	83 ec 0c             	sub    $0xc,%esp
40001ff5:	8d ae 2c 01 00 00    	lea    0x12c(%esi),%ebp
40001ffb:	89 f3                	mov    %esi,%ebx
40001ffd:	55                   	push   %ebp
40001ffe:	e8 5d ec ff ff       	call   40000c60 <strlen>
40002003:	89 3c 24             	mov    %edi,(%esp)
40002006:	89 44 24 1c          	mov    %eax,0x1c(%esp)
4000200a:	e8 51 ec ff ff       	call   40000c60 <strlen>
4000200f:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40002013:	83 c4 10             	add    $0x10,%esp
40002016:	01 c2                	add    %eax,%edx
40002018:	81 fa 94 00 00 00    	cmp    $0x94,%edx
4000201e:	0f 8f ac 00 00 00    	jg     400020d0 <cmd_cd+0x140>
        join_path(cwd, cwd, path);
40002024:	83 ec 04             	sub    $0x4,%esp
40002027:	89 f3                	mov    %esi,%ebx
40002029:	57                   	push   %edi
4000202a:	55                   	push   %ebp
4000202b:	55                   	push   %ebp
4000202c:	e8 df 0e 00 00       	call   40002f10 <join_path>
40002031:	83 c4 10             	add    $0x10,%esp
    normalize_path(cwd);
40002034:	83 ec 0c             	sub    $0xc,%esp
40002037:	89 f3                	mov    %esi,%ebx
40002039:	55                   	push   %ebp
4000203a:	e8 41 10 00 00       	call   40003080 <normalize_path>
    ASSERT(*cwd == '/');
4000203f:	83 c4 10             	add    $0x10,%esp
40002042:	80 be 2c 01 00 00 2f 	cmpb   $0x2f,0x12c(%esi)
40002049:	74 1f                	je     4000206a <cmd_cd+0xda>
4000204b:	8d 86 4e d2 ff ff    	lea    -0x2db2(%esi),%eax
40002051:	50                   	push   %eax
40002052:	8d 86 48 d0 ff ff    	lea    -0x2fb8(%esi),%eax
40002058:	50                   	push   %eax
40002059:	8d 86 4f d1 ff ff    	lea    -0x2eb1(%esi),%eax
4000205f:	6a 16                	push   $0x16
40002061:	50                   	push   %eax
40002062:	e8 e9 e1 ff ff       	call   40000250 <panic>
40002067:	83 c4 10             	add    $0x10,%esp
    return E_OK;
4000206a:	31 c0                	xor    %eax,%eax
}
4000206c:	83 c4 1c             	add    $0x1c,%esp
4000206f:	5b                   	pop    %ebx
40002070:	5e                   	pop    %esi
40002071:	5f                   	pop    %edi
40002072:	5d                   	pop    %ebp
40002073:	c3                   	ret
40002074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ASSERT(strlen(path) < CWD_SIZE);
40002078:	83 ec 0c             	sub    $0xc,%esp
4000207b:	89 f3                	mov    %esi,%ebx
4000207d:	57                   	push   %edi
4000207e:	e8 dd eb ff ff       	call   40000c60 <strlen>
40002083:	83 c4 10             	add    $0x10,%esp
40002086:	3d 95 00 00 00       	cmp    $0x95,%eax
4000208b:	7f 1b                	jg     400020a8 <cmd_cd+0x118>
        strcpy(cwd, path);
4000208d:	83 ec 08             	sub    $0x8,%esp
40002090:	8d ae 2c 01 00 00    	lea    0x12c(%esi),%ebp
40002096:	89 f3                	mov    %esi,%ebx
40002098:	57                   	push   %edi
40002099:	55                   	push   %ebp
4000209a:	e8 21 ec ff ff       	call   40000cc0 <strcpy>
4000209f:	83 c4 10             	add    $0x10,%esp
400020a2:	eb 90                	jmp    40002034 <cmd_cd+0xa4>
400020a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ASSERT(strlen(path) < CWD_SIZE);
400020a8:	8d 86 36 d2 ff ff    	lea    -0x2dca(%esi),%eax
400020ae:	50                   	push   %eax
400020af:	8d 86 48 d0 ff ff    	lea    -0x2fb8(%esi),%eax
400020b5:	50                   	push   %eax
400020b6:	8d 86 4f d1 ff ff    	lea    -0x2eb1(%esi),%eax
400020bc:	6a 0d                	push   $0xd
400020be:	50                   	push   %eax
400020bf:	e8 8c e1 ff ff       	call   40000250 <panic>
400020c4:	83 c4 10             	add    $0x10,%esp
400020c7:	eb c4                	jmp    4000208d <cmd_cd+0xfd>
400020c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        ASSERT(strlen(cwd) + strlen(path) + 1 < CWD_SIZE);
400020d0:	8d 86 44 d6 ff ff    	lea    -0x29bc(%esi),%eax
400020d6:	50                   	push   %eax
400020d7:	8d 86 48 d0 ff ff    	lea    -0x2fb8(%esi),%eax
400020dd:	50                   	push   %eax
400020de:	8d 86 4f d1 ff ff    	lea    -0x2eb1(%esi),%eax
400020e4:	6a 11                	push   $0x11
400020e6:	50                   	push   %eax
400020e7:	e8 64 e1 ff ff       	call   40000250 <panic>
400020ec:	83 c4 10             	add    $0x10,%esp
400020ef:	e9 30 ff ff ff       	jmp    40002024 <cmd_cd+0x94>
400020f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return E_INVAL_TYPE;
400020f8:	b8 05 00 00 00       	mov    $0x5,%eax
400020fd:	e9 6a ff ff ff       	jmp    4000206c <cmd_cd+0xdc>
40002102:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002109:	00 
4000210a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40002110 <cmd_mkdir>:

err_t cmd_mkdir(int argc, char **argv, int optc, char **optv)
{
40002110:	57                   	push   %edi
40002111:	e8 a0 f2 ff ff       	call   400013b6 <__x86.get_pc_thunk.di>
40002116:	81 c7 de 4e 00 00    	add    $0x4ede,%edi
4000211c:	56                   	push   %esi
4000211d:	53                   	push   %ebx
    char *path;

    if (optc > 0) {
4000211e:	8b 44 24 18          	mov    0x18(%esp),%eax
40002122:	85 c0                	test   %eax,%eax
40002124:	7f 32                	jg     40002158 <cmd_mkdir+0x48>
        return E_INVAL_OPT;
    }

    path = argv[1];
40002126:	8b 44 24 14          	mov    0x14(%esp),%eax
    int len = strlen(path) + 1;
4000212a:	83 ec 0c             	sub    $0xc,%esp
4000212d:	89 fb                	mov    %edi,%ebx
4000212f:	8b 70 04             	mov    0x4(%eax),%esi
40002132:	56                   	push   %esi
40002133:	e8 28 eb ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40002138:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000213a:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
4000213d:	b8 08 00 00 00       	mov    $0x8,%eax
40002142:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002144:	83 c4 10             	add    $0x10,%esp
40002147:	85 c0                	test   %eax,%eax
40002149:	75 1d                	jne    40002168 <cmd_mkdir+0x58>

    ASSERT(mkdir(path) != -1);

    return E_OK;
}
4000214b:	5b                   	pop    %ebx
    return E_OK;
4000214c:	31 c0                	xor    %eax,%eax
}
4000214e:	5e                   	pop    %esi
4000214f:	5f                   	pop    %edi
40002150:	c3                   	ret
40002151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40002158:	5b                   	pop    %ebx
40002159:	b8 04 00 00 00       	mov    $0x4,%eax
4000215e:	5e                   	pop    %esi
4000215f:	5f                   	pop    %edi
40002160:	c3                   	ret
40002161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ASSERT(mkdir(path) != -1);
40002168:	8d 87 5a d2 ff ff    	lea    -0x2da6(%edi),%eax
4000216e:	89 fb                	mov    %edi,%ebx
40002170:	50                   	push   %eax
40002171:	8d 87 48 d0 ff ff    	lea    -0x2fb8(%edi),%eax
40002177:	50                   	push   %eax
40002178:	8d 87 4f d1 ff ff    	lea    -0x2eb1(%edi),%eax
4000217e:	68 34 01 00 00       	push   $0x134
40002183:	50                   	push   %eax
40002184:	e8 c7 e0 ff ff       	call   40000250 <panic>
40002189:	83 c4 10             	add    $0x10,%esp
4000218c:	eb bd                	jmp    4000214b <cmd_mkdir+0x3b>
4000218e:	66 90                	xchg   %ax,%ax

40002190 <cmd_cat>:

err_t cmd_cat(int argc, char **argv, int optc, char **optv)
{
40002190:	55                   	push   %ebp
40002191:	57                   	push   %edi
    char buf[1024];
    int len;
    err_t ret = E_OK;

    if (optc > 0) {
        return E_INVAL_OPT;
40002192:	bf 04 00 00 00       	mov    $0x4,%edi
{
40002197:	56                   	push   %esi
40002198:	53                   	push   %ebx
40002199:	e8 f9 e0 ff ff       	call   40000297 <__x86.get_pc_thunk.bx>
4000219e:	81 c3 56 4e 00 00    	add    $0x4e56,%ebx
400021a4:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
    if (optc > 0) {
400021aa:	8b 84 24 58 04 00 00 	mov    0x458(%esp),%eax
400021b1:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
400021b5:	85 c0                	test   %eax,%eax
400021b7:	0f 8f a2 00 00 00    	jg     4000225f <cmd_cat+0xcf>
    }

    path = argv[1];
400021bd:	8b 84 24 54 04 00 00 	mov    0x454(%esp),%eax
    int len = strlen(path) + 1;
400021c4:	83 ec 0c             	sub    $0xc,%esp
400021c7:	8b 70 04             	mov    0x4(%eax),%esi
400021ca:	56                   	push   %esi
400021cb:	e8 90 ea ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
400021d0:	31 c9                	xor    %ecx,%ecx
400021d2:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400021d4:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400021d7:	89 f8                	mov    %edi,%eax
400021d9:	cd 30                	int    $0x30
400021db:	89 de                	mov    %ebx,%esi

    if ((fd = open(path, O_RDONLY)) == -1) {
400021dd:	83 c4 10             	add    $0x10,%esp
400021e0:	83 fb ff             	cmp    $0xffffffff,%ebx
400021e3:	0f 84 87 00 00 00    	je     40002270 <cmd_cat+0xe0>
400021e9:	85 c0                	test   %eax,%eax
400021eb:	0f 85 7f 00 00 00    	jne    40002270 <cmd_cat+0xe0>
    asm volatile ("int %2"
400021f1:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
400021f5:	b8 0c 00 00 00       	mov    $0xc,%eax
400021fa:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400021fc:	85 c0                	test   %eax,%eax
400021fe:	0f 85 9b 00 00 00    	jne    4000229f <cmd_cat+0x10f>
        return E_CANT_OPEN;
    }
    ASSERT(fstat(fd, &stat) != -1);

    switch (stat.type) {
40002204:	66 83 7c 24 1c 02    	cmpw   $0x2,0x1c(%esp)
        while ((len = read(fd, buf, 1024)) > 0) {
            puts(buf, len);
        }
        break;
    default:
        ret = E_INVAL_TYPE;
4000220a:	bf 05 00 00 00       	mov    $0x5,%edi
    switch (stat.type) {
4000220f:	75 41                	jne    40002252 <cmd_cat+0xc2>
    asm volatile ("int %2"
40002211:	8d 7c 24 30          	lea    0x30(%esp),%edi
40002215:	b8 06 00 00 00       	mov    $0x6,%eax
4000221a:	ba 00 04 00 00       	mov    $0x400,%edx
4000221f:	89 f3                	mov    %esi,%ebx
40002221:	89 f9                	mov    %edi,%ecx
40002223:	cd 30                	int    $0x30
40002225:	89 d9                	mov    %ebx,%ecx
    return errno ? -1 : ret;
40002227:	85 c0                	test   %eax,%eax
40002229:	75 25                	jne    40002250 <cmd_cat+0xc0>
    asm volatile ("int %0"
4000222b:	31 ed                	xor    %ebp,%ebp
4000222d:	eb 1d                	jmp    4000224c <cmd_cat+0xbc>
4000222f:	90                   	nop
40002230:	89 e8                	mov    %ebp,%eax
40002232:	89 fb                	mov    %edi,%ebx
40002234:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002236:	ba 00 04 00 00       	mov    $0x400,%edx
4000223b:	b8 06 00 00 00       	mov    $0x6,%eax
40002240:	89 f3                	mov    %esi,%ebx
40002242:	89 f9                	mov    %edi,%ecx
40002244:	cd 30                	int    $0x30
40002246:	89 d9                	mov    %ebx,%ecx
    return errno ? -1 : ret;
40002248:	85 c0                	test   %eax,%eax
4000224a:	75 04                	jne    40002250 <cmd_cat+0xc0>
        while ((len = read(fd, buf, 1024)) > 0) {
4000224c:	85 c9                	test   %ecx,%ecx
4000224e:	7f e0                	jg     40002230 <cmd_cat+0xa0>
    err_t ret = E_OK;
40002250:	31 ff                	xor    %edi,%edi
    asm volatile ("int %2"
40002252:	b8 05 00 00 00       	mov    $0x5,%eax
40002257:	89 f3                	mov    %esi,%ebx
40002259:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000225b:	85 c0                	test   %eax,%eax
4000225d:	75 18                	jne    40002277 <cmd_cat+0xe7>
    }

end:
    ASSERT(close(fd) != -1);
    return ret;
}
4000225f:	81 c4 3c 04 00 00    	add    $0x43c,%esp
40002265:	89 f8                	mov    %edi,%eax
40002267:	5b                   	pop    %ebx
40002268:	5e                   	pop    %esi
40002269:	5f                   	pop    %edi
4000226a:	5d                   	pop    %ebp
4000226b:	c3                   	ret
4000226c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return E_CANT_OPEN;
40002270:	bf 06 00 00 00       	mov    $0x6,%edi
40002275:	eb e8                	jmp    4000225f <cmd_cat+0xcf>
    ASSERT(close(fd) != -1);
40002277:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
4000227b:	8d 83 ee d1 ff ff    	lea    -0x2e12(%ebx),%eax
40002281:	50                   	push   %eax
40002282:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002288:	50                   	push   %eax
40002289:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
4000228f:	68 59 01 00 00       	push   $0x159
40002294:	50                   	push   %eax
40002295:	e8 b6 df ff ff       	call   40000250 <panic>
4000229a:	83 c4 10             	add    $0x10,%esp
4000229d:	eb c0                	jmp    4000225f <cmd_cat+0xcf>
    ASSERT(fstat(fd, &stat) != -1);
4000229f:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
400022a3:	8d 83 c4 d1 ff ff    	lea    -0x2e3c(%ebx),%eax
400022a9:	50                   	push   %eax
400022aa:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
400022b0:	50                   	push   %eax
400022b1:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
400022b7:	68 4b 01 00 00       	push   $0x14b
400022bc:	50                   	push   %eax
400022bd:	e8 8e df ff ff       	call   40000250 <panic>
400022c2:	83 c4 10             	add    $0x10,%esp
400022c5:	e9 3a ff ff ff       	jmp    40002204 <cmd_cat+0x74>
400022ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

400022d0 <cmd_touch>:

err_t cmd_touch(int argc, char **argv, int optc, char **optv)
{
400022d0:	55                   	push   %ebp
    char *path;
    int fd;

    if (optc > 0) {
        return E_INVAL_OPT;
400022d1:	bd 04 00 00 00       	mov    $0x4,%ebp
{
400022d6:	57                   	push   %edi
400022d7:	e8 da f0 ff ff       	call   400013b6 <__x86.get_pc_thunk.di>
400022dc:	81 c7 18 4d 00 00    	add    $0x4d18,%edi
400022e2:	56                   	push   %esi
400022e3:	53                   	push   %ebx
400022e4:	83 ec 0c             	sub    $0xc,%esp
    if (optc > 0) {
400022e7:	8b 44 24 28          	mov    0x28(%esp),%eax
400022eb:	85 c0                	test   %eax,%eax
400022ed:	7f 36                	jg     40002325 <cmd_touch+0x55>
    }

    path = argv[1];
400022ef:	8b 44 24 24          	mov    0x24(%esp),%eax
    int len = strlen(path) + 1;
400022f3:	83 ec 0c             	sub    $0xc,%esp
400022f6:	89 fb                	mov    %edi,%ebx
400022f8:	8b 70 04             	mov    0x4(%eax),%esi
400022fb:	56                   	push   %esi
400022fc:	e8 5f e9 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40002301:	31 c9                	xor    %ecx,%ecx
40002303:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002305:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002308:	89 e8                	mov    %ebp,%eax
4000230a:	cd 30                	int    $0x30

    if ((fd = open(path, O_RDONLY)) == -1) {
4000230c:	83 c4 10             	add    $0x10,%esp
4000230f:	83 fb ff             	cmp    $0xffffffff,%ebx
40002312:	74 1c                	je     40002330 <cmd_touch+0x60>
40002314:	85 c0                	test   %eax,%eax
40002316:	75 18                	jne    40002330 <cmd_touch+0x60>
    asm volatile ("int %2"
40002318:	b8 05 00 00 00       	mov    $0x5,%eax
4000231d:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000231f:	85 c0                	test   %eax,%eax
40002321:	75 3d                	jne    40002360 <cmd_touch+0x90>
        }
    }

    ASSERT(close(fd) != -1);

    return E_OK;
40002323:	31 ed                	xor    %ebp,%ebp
}
40002325:	83 c4 0c             	add    $0xc,%esp
40002328:	89 e8                	mov    %ebp,%eax
4000232a:	5b                   	pop    %ebx
4000232b:	5e                   	pop    %esi
4000232c:	5f                   	pop    %edi
4000232d:	5d                   	pop    %ebp
4000232e:	c3                   	ret
4000232f:	90                   	nop
    int len = strlen(path) + 1;
40002330:	83 ec 0c             	sub    $0xc,%esp
40002333:	89 fb                	mov    %edi,%ebx
40002335:	56                   	push   %esi
40002336:	e8 25 e9 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
4000233b:	b9 00 02 00 00       	mov    $0x200,%ecx
40002340:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002342:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40002345:	b8 04 00 00 00       	mov    $0x4,%eax
4000234a:	cd 30                	int    $0x30
        if ((fd = open(path, O_CREATE)) == -1) {
4000234c:	83 c4 10             	add    $0x10,%esp
4000234f:	83 fb ff             	cmp    $0xffffffff,%ebx
40002352:	74 04                	je     40002358 <cmd_touch+0x88>
40002354:	85 c0                	test   %eax,%eax
40002356:	74 c0                	je     40002318 <cmd_touch+0x48>
            return E_CANT_OPEN;
40002358:	bd 06 00 00 00       	mov    $0x6,%ebp
4000235d:	eb c6                	jmp    40002325 <cmd_touch+0x55>
4000235f:	90                   	nop
    ASSERT(close(fd) != -1);
40002360:	8d 87 ee d1 ff ff    	lea    -0x2e12(%edi),%eax
40002366:	89 fb                	mov    %edi,%ebx
    return E_OK;
40002368:	31 ed                	xor    %ebp,%ebp
    ASSERT(close(fd) != -1);
4000236a:	50                   	push   %eax
4000236b:	8d 87 48 d0 ff ff    	lea    -0x2fb8(%edi),%eax
40002371:	50                   	push   %eax
40002372:	8d 87 4f d1 ff ff    	lea    -0x2eb1(%edi),%eax
40002378:	68 6e 01 00 00       	push   $0x16e
4000237d:	50                   	push   %eax
4000237e:	e8 cd de ff ff       	call   40000250 <panic>
40002383:	83 c4 10             	add    $0x10,%esp
40002386:	eb 9d                	jmp    40002325 <cmd_touch+0x55>
40002388:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000238f:	00 

40002390 <cmd_write>:

err_t cmd_write(int argc, char **argv, int optc, char **optv)
{
40002390:	55                   	push   %ebp
40002391:	e8 75 0b 00 00       	call   40002f0b <__x86.get_pc_thunk.bp>
40002396:	81 c5 5e 4c 00 00    	add    $0x4c5e,%ebp
4000239c:	57                   	push   %edi
    int fd;
    struct file_stat stat;
    err_t ret = E_OK;

    if (optc > 0) {
        return E_INVAL_OPT;
4000239d:	bf 04 00 00 00       	mov    $0x4,%edi
{
400023a2:	56                   	push   %esi
400023a3:	53                   	push   %ebx
400023a4:	83 ec 3c             	sub    $0x3c,%esp
    if (optc > 0) {
400023a7:	8b 54 24 58          	mov    0x58(%esp),%edx
{
400023ab:	8b 44 24 54          	mov    0x54(%esp),%eax
    if (optc > 0) {
400023af:	85 d2                	test   %edx,%edx
400023b1:	0f 8f ce 00 00 00    	jg     40002485 <cmd_write+0xf5>
    }

    text = argv[0];
400023b7:	8b 10                	mov    (%eax),%edx
    path = argv[2];
400023b9:	8b 70 08             	mov    0x8(%eax),%esi
    int len = strlen(path) + 1;
400023bc:	83 ec 0c             	sub    $0xc,%esp
400023bf:	89 eb                	mov    %ebp,%ebx
    text = argv[0];
400023c1:	89 54 24 18          	mov    %edx,0x18(%esp)
400023c5:	56                   	push   %esi
400023c6:	e8 95 e8 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
400023cb:	31 c9                	xor    %ecx,%ecx
400023cd:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
400023cf:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
400023d2:	89 f8                	mov    %edi,%eax
400023d4:	cd 30                	int    $0x30
400023d6:	89 df                	mov    %ebx,%edi

    // Recreate file if it exists
    if ((fd = open(path, O_RDONLY)) != -1) {
400023d8:	83 c4 10             	add    $0x10,%esp
400023db:	83 fb ff             	cmp    $0xffffffff,%ebx
400023de:	74 4a                	je     4000242a <cmd_write+0x9a>
400023e0:	85 c0                	test   %eax,%eax
400023e2:	75 46                	jne    4000242a <cmd_write+0x9a>
    asm volatile ("int %2"
400023e4:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
400023e8:	b8 0c 00 00 00       	mov    $0xc,%eax
400023ed:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400023ef:	85 c0                	test   %eax,%eax
400023f1:	0f 85 f0 01 00 00    	jne    400025e7 <cmd_write+0x257>
    int len = strlen(path) + 1;
400023f7:	83 ec 0c             	sub    $0xc,%esp
400023fa:	89 eb                	mov    %ebp,%ebx
400023fc:	56                   	push   %esi
400023fd:	e8 5e e8 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40002402:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
40002404:	8d 48 01             	lea    0x1(%eax),%ecx
    asm volatile ("int %2"
40002407:	b8 0b 00 00 00       	mov    $0xb,%eax
4000240c:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000240e:	83 c4 10             	add    $0x10,%esp
40002411:	85 c0                	test   %eax,%eax
40002413:	0f 85 a5 01 00 00    	jne    400025be <cmd_write+0x22e>
    asm volatile ("int %2"
40002419:	b8 05 00 00 00       	mov    $0x5,%eax
4000241e:	89 fb                	mov    %edi,%ebx
40002420:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002422:	85 c0                	test   %eax,%eax
40002424:	0f 85 42 01 00 00    	jne    4000256c <cmd_write+0x1dc>
    int len = strlen(path) + 1;
4000242a:	83 ec 0c             	sub    $0xc,%esp
4000242d:	89 eb                	mov    %ebp,%ebx
4000242f:	56                   	push   %esi
40002430:	e8 2b e8 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40002435:	b9 01 02 00 00       	mov    $0x201,%ecx
4000243a:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000243c:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000243f:	b8 04 00 00 00       	mov    $0x4,%eax
40002444:	cd 30                	int    $0x30
40002446:	89 de                	mov    %ebx,%esi
        ASSERT(fstat(fd, &stat) != -1);
        ASSERT(unlink(path) != -1);
        ASSERT(close(fd) != -1);
    }
    if ((fd = open(path, O_CREATE | O_WRONLY)) == -1) {
40002448:	83 c4 10             	add    $0x10,%esp
4000244b:	83 fb ff             	cmp    $0xffffffff,%ebx
4000244e:	74 40                	je     40002490 <cmd_write+0x100>
40002450:	85 c0                	test   %eax,%eax
40002452:	75 3c                	jne    40002490 <cmd_write+0x100>
    asm volatile ("int %2"
40002454:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
40002458:	b8 0c 00 00 00       	mov    $0xc,%eax
4000245d:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000245f:	85 c0                	test   %eax,%eax
40002461:	0f 85 2e 01 00 00    	jne    40002595 <cmd_write+0x205>
        return E_CANT_OPEN;
    }
    ASSERT(fstat(fd, &stat) != -1);

    switch (stat.type) {
40002467:	66 83 7c 24 1c 02    	cmpw   $0x2,0x1c(%esp)
    case T_FILE:
        ASSERT(write(fd, text, strlen(text)) == strlen(text));
        ASSERT(write(fd, "\n", 1) == 1);
        break;
    default:
        ret = E_INVAL_TYPE;
4000246d:	bf 05 00 00 00       	mov    $0x5,%edi
    switch (stat.type) {
40002472:	74 2c                	je     400024a0 <cmd_write+0x110>
    asm volatile ("int %2"
40002474:	b8 05 00 00 00       	mov    $0x5,%eax
40002479:	89 f3                	mov    %esi,%ebx
4000247b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000247d:	85 c0                	test   %eax,%eax
4000247f:	0f 85 be 00 00 00    	jne    40002543 <cmd_write+0x1b3>
    }

end:
    ASSERT(close(fd) != -1);
    return ret;
}
40002485:	83 c4 3c             	add    $0x3c,%esp
40002488:	89 f8                	mov    %edi,%eax
4000248a:	5b                   	pop    %ebx
4000248b:	5e                   	pop    %esi
4000248c:	5f                   	pop    %edi
4000248d:	5d                   	pop    %ebp
4000248e:	c3                   	ret
4000248f:	90                   	nop
        return E_CANT_OPEN;
40002490:	bf 06 00 00 00       	mov    $0x6,%edi
40002495:	eb ee                	jmp    40002485 <cmd_write+0xf5>
40002497:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000249e:	00 
4000249f:	90                   	nop
        ASSERT(write(fd, text, strlen(text)) == strlen(text));
400024a0:	83 ec 0c             	sub    $0xc,%esp
400024a3:	89 eb                	mov    %ebp,%ebx
400024a5:	8b 7c 24 18          	mov    0x18(%esp),%edi
400024a9:	57                   	push   %edi
400024aa:	e8 b1 e7 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
400024af:	89 f3                	mov    %esi,%ebx
400024b1:	89 f9                	mov    %edi,%ecx
400024b3:	89 c2                	mov    %eax,%edx
400024b5:	b8 07 00 00 00       	mov    $0x7,%eax
400024ba:	cd 30                	int    $0x30
    return errno ? -1 : ret;
400024bc:	85 c0                	test   %eax,%eax
400024be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
400024c3:	89 0c 24             	mov    %ecx,(%esp)
400024c6:	0f 44 c3             	cmove  %ebx,%eax
400024c9:	89 eb                	mov    %ebp,%ebx
400024cb:	89 c7                	mov    %eax,%edi
400024cd:	e8 8e e7 ff ff       	call   40000c60 <strlen>
400024d2:	83 c4 10             	add    $0x10,%esp
400024d5:	39 f8                	cmp    %edi,%eax
400024d7:	74 22                	je     400024fb <cmd_write+0x16b>
400024d9:	8d 85 70 d6 ff ff    	lea    -0x2990(%ebp),%eax
400024df:	50                   	push   %eax
400024e0:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
400024e6:	50                   	push   %eax
400024e7:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
400024ed:	68 8f 01 00 00       	push   $0x18f
400024f2:	50                   	push   %eax
400024f3:	e8 58 dd ff ff       	call   40000250 <panic>
400024f8:	83 c4 10             	add    $0x10,%esp
    asm volatile ("int %2"
400024fb:	b8 07 00 00 00       	mov    $0x7,%eax
40002500:	8d 8d 9a d0 ff ff    	lea    -0x2f66(%ebp),%ecx
40002506:	ba 01 00 00 00       	mov    $0x1,%edx
4000250b:	89 f3                	mov    %esi,%ebx
4000250d:	cd 30                	int    $0x30
        ASSERT(write(fd, "\n", 1) == 1);
4000250f:	83 fb 01             	cmp    $0x1,%ebx
40002512:	75 04                	jne    40002518 <cmd_write+0x188>
40002514:	85 c0                	test   %eax,%eax
40002516:	74 24                	je     4000253c <cmd_write+0x1ac>
40002518:	8d 85 6c d2 ff ff    	lea    -0x2d94(%ebp),%eax
4000251e:	89 eb                	mov    %ebp,%ebx
40002520:	50                   	push   %eax
40002521:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40002527:	50                   	push   %eax
40002528:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
4000252e:	68 90 01 00 00       	push   $0x190
40002533:	50                   	push   %eax
40002534:	e8 17 dd ff ff       	call   40000250 <panic>
40002539:	83 c4 10             	add    $0x10,%esp
    err_t ret = E_OK;
4000253c:	31 ff                	xor    %edi,%edi
4000253e:	e9 31 ff ff ff       	jmp    40002474 <cmd_write+0xe4>
    ASSERT(close(fd) != -1);
40002543:	8d 85 ee d1 ff ff    	lea    -0x2e12(%ebp),%eax
40002549:	89 eb                	mov    %ebp,%ebx
4000254b:	50                   	push   %eax
4000254c:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40002552:	50                   	push   %eax
40002553:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
40002559:	68 98 01 00 00       	push   $0x198
4000255e:	50                   	push   %eax
4000255f:	e8 ec dc ff ff       	call   40000250 <panic>
40002564:	83 c4 10             	add    $0x10,%esp
40002567:	e9 19 ff ff ff       	jmp    40002485 <cmd_write+0xf5>
        ASSERT(close(fd) != -1);
4000256c:	8d 85 ee d1 ff ff    	lea    -0x2e12(%ebp),%eax
40002572:	89 eb                	mov    %ebp,%ebx
40002574:	50                   	push   %eax
40002575:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
4000257b:	50                   	push   %eax
4000257c:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
40002582:	68 86 01 00 00       	push   $0x186
40002587:	50                   	push   %eax
40002588:	e8 c3 dc ff ff       	call   40000250 <panic>
4000258d:	83 c4 10             	add    $0x10,%esp
40002590:	e9 95 fe ff ff       	jmp    4000242a <cmd_write+0x9a>
    ASSERT(fstat(fd, &stat) != -1);
40002595:	8d 85 c4 d1 ff ff    	lea    -0x2e3c(%ebp),%eax
4000259b:	89 eb                	mov    %ebp,%ebx
4000259d:	50                   	push   %eax
4000259e:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
400025a4:	50                   	push   %eax
400025a5:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
400025ab:	68 8b 01 00 00       	push   $0x18b
400025b0:	50                   	push   %eax
400025b1:	e8 9a dc ff ff       	call   40000250 <panic>
400025b6:	83 c4 10             	add    $0x10,%esp
400025b9:	e9 a9 fe ff ff       	jmp    40002467 <cmd_write+0xd7>
        ASSERT(unlink(path) != -1);
400025be:	8d 85 db d1 ff ff    	lea    -0x2e25(%ebp),%eax
400025c4:	89 eb                	mov    %ebp,%ebx
400025c6:	50                   	push   %eax
400025c7:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
400025cd:	50                   	push   %eax
400025ce:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
400025d4:	68 85 01 00 00       	push   $0x185
400025d9:	50                   	push   %eax
400025da:	e8 71 dc ff ff       	call   40000250 <panic>
400025df:	83 c4 10             	add    $0x10,%esp
400025e2:	e9 32 fe ff ff       	jmp    40002419 <cmd_write+0x89>
        ASSERT(fstat(fd, &stat) != -1);
400025e7:	8d 85 c4 d1 ff ff    	lea    -0x2e3c(%ebp),%eax
400025ed:	89 eb                	mov    %ebp,%ebx
400025ef:	50                   	push   %eax
400025f0:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
400025f6:	50                   	push   %eax
400025f7:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
400025fd:	68 84 01 00 00       	push   $0x184
40002602:	50                   	push   %eax
40002603:	e8 48 dc ff ff       	call   40000250 <panic>
40002608:	83 c4 10             	add    $0x10,%esp
4000260b:	e9 e7 fd ff ff       	jmp    400023f7 <cmd_write+0x67>

40002610 <cmd_append>:

err_t cmd_append(int argc, char **argv, int optc, char **optv)
{
40002610:	55                   	push   %ebp
40002611:	e8 f5 08 00 00       	call   40002f0b <__x86.get_pc_thunk.bp>
40002616:	81 c5 de 49 00 00    	add    $0x49de,%ebp
4000261c:	57                   	push   %edi
    struct file_stat stat;
    err_t ret = E_OK;
    char buf[1024];

    if (optc > 0) {
        return E_INVAL_OPT;
4000261d:	bf 04 00 00 00       	mov    $0x4,%edi
{
40002622:	56                   	push   %esi
40002623:	53                   	push   %ebx
40002624:	81 ec 3c 04 00 00    	sub    $0x43c,%esp
    if (optc > 0) {
4000262a:	8b 94 24 58 04 00 00 	mov    0x458(%esp),%edx
{
40002631:	8b 84 24 54 04 00 00 	mov    0x454(%esp),%eax
    if (optc > 0) {
40002638:	85 d2                	test   %edx,%edx
4000263a:	0f 8f 07 01 00 00    	jg     40002747 <cmd_append+0x137>
    }

    text = argv[0];
40002640:	8b 10                	mov    (%eax),%edx
    path = argv[2];
40002642:	8b 70 08             	mov    0x8(%eax),%esi
    int len = strlen(path) + 1;
40002645:	83 ec 0c             	sub    $0xc,%esp
40002648:	89 eb                	mov    %ebp,%ebx
    text = argv[0];
4000264a:	89 54 24 18          	mov    %edx,0x18(%esp)
4000264e:	56                   	push   %esi
4000264f:	e8 0c e6 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
40002654:	b9 02 02 00 00       	mov    $0x202,%ecx
40002659:	89 f3                	mov    %esi,%ebx
    int len = strlen(path) + 1;
4000265b:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
4000265e:	89 f8                	mov    %edi,%eax
40002660:	cd 30                	int    $0x30
40002662:	89 de                	mov    %ebx,%esi
    return errno ? -1 : fd;
40002664:	83 c4 10             	add    $0x10,%esp

    if ((fd = open(path, O_CREATE | O_RDWR)) == -1) {
40002667:	85 c0                	test   %eax,%eax
40002669:	0f 85 11 01 00 00    	jne    40002780 <cmd_append+0x170>
4000266f:	83 fb ff             	cmp    $0xffffffff,%ebx
40002672:	0f 84 08 01 00 00    	je     40002780 <cmd_append+0x170>
    asm volatile ("int %2"
40002678:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
4000267c:	b8 0c 00 00 00       	mov    $0xc,%eax
40002681:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002683:	85 c0                	test   %eax,%eax
40002685:	0f 85 22 01 00 00    	jne    400027ad <cmd_append+0x19d>
        return E_CANT_OPEN;
    }
    ASSERT(fstat(fd, &stat) != -1);

    switch (stat.type) {
4000268b:	66 83 7c 24 1c 02    	cmpw   $0x2,0x1c(%esp)
        while (read(fd, buf, 1024) > 0) {}
        ASSERT(write(fd, text, strlen(text)) == strlen(text));
        ASSERT(write(fd, "\n", 1) == 1);
        break;
    default:
        ret = E_INVAL_TYPE;
40002691:	bf 05 00 00 00       	mov    $0x5,%edi
    switch (stat.type) {
40002696:	0f 85 9e 00 00 00    	jne    4000273a <cmd_append+0x12a>
4000269c:	8d 4c 24 30          	lea    0x30(%esp),%ecx
    asm volatile ("int %2"
400026a0:	bf 06 00 00 00       	mov    $0x6,%edi
400026a5:	ba 00 04 00 00       	mov    $0x400,%edx
400026aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400026b0:	89 f8                	mov    %edi,%eax
400026b2:	89 f3                	mov    %esi,%ebx
400026b4:	cd 30                	int    $0x30
    return errno ? -1 : ret;
400026b6:	85 c0                	test   %eax,%eax
400026b8:	75 04                	jne    400026be <cmd_append+0xae>
        while (read(fd, buf, 1024) > 0) {}
400026ba:	85 db                	test   %ebx,%ebx
400026bc:	7f f2                	jg     400026b0 <cmd_append+0xa0>
        ASSERT(write(fd, text, strlen(text)) == strlen(text));
400026be:	83 ec 0c             	sub    $0xc,%esp
400026c1:	89 eb                	mov    %ebp,%ebx
400026c3:	8b 7c 24 18          	mov    0x18(%esp),%edi
400026c7:	57                   	push   %edi
400026c8:	e8 93 e5 ff ff       	call   40000c60 <strlen>
    asm volatile ("int %2"
400026cd:	89 f3                	mov    %esi,%ebx
400026cf:	89 f9                	mov    %edi,%ecx
400026d1:	89 c2                	mov    %eax,%edx
400026d3:	b8 07 00 00 00       	mov    $0x7,%eax
400026d8:	cd 30                	int    $0x30
    return errno ? -1 : ret;
400026da:	85 c0                	test   %eax,%eax
400026dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
400026e1:	89 0c 24             	mov    %ecx,(%esp)
400026e4:	0f 44 c3             	cmove  %ebx,%eax
400026e7:	89 eb                	mov    %ebp,%ebx
400026e9:	89 c7                	mov    %eax,%edi
400026eb:	e8 70 e5 ff ff       	call   40000c60 <strlen>
400026f0:	83 c4 10             	add    $0x10,%esp
400026f3:	39 f8                	cmp    %edi,%eax
400026f5:	75 61                	jne    40002758 <cmd_append+0x148>
    asm volatile ("int %2"
400026f7:	b8 07 00 00 00       	mov    $0x7,%eax
400026fc:	8d 8d 9a d0 ff ff    	lea    -0x2f66(%ebp),%ecx
40002702:	ba 01 00 00 00       	mov    $0x1,%edx
40002707:	89 f3                	mov    %esi,%ebx
40002709:	cd 30                	int    $0x30
        ASSERT(write(fd, "\n", 1) == 1);
4000270b:	83 fb 01             	cmp    $0x1,%ebx
4000270e:	75 04                	jne    40002714 <cmd_append+0x104>
40002710:	85 c0                	test   %eax,%eax
40002712:	74 24                	je     40002738 <cmd_append+0x128>
40002714:	8d 85 6c d2 ff ff    	lea    -0x2d94(%ebp),%eax
4000271a:	89 eb                	mov    %ebp,%ebx
4000271c:	50                   	push   %eax
4000271d:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40002723:	50                   	push   %eax
40002724:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
4000272a:	68 b6 01 00 00       	push   $0x1b6
4000272f:	50                   	push   %eax
40002730:	e8 1b db ff ff       	call   40000250 <panic>
40002735:	83 c4 10             	add    $0x10,%esp
    err_t ret = E_OK;
40002738:	31 ff                	xor    %edi,%edi
    asm volatile ("int %2"
4000273a:	b8 05 00 00 00       	mov    $0x5,%eax
4000273f:	89 f3                	mov    %esi,%ebx
40002741:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002743:	85 c0                	test   %eax,%eax
40002745:	75 40                	jne    40002787 <cmd_append+0x177>
    }

end:
    ASSERT(close(fd) != -1);
    return ret;
}
40002747:	81 c4 3c 04 00 00    	add    $0x43c,%esp
4000274d:	89 f8                	mov    %edi,%eax
4000274f:	5b                   	pop    %ebx
40002750:	5e                   	pop    %esi
40002751:	5f                   	pop    %edi
40002752:	5d                   	pop    %ebp
40002753:	c3                   	ret
40002754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ASSERT(write(fd, text, strlen(text)) == strlen(text));
40002758:	8d 85 70 d6 ff ff    	lea    -0x2990(%ebp),%eax
4000275e:	50                   	push   %eax
4000275f:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40002765:	50                   	push   %eax
40002766:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
4000276c:	68 b5 01 00 00       	push   $0x1b5
40002771:	50                   	push   %eax
40002772:	e8 d9 da ff ff       	call   40000250 <panic>
40002777:	83 c4 10             	add    $0x10,%esp
4000277a:	e9 78 ff ff ff       	jmp    400026f7 <cmd_append+0xe7>
4000277f:	90                   	nop
        return E_CANT_OPEN;
40002780:	bf 06 00 00 00       	mov    $0x6,%edi
40002785:	eb c0                	jmp    40002747 <cmd_append+0x137>
    ASSERT(close(fd) != -1);
40002787:	8d 85 ee d1 ff ff    	lea    -0x2e12(%ebp),%eax
4000278d:	89 eb                	mov    %ebp,%ebx
4000278f:	50                   	push   %eax
40002790:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
40002796:	50                   	push   %eax
40002797:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
4000279d:	68 be 01 00 00       	push   $0x1be
400027a2:	50                   	push   %eax
400027a3:	e8 a8 da ff ff       	call   40000250 <panic>
400027a8:	83 c4 10             	add    $0x10,%esp
400027ab:	eb 9a                	jmp    40002747 <cmd_append+0x137>
    ASSERT(fstat(fd, &stat) != -1);
400027ad:	8d 85 c4 d1 ff ff    	lea    -0x2e3c(%ebp),%eax
400027b3:	89 eb                	mov    %ebp,%ebx
400027b5:	50                   	push   %eax
400027b6:	8d 85 48 d0 ff ff    	lea    -0x2fb8(%ebp),%eax
400027bc:	50                   	push   %eax
400027bd:	8d 85 4f d1 ff ff    	lea    -0x2eb1(%ebp),%eax
400027c3:	68 af 01 00 00       	push   $0x1af
400027c8:	50                   	push   %eax
400027c9:	e8 82 da ff ff       	call   40000250 <panic>
400027ce:	83 c4 10             	add    $0x10,%esp
400027d1:	e9 b5 fe ff ff       	jmp    4000268b <cmd_append+0x7b>
400027d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400027dd:	00 
400027de:	66 90                	xchg   %ax,%ax

400027e0 <cmd_pathtest>:

err_t cmd_pathtest(int argc, char **argv, int optc, char **optv)
{
400027e0:	55                   	push   %ebp
400027e1:	57                   	push   %edi
400027e2:	56                   	push   %esi
400027e3:	53                   	push   %ebx
400027e4:	e8 ae da ff ff       	call   40000297 <__x86.get_pc_thunk.bx>
400027e9:	81 c3 0b 48 00 00    	add    $0x480b,%ebx
400027ef:	81 ec 24 0c 00 00    	sub    $0xc24,%esp
    char path1[1024], path2[1024], path3[1024];
    char *path4, *path5;

    strcpy(path1, "d1/d2");
400027f5:	8d 83 84 d2 ff ff    	lea    -0x2d7c(%ebx),%eax
400027fb:	50                   	push   %eax
400027fc:	8d 74 24 1c          	lea    0x1c(%esp),%esi
40002800:	56                   	push   %esi
40002801:	e8 ba e4 ff ff       	call   40000cc0 <strcpy>
    strcpy(path2, "f.txt");
40002806:	58                   	pop    %eax
40002807:	8d 83 e0 d2 ff ff    	lea    -0x2d20(%ebx),%eax
4000280d:	5a                   	pop    %edx
4000280e:	89 44 24 10          	mov    %eax,0x10(%esp)
40002812:	50                   	push   %eax
40002813:	8d ac 24 1c 04 00 00 	lea    0x41c(%esp),%ebp
4000281a:	55                   	push   %ebp
4000281b:	e8 a0 e4 ff ff       	call   40000cc0 <strcpy>
    join_path(path3, path1, path2);
40002820:	83 c4 0c             	add    $0xc,%esp
40002823:	55                   	push   %ebp
40002824:	56                   	push   %esi
40002825:	8d bc 24 1c 08 00 00 	lea    0x81c(%esp),%edi
4000282c:	57                   	push   %edi
4000282d:	e8 de 06 00 00       	call   40002f10 <join_path>
    ASSERT(strcmp(path3, "d1/d2/f.txt") == 0);
40002832:	59                   	pop    %ecx
40002833:	58                   	pop    %eax
40002834:	8d 83 90 d2 ff ff    	lea    -0x2d70(%ebx),%eax
4000283a:	50                   	push   %eax
4000283b:	57                   	push   %edi
4000283c:	e8 2f e5 ff ff       	call   40000d70 <strcmp>
40002841:	83 c4 10             	add    $0x10,%esp
40002844:	85 c0                	test   %eax,%eax
40002846:	0f 85 34 03 00 00    	jne    40002b80 <cmd_pathtest+0x3a0>

    join_path(path1, path1, path3);
4000284c:	83 ec 04             	sub    $0x4,%esp
4000284f:	57                   	push   %edi
40002850:	56                   	push   %esi
40002851:	56                   	push   %esi
40002852:	e8 b9 06 00 00       	call   40002f10 <join_path>
    ASSERT(strcmp(path1, "d1/d2/d1/d2/f.txt") == 0);
40002857:	59                   	pop    %ecx
40002858:	58                   	pop    %eax
40002859:	8d 83 8a d2 ff ff    	lea    -0x2d76(%ebx),%eax
4000285f:	50                   	push   %eax
40002860:	56                   	push   %esi
40002861:	e8 0a e5 ff ff       	call   40000d70 <strcmp>
40002866:	83 c4 10             	add    $0x10,%esp
40002869:	85 c0                	test   %eax,%eax
4000286b:	0f 85 6f 06 00 00    	jne    40002ee0 <cmd_pathtest+0x700>

    strcpy(path3, "/");
40002871:	83 ec 08             	sub    $0x8,%esp
40002874:	8d 83 07 d4 ff ff    	lea    -0x2bf9(%ebx),%eax
4000287a:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000287e:	50                   	push   %eax
4000287f:	57                   	push   %edi
40002880:	e8 3b e4 ff ff       	call   40000cc0 <strcpy>
    join_path(path1, path3, path2);
40002885:	83 c4 0c             	add    $0xc,%esp
40002888:	55                   	push   %ebp
40002889:	57                   	push   %edi
4000288a:	56                   	push   %esi
4000288b:	e8 80 06 00 00       	call   40002f10 <join_path>
    ASSERT(strcmp(path1, "/f.txt") == 0);
40002890:	58                   	pop    %eax
40002891:	8d 83 df d2 ff ff    	lea    -0x2d21(%ebx),%eax
40002897:	5a                   	pop    %edx
40002898:	50                   	push   %eax
40002899:	56                   	push   %esi
4000289a:	e8 d1 e4 ff ff       	call   40000d70 <strcmp>
4000289f:	83 c4 10             	add    $0x10,%esp
400028a2:	85 c0                	test   %eax,%eax
400028a4:	0f 85 06 06 00 00    	jne    40002eb0 <cmd_pathtest+0x6d0>

    strcpy(path3, "");
400028aa:	83 ec 08             	sub    $0x8,%esp
400028ad:	8d 83 9b d0 ff ff    	lea    -0x2f65(%ebx),%eax
400028b3:	89 44 24 14          	mov    %eax,0x14(%esp)
400028b7:	50                   	push   %eax
400028b8:	57                   	push   %edi
400028b9:	e8 02 e4 ff ff       	call   40000cc0 <strcpy>
    join_path(path1, path3, path2);
400028be:	83 c4 0c             	add    $0xc,%esp
400028c1:	55                   	push   %ebp
400028c2:	57                   	push   %edi
400028c3:	56                   	push   %esi
400028c4:	e8 47 06 00 00       	call   40002f10 <join_path>
    ASSERT(strcmp(path1, "f.txt") == 0);
400028c9:	5d                   	pop    %ebp
400028ca:	58                   	pop    %eax
400028cb:	ff 74 24 10          	push   0x10(%esp)
400028cf:	56                   	push   %esi
400028d0:	e8 9b e4 ff ff       	call   40000d70 <strcmp>
400028d5:	83 c4 10             	add    $0x10,%esp
400028d8:	85 c0                	test   %eax,%eax
400028da:	0f 85 a0 05 00 00    	jne    40002e80 <cmd_pathtest+0x6a0>

    strcpy(path1, "d1/./d2/../f.txt");
400028e0:	83 ec 08             	sub    $0x8,%esp
400028e3:	8d 83 d5 d2 ff ff    	lea    -0x2d2b(%ebx),%eax
400028e9:	50                   	push   %eax
400028ea:	56                   	push   %esi
400028eb:	e8 d0 e3 ff ff       	call   40000cc0 <strcpy>
    path5 = path1;
    path4 = split_path(path5);
400028f0:	89 34 24             	mov    %esi,(%esp)
400028f3:	e8 e8 06 00 00       	call   40002fe0 <split_path>
    ASSERT(strcmp(path5, "d1") == 0);
400028f8:	59                   	pop    %ecx
400028f9:	5f                   	pop    %edi
    path4 = split_path(path5);
400028fa:	89 c5                	mov    %eax,%ebp
    ASSERT(strcmp(path5, "d1") == 0);
400028fc:	8d 83 e6 d2 ff ff    	lea    -0x2d1a(%ebx),%eax
40002902:	50                   	push   %eax
40002903:	56                   	push   %esi
40002904:	e8 67 e4 ff ff       	call   40000d70 <strcmp>
40002909:	83 c4 10             	add    $0x10,%esp
4000290c:	85 c0                	test   %eax,%eax
4000290e:	0f 85 3c 05 00 00    	jne    40002e50 <cmd_pathtest+0x670>
    ASSERT(strcmp(path4, "./d2/../f.txt") == 0);
40002914:	83 ec 08             	sub    $0x8,%esp
40002917:	8d 83 d8 d2 ff ff    	lea    -0x2d28(%ebx),%eax
4000291d:	50                   	push   %eax
4000291e:	55                   	push   %ebp
4000291f:	e8 4c e4 ff ff       	call   40000d70 <strcmp>
40002924:	83 c4 10             	add    $0x10,%esp
40002927:	85 c0                	test   %eax,%eax
40002929:	0f 85 f1 04 00 00    	jne    40002e20 <cmd_pathtest+0x640>

    path5 = path4;
    path4 = split_path(path5);
4000292f:	83 ec 0c             	sub    $0xc,%esp
40002932:	55                   	push   %ebp
40002933:	e8 a8 06 00 00       	call   40002fe0 <split_path>
40002938:	89 c7                	mov    %eax,%edi
    ASSERT(strcmp(path5, ".") == 0);
4000293a:	58                   	pop    %eax
4000293b:	8d 83 e8 d3 ff ff    	lea    -0x2c18(%ebx),%eax
40002941:	5a                   	pop    %edx
40002942:	50                   	push   %eax
40002943:	55                   	push   %ebp
40002944:	e8 27 e4 ff ff       	call   40000d70 <strcmp>
40002949:	83 c4 10             	add    $0x10,%esp
4000294c:	85 c0                	test   %eax,%eax
4000294e:	0f 85 9c 04 00 00    	jne    40002df0 <cmd_pathtest+0x610>
    ASSERT(strcmp(path4, "d2/../f.txt") == 0);
40002954:	83 ec 08             	sub    $0x8,%esp
40002957:	8d 83 da d2 ff ff    	lea    -0x2d26(%ebx),%eax
4000295d:	50                   	push   %eax
4000295e:	57                   	push   %edi
4000295f:	e8 0c e4 ff ff       	call   40000d70 <strcmp>
40002964:	83 c4 10             	add    $0x10,%esp
40002967:	85 c0                	test   %eax,%eax
40002969:	0f 85 51 04 00 00    	jne    40002dc0 <cmd_pathtest+0x5e0>

    path5 = path4;
    path4 = split_path(path5);
4000296f:	83 ec 0c             	sub    $0xc,%esp
40002972:	57                   	push   %edi
40002973:	e8 68 06 00 00       	call   40002fe0 <split_path>
    ASSERT(strcmp(path5, "d2") == 0);
40002978:	59                   	pop    %ecx
    path4 = split_path(path5);
40002979:	89 c5                	mov    %eax,%ebp
    ASSERT(strcmp(path5, "d2") == 0);
4000297b:	58                   	pop    %eax
4000297c:	8d 83 87 d2 ff ff    	lea    -0x2d79(%ebx),%eax
40002982:	50                   	push   %eax
40002983:	57                   	push   %edi
40002984:	e8 e7 e3 ff ff       	call   40000d70 <strcmp>
40002989:	83 c4 10             	add    $0x10,%esp
4000298c:	85 c0                	test   %eax,%eax
4000298e:	0f 85 fc 03 00 00    	jne    40002d90 <cmd_pathtest+0x5b0>
    ASSERT(strcmp(path4, "../f.txt") == 0);
40002994:	83 ec 08             	sub    $0x8,%esp
40002997:	8d 83 dd d2 ff ff    	lea    -0x2d23(%ebx),%eax
4000299d:	50                   	push   %eax
4000299e:	55                   	push   %ebp
4000299f:	e8 cc e3 ff ff       	call   40000d70 <strcmp>
400029a4:	83 c4 10             	add    $0x10,%esp
400029a7:	85 c0                	test   %eax,%eax
400029a9:	0f 85 b1 03 00 00    	jne    40002d60 <cmd_pathtest+0x580>

    path5 = path4;
    path4 = split_path(path5);
400029af:	83 ec 0c             	sub    $0xc,%esp
400029b2:	55                   	push   %ebp
400029b3:	e8 28 06 00 00       	call   40002fe0 <split_path>
400029b8:	89 c7                	mov    %eax,%edi
    ASSERT(strcmp(path5, "..") == 0);
400029ba:	58                   	pop    %eax
400029bb:	8d 83 e7 d3 ff ff    	lea    -0x2c19(%ebx),%eax
400029c1:	5a                   	pop    %edx
400029c2:	50                   	push   %eax
400029c3:	55                   	push   %ebp
400029c4:	e8 a7 e3 ff ff       	call   40000d70 <strcmp>
400029c9:	83 c4 10             	add    $0x10,%esp
400029cc:	85 c0                	test   %eax,%eax
400029ce:	0f 85 5c 03 00 00    	jne    40002d30 <cmd_pathtest+0x550>
    ASSERT(strcmp(path4, "f.txt") == 0);
400029d4:	83 ec 08             	sub    $0x8,%esp
400029d7:	ff 74 24 10          	push   0x10(%esp)
400029db:	57                   	push   %edi
400029dc:	e8 8f e3 ff ff       	call   40000d70 <strcmp>
400029e1:	83 c4 10             	add    $0x10,%esp
400029e4:	85 c0                	test   %eax,%eax
400029e6:	0f 85 14 03 00 00    	jne    40002d00 <cmd_pathtest+0x520>

    path5 = path4;
    path4 = split_path(path5);
400029ec:	83 ec 0c             	sub    $0xc,%esp
400029ef:	57                   	push   %edi
400029f0:	e8 eb 05 00 00       	call   40002fe0 <split_path>
    ASSERT(strcmp(path5, "f.txt") == 0);
400029f5:	59                   	pop    %ecx
    path4 = split_path(path5);
400029f6:	89 c5                	mov    %eax,%ebp
    ASSERT(strcmp(path5, "f.txt") == 0);
400029f8:	58                   	pop    %eax
400029f9:	ff 74 24 10          	push   0x10(%esp)
400029fd:	57                   	push   %edi
400029fe:	e8 6d e3 ff ff       	call   40000d70 <strcmp>
40002a03:	83 c4 10             	add    $0x10,%esp
40002a06:	85 c0                	test   %eax,%eax
40002a08:	0f 85 c2 02 00 00    	jne    40002cd0 <cmd_pathtest+0x4f0>
    ASSERT(path4 == NULL);
40002a0e:	85 ed                	test   %ebp,%ebp
40002a10:	74 22                	je     40002a34 <cmd_pathtest+0x254>
40002a12:	8d 83 84 d3 ff ff    	lea    -0x2c7c(%ebx),%eax
40002a18:	50                   	push   %eax
40002a19:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002a1f:	50                   	push   %eax
40002a20:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002a26:	68 ef 01 00 00       	push   $0x1ef
40002a2b:	50                   	push   %eax
40002a2c:	e8 1f d8 ff ff       	call   40000250 <panic>
40002a31:	83 c4 10             	add    $0x10,%esp

    strcpy(path5, "");
40002a34:	83 ec 08             	sub    $0x8,%esp
40002a37:	ff 74 24 14          	push   0x14(%esp)
40002a3b:	57                   	push   %edi
40002a3c:	e8 7f e2 ff ff       	call   40000cc0 <strcpy>
    path4 = split_path(path5);
40002a41:	89 3c 24             	mov    %edi,(%esp)
40002a44:	e8 97 05 00 00       	call   40002fe0 <split_path>
40002a49:	89 c5                	mov    %eax,%ebp
    ASSERT(strcmp(path5, "") == 0);
40002a4b:	58                   	pop    %eax
40002a4c:	5a                   	pop    %edx
40002a4d:	ff 74 24 14          	push   0x14(%esp)
40002a51:	57                   	push   %edi
40002a52:	e8 19 e3 ff ff       	call   40000d70 <strcmp>
40002a57:	83 c4 10             	add    $0x10,%esp
40002a5a:	85 c0                	test   %eax,%eax
40002a5c:	0f 85 3e 02 00 00    	jne    40002ca0 <cmd_pathtest+0x4c0>
    ASSERT(path4 == NULL);
40002a62:	85 ed                	test   %ebp,%ebp
40002a64:	74 22                	je     40002a88 <cmd_pathtest+0x2a8>
40002a66:	8d 83 84 d3 ff ff    	lea    -0x2c7c(%ebx),%eax
40002a6c:	50                   	push   %eax
40002a6d:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002a73:	50                   	push   %eax
40002a74:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002a7a:	68 f4 01 00 00       	push   $0x1f4
40002a7f:	50                   	push   %eax
40002a80:	e8 cb d7 ff ff       	call   40000250 <panic>
40002a85:	83 c4 10             	add    $0x10,%esp

    strcpy(path1, "/d1/./d2///../././d3/");
40002a88:	83 ec 08             	sub    $0x8,%esp
40002a8b:	8d 83 a9 d3 ff ff    	lea    -0x2c57(%ebx),%eax
40002a91:	50                   	push   %eax
40002a92:	56                   	push   %esi
40002a93:	e8 28 e2 ff ff       	call   40000cc0 <strcpy>
    normalize_path(path1);
40002a98:	89 34 24             	mov    %esi,(%esp)
40002a9b:	e8 e0 05 00 00       	call   40003080 <normalize_path>
    ASSERT(strcmp(path1, "/d1/d3") == 0);
40002aa0:	8d 83 bf d3 ff ff    	lea    -0x2c41(%ebx),%eax
40002aa6:	59                   	pop    %ecx
40002aa7:	5f                   	pop    %edi
40002aa8:	50                   	push   %eax
40002aa9:	56                   	push   %esi
40002aaa:	e8 c1 e2 ff ff       	call   40000d70 <strcmp>
40002aaf:	83 c4 10             	add    $0x10,%esp
40002ab2:	85 c0                	test   %eax,%eax
40002ab4:	0f 85 b6 01 00 00    	jne    40002c70 <cmd_pathtest+0x490>

    strcpy(path1, "/d1/..");
40002aba:	83 ec 08             	sub    $0x8,%esp
40002abd:	8d 83 e3 d3 ff ff    	lea    -0x2c1d(%ebx),%eax
40002ac3:	50                   	push   %eax
40002ac4:	56                   	push   %esi
40002ac5:	e8 f6 e1 ff ff       	call   40000cc0 <strcpy>
    normalize_path(path1);
40002aca:	89 34 24             	mov    %esi,(%esp)
40002acd:	e8 ae 05 00 00       	call   40003080 <normalize_path>
    ASSERT(strcmp(path1, "/") == 0);
40002ad2:	58                   	pop    %eax
40002ad3:	5a                   	pop    %edx
40002ad4:	ff 74 24 0c          	push   0xc(%esp)
40002ad8:	56                   	push   %esi
40002ad9:	e8 92 e2 ff ff       	call   40000d70 <strcmp>
40002ade:	83 c4 10             	add    $0x10,%esp
40002ae1:	85 c0                	test   %eax,%eax
40002ae3:	0f 85 57 01 00 00    	jne    40002c40 <cmd_pathtest+0x460>

    strcpy(path1, "/..");
40002ae9:	83 ec 08             	sub    $0x8,%esp
40002aec:	8d 83 e6 d3 ff ff    	lea    -0x2c1a(%ebx),%eax
40002af2:	50                   	push   %eax
40002af3:	56                   	push   %esi
40002af4:	e8 c7 e1 ff ff       	call   40000cc0 <strcpy>
    normalize_path(path1);
40002af9:	89 34 24             	mov    %esi,(%esp)
40002afc:	e8 7f 05 00 00       	call   40003080 <normalize_path>
    ASSERT(strcmp(path1, "/") == 0);
40002b01:	5d                   	pop    %ebp
40002b02:	58                   	pop    %eax
40002b03:	ff 74 24 0c          	push   0xc(%esp)
40002b07:	56                   	push   %esi
40002b08:	e8 63 e2 ff ff       	call   40000d70 <strcmp>
40002b0d:	83 c4 10             	add    $0x10,%esp
40002b10:	85 c0                	test   %eax,%eax
40002b12:	0f 85 f8 00 00 00    	jne    40002c10 <cmd_pathtest+0x430>

    strcpy(path1, "/./../");
40002b18:	83 ec 08             	sub    $0x8,%esp
40002b1b:	8d 83 02 d4 ff ff    	lea    -0x2bfe(%ebx),%eax
40002b21:	50                   	push   %eax
40002b22:	56                   	push   %esi
40002b23:	e8 98 e1 ff ff       	call   40000cc0 <strcpy>
    normalize_path(path1);
40002b28:	89 34 24             	mov    %esi,(%esp)
40002b2b:	e8 50 05 00 00       	call   40003080 <normalize_path>
    ASSERT(strcmp(path1, "/") == 0);
40002b30:	59                   	pop    %ecx
40002b31:	5f                   	pop    %edi
40002b32:	ff 74 24 0c          	push   0xc(%esp)
40002b36:	56                   	push   %esi
40002b37:	e8 34 e2 ff ff       	call   40000d70 <strcmp>
40002b3c:	83 c4 10             	add    $0x10,%esp
40002b3f:	85 c0                	test   %eax,%eax
40002b41:	0f 85 99 00 00 00    	jne    40002be0 <cmd_pathtest+0x400>

    strcpy(path1, "/../.");
40002b47:	83 ec 08             	sub    $0x8,%esp
40002b4a:	8d 83 09 d4 ff ff    	lea    -0x2bf7(%ebx),%eax
40002b50:	50                   	push   %eax
40002b51:	56                   	push   %esi
40002b52:	e8 69 e1 ff ff       	call   40000cc0 <strcpy>
    normalize_path(path1);
40002b57:	89 34 24             	mov    %esi,(%esp)
40002b5a:	e8 21 05 00 00       	call   40003080 <normalize_path>
    ASSERT(strcmp(path1, "/") == 0);
40002b5f:	58                   	pop    %eax
40002b60:	5a                   	pop    %edx
40002b61:	ff 74 24 0c          	push   0xc(%esp)
40002b65:	56                   	push   %esi
40002b66:	e8 05 e2 ff ff       	call   40000d70 <strcmp>
40002b6b:	83 c4 10             	add    $0x10,%esp
40002b6e:	85 c0                	test   %eax,%eax
40002b70:	75 3e                	jne    40002bb0 <cmd_pathtest+0x3d0>

    return E_OK;
}
40002b72:	81 c4 1c 0c 00 00    	add    $0xc1c,%esp
40002b78:	31 c0                	xor    %eax,%eax
40002b7a:	5b                   	pop    %ebx
40002b7b:	5e                   	pop    %esi
40002b7c:	5f                   	pop    %edi
40002b7d:	5d                   	pop    %ebp
40002b7e:	c3                   	ret
40002b7f:	90                   	nop
    ASSERT(strcmp(path3, "d1/d2/f.txt") == 0);
40002b80:	8d 83 a0 d6 ff ff    	lea    -0x2960(%ebx),%eax
40002b86:	50                   	push   %eax
40002b87:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002b8d:	50                   	push   %eax
40002b8e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002b94:	68 ca 01 00 00       	push   $0x1ca
40002b99:	50                   	push   %eax
40002b9a:	e8 b1 d6 ff ff       	call   40000250 <panic>
40002b9f:	83 c4 10             	add    $0x10,%esp
40002ba2:	e9 a5 fc ff ff       	jmp    4000284c <cmd_pathtest+0x6c>
40002ba7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002bae:	00 
40002baf:	90                   	nop
    ASSERT(strcmp(path1, "/") == 0);
40002bb0:	8d 83 ea d3 ff ff    	lea    -0x2c16(%ebx),%eax
40002bb6:	50                   	push   %eax
40002bb7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002bbd:	50                   	push   %eax
40002bbe:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002bc4:	68 08 02 00 00       	push   $0x208
40002bc9:	50                   	push   %eax
40002bca:	e8 81 d6 ff ff       	call   40000250 <panic>
40002bcf:	83 c4 10             	add    $0x10,%esp
}
40002bd2:	31 c0                	xor    %eax,%eax
40002bd4:	81 c4 1c 0c 00 00    	add    $0xc1c,%esp
40002bda:	5b                   	pop    %ebx
40002bdb:	5e                   	pop    %esi
40002bdc:	5f                   	pop    %edi
40002bdd:	5d                   	pop    %ebp
40002bde:	c3                   	ret
40002bdf:	90                   	nop
    ASSERT(strcmp(path1, "/") == 0);
40002be0:	8d 83 ea d3 ff ff    	lea    -0x2c16(%ebx),%eax
40002be6:	50                   	push   %eax
40002be7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002bed:	50                   	push   %eax
40002bee:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002bf4:	68 04 02 00 00       	push   $0x204
40002bf9:	50                   	push   %eax
40002bfa:	e8 51 d6 ff ff       	call   40000250 <panic>
40002bff:	83 c4 10             	add    $0x10,%esp
40002c02:	e9 40 ff ff ff       	jmp    40002b47 <cmd_pathtest+0x367>
40002c07:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002c0e:	00 
40002c0f:	90                   	nop
    ASSERT(strcmp(path1, "/") == 0);
40002c10:	8d 83 ea d3 ff ff    	lea    -0x2c16(%ebx),%eax
40002c16:	50                   	push   %eax
40002c17:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002c1d:	50                   	push   %eax
40002c1e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002c24:	68 00 02 00 00       	push   $0x200
40002c29:	50                   	push   %eax
40002c2a:	e8 21 d6 ff ff       	call   40000250 <panic>
40002c2f:	83 c4 10             	add    $0x10,%esp
40002c32:	e9 e1 fe ff ff       	jmp    40002b18 <cmd_pathtest+0x338>
40002c37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002c3e:	00 
40002c3f:	90                   	nop
    ASSERT(strcmp(path1, "/") == 0);
40002c40:	8d 83 ea d3 ff ff    	lea    -0x2c16(%ebx),%eax
40002c46:	50                   	push   %eax
40002c47:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002c4d:	50                   	push   %eax
40002c4e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002c54:	68 fc 01 00 00       	push   $0x1fc
40002c59:	50                   	push   %eax
40002c5a:	e8 f1 d5 ff ff       	call   40000250 <panic>
40002c5f:	83 c4 10             	add    $0x10,%esp
40002c62:	e9 82 fe ff ff       	jmp    40002ae9 <cmd_pathtest+0x309>
40002c67:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002c6e:	00 
40002c6f:	90                   	nop
    ASSERT(strcmp(path1, "/d1/d3") == 0);
40002c70:	8d 83 c6 d3 ff ff    	lea    -0x2c3a(%ebx),%eax
40002c76:	50                   	push   %eax
40002c77:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002c7d:	50                   	push   %eax
40002c7e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002c84:	68 f8 01 00 00       	push   $0x1f8
40002c89:	50                   	push   %eax
40002c8a:	e8 c1 d5 ff ff       	call   40000250 <panic>
40002c8f:	83 c4 10             	add    $0x10,%esp
40002c92:	e9 23 fe ff ff       	jmp    40002aba <cmd_pathtest+0x2da>
40002c97:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002c9e:	00 
40002c9f:	90                   	nop
    ASSERT(strcmp(path5, "") == 0);
40002ca0:	8d 83 92 d3 ff ff    	lea    -0x2c6e(%ebx),%eax
40002ca6:	50                   	push   %eax
40002ca7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002cad:	50                   	push   %eax
40002cae:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002cb4:	68 f3 01 00 00       	push   $0x1f3
40002cb9:	50                   	push   %eax
40002cba:	e8 91 d5 ff ff       	call   40000250 <panic>
40002cbf:	83 c4 10             	add    $0x10,%esp
40002cc2:	e9 9b fd ff ff       	jmp    40002a62 <cmd_pathtest+0x282>
40002cc7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002cce:	00 
40002ccf:	90                   	nop
    ASSERT(strcmp(path5, "f.txt") == 0);
40002cd0:	8d 83 68 d3 ff ff    	lea    -0x2c98(%ebx),%eax
40002cd6:	50                   	push   %eax
40002cd7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002cdd:	50                   	push   %eax
40002cde:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002ce4:	68 ee 01 00 00       	push   $0x1ee
40002ce9:	50                   	push   %eax
40002cea:	e8 61 d5 ff ff       	call   40000250 <panic>
40002cef:	83 c4 10             	add    $0x10,%esp
40002cf2:	e9 17 fd ff ff       	jmp    40002a0e <cmd_pathtest+0x22e>
40002cf7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002cfe:	00 
40002cff:	90                   	nop
    ASSERT(strcmp(path4, "f.txt") == 0);
40002d00:	8d 83 4c d3 ff ff    	lea    -0x2cb4(%ebx),%eax
40002d06:	50                   	push   %eax
40002d07:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002d0d:	50                   	push   %eax
40002d0e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002d14:	68 ea 01 00 00       	push   $0x1ea
40002d19:	50                   	push   %eax
40002d1a:	e8 31 d5 ff ff       	call   40000250 <panic>
40002d1f:	83 c4 10             	add    $0x10,%esp
40002d22:	e9 c5 fc ff ff       	jmp    400029ec <cmd_pathtest+0x20c>
40002d27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002d2e:	00 
40002d2f:	90                   	nop
    ASSERT(strcmp(path5, "..") == 0);
40002d30:	8d 83 33 d3 ff ff    	lea    -0x2ccd(%ebx),%eax
40002d36:	50                   	push   %eax
40002d37:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002d3d:	50                   	push   %eax
40002d3e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002d44:	68 e9 01 00 00       	push   $0x1e9
40002d49:	50                   	push   %eax
40002d4a:	e8 01 d5 ff ff       	call   40000250 <panic>
40002d4f:	83 c4 10             	add    $0x10,%esp
40002d52:	e9 7d fc ff ff       	jmp    400029d4 <cmd_pathtest+0x1f4>
40002d57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002d5e:	00 
40002d5f:	90                   	nop
    ASSERT(strcmp(path4, "../f.txt") == 0);
40002d60:	8d 83 34 d7 ff ff    	lea    -0x28cc(%ebx),%eax
40002d66:	50                   	push   %eax
40002d67:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002d6d:	50                   	push   %eax
40002d6e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002d74:	68 e5 01 00 00       	push   $0x1e5
40002d79:	50                   	push   %eax
40002d7a:	e8 d1 d4 ff ff       	call   40000250 <panic>
40002d7f:	83 c4 10             	add    $0x10,%esp
40002d82:	e9 28 fc ff ff       	jmp    400029af <cmd_pathtest+0x1cf>
40002d87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002d8e:	00 
40002d8f:	90                   	nop
    ASSERT(strcmp(path5, "d2") == 0);
40002d90:	8d 83 1a d3 ff ff    	lea    -0x2ce6(%ebx),%eax
40002d96:	50                   	push   %eax
40002d97:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002d9d:	50                   	push   %eax
40002d9e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002da4:	68 e4 01 00 00       	push   $0x1e4
40002da9:	50                   	push   %eax
40002daa:	e8 a1 d4 ff ff       	call   40000250 <panic>
40002daf:	83 c4 10             	add    $0x10,%esp
40002db2:	e9 dd fb ff ff       	jmp    40002994 <cmd_pathtest+0x1b4>
40002db7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002dbe:	00 
40002dbf:	90                   	nop
    ASSERT(strcmp(path4, "d2/../f.txt") == 0);
40002dc0:	8d 83 10 d7 ff ff    	lea    -0x28f0(%ebx),%eax
40002dc6:	50                   	push   %eax
40002dc7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002dcd:	50                   	push   %eax
40002dce:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002dd4:	68 e0 01 00 00       	push   $0x1e0
40002dd9:	50                   	push   %eax
40002dda:	e8 71 d4 ff ff       	call   40000250 <panic>
40002ddf:	83 c4 10             	add    $0x10,%esp
40002de2:	e9 88 fb ff ff       	jmp    4000296f <cmd_pathtest+0x18f>
40002de7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002dee:	00 
40002def:	90                   	nop
    ASSERT(strcmp(path5, ".") == 0);
40002df0:	8d 83 02 d3 ff ff    	lea    -0x2cfe(%ebx),%eax
40002df6:	50                   	push   %eax
40002df7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002dfd:	50                   	push   %eax
40002dfe:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002e04:	68 df 01 00 00       	push   $0x1df
40002e09:	50                   	push   %eax
40002e0a:	e8 41 d4 ff ff       	call   40000250 <panic>
40002e0f:	83 c4 10             	add    $0x10,%esp
40002e12:	e9 3d fb ff ff       	jmp    40002954 <cmd_pathtest+0x174>
40002e17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002e1e:	00 
40002e1f:	90                   	nop
    ASSERT(strcmp(path4, "./d2/../f.txt") == 0);
40002e20:	8d 83 ec d6 ff ff    	lea    -0x2914(%ebx),%eax
40002e26:	50                   	push   %eax
40002e27:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002e2d:	50                   	push   %eax
40002e2e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002e34:	68 db 01 00 00       	push   $0x1db
40002e39:	50                   	push   %eax
40002e3a:	e8 11 d4 ff ff       	call   40000250 <panic>
40002e3f:	83 c4 10             	add    $0x10,%esp
40002e42:	e9 e8 fa ff ff       	jmp    4000292f <cmd_pathtest+0x14f>
40002e47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002e4e:	00 
40002e4f:	90                   	nop
    ASSERT(strcmp(path5, "d1") == 0);
40002e50:	8d 83 e9 d2 ff ff    	lea    -0x2d17(%ebx),%eax
40002e56:	50                   	push   %eax
40002e57:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002e5d:	50                   	push   %eax
40002e5e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002e64:	68 da 01 00 00       	push   $0x1da
40002e69:	50                   	push   %eax
40002e6a:	e8 e1 d3 ff ff       	call   40000250 <panic>
40002e6f:	83 c4 10             	add    $0x10,%esp
40002e72:	e9 9d fa ff ff       	jmp    40002914 <cmd_pathtest+0x134>
40002e77:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002e7e:	00 
40002e7f:	90                   	nop
    ASSERT(strcmp(path1, "f.txt") == 0);
40002e80:	8d 83 b9 d2 ff ff    	lea    -0x2d47(%ebx),%eax
40002e86:	50                   	push   %eax
40002e87:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002e8d:	50                   	push   %eax
40002e8e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002e94:	68 d5 01 00 00       	push   $0x1d5
40002e99:	50                   	push   %eax
40002e9a:	e8 b1 d3 ff ff       	call   40000250 <panic>
40002e9f:	83 c4 10             	add    $0x10,%esp
40002ea2:	e9 39 fa ff ff       	jmp    400028e0 <cmd_pathtest+0x100>
40002ea7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002eae:	00 
40002eaf:	90                   	nop
    ASSERT(strcmp(path1, "/f.txt") == 0);
40002eb0:	8d 83 9c d2 ff ff    	lea    -0x2d64(%ebx),%eax
40002eb6:	50                   	push   %eax
40002eb7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002ebd:	50                   	push   %eax
40002ebe:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002ec4:	68 d1 01 00 00       	push   $0x1d1
40002ec9:	50                   	push   %eax
40002eca:	e8 81 d3 ff ff       	call   40000250 <panic>
40002ecf:	83 c4 10             	add    $0x10,%esp
40002ed2:	e9 d3 f9 ff ff       	jmp    400028aa <cmd_pathtest+0xca>
40002ed7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002ede:	00 
40002edf:	90                   	nop
    ASSERT(strcmp(path1, "d1/d2/d1/d2/f.txt") == 0);
40002ee0:	8d 83 c4 d6 ff ff    	lea    -0x293c(%ebx),%eax
40002ee6:	50                   	push   %eax
40002ee7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002eed:	50                   	push   %eax
40002eee:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
40002ef4:	68 cd 01 00 00       	push   $0x1cd
40002ef9:	50                   	push   %eax
40002efa:	e8 51 d3 ff ff       	call   40000250 <panic>
40002eff:	83 c4 10             	add    $0x10,%esp
40002f02:	e9 6a f9 ff ff       	jmp    40002871 <cmd_pathtest+0x91>

40002f07 <__x86.get_pc_thunk.si>:
40002f07:	8b 34 24             	mov    (%esp),%esi
40002f0a:	c3                   	ret

40002f0b <__x86.get_pc_thunk.bp>:
40002f0b:	8b 2c 24             	mov    (%esp),%ebp
40002f0e:	c3                   	ret
40002f0f:	90                   	nop

40002f10 <join_path>:
#include "shell.h"
#include <stdio.h>

void join_path(char *dst, char *p1, char *p2)
{
40002f10:	55                   	push   %ebp
40002f11:	57                   	push   %edi
40002f12:	56                   	push   %esi
40002f13:	53                   	push   %ebx
40002f14:	e8 7e d3 ff ff       	call   40000297 <__x86.get_pc_thunk.bx>
40002f19:	81 c3 db 40 00 00    	add    $0x40db,%ebx
40002f1f:	83 ec 0c             	sub    $0xc,%esp
40002f22:	8b 6c 24 28          	mov    0x28(%esp),%ebp
40002f26:	8b 74 24 20          	mov    0x20(%esp),%esi
40002f2a:	8b 7c 24 24          	mov    0x24(%esp),%edi
    ASSERT(*p2 != '\0');
40002f2e:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
40002f32:	74 5c                	je     40002f90 <join_path+0x80>

    // Check for in-place update
    if (dst != p1) {
40002f34:	39 fe                	cmp    %edi,%esi
40002f36:	74 0d                	je     40002f45 <join_path+0x35>
        strcpy(dst, p1);
40002f38:	83 ec 08             	sub    $0x8,%esp
40002f3b:	57                   	push   %edi
40002f3c:	56                   	push   %esi
40002f3d:	e8 7e dd ff ff       	call   40000cc0 <strcpy>
40002f42:	83 c4 10             	add    $0x10,%esp
    }
    dst += strlen(p1);
40002f45:	83 ec 0c             	sub    $0xc,%esp
40002f48:	57                   	push   %edi
40002f49:	e8 12 dd ff ff       	call   40000c60 <strlen>
    if (*p1 != '\0' && *(dst - 1) != '/') {
40002f4e:	83 c4 10             	add    $0x10,%esp
    dst += strlen(p1);
40002f51:	01 c6                	add    %eax,%esi
    if (*p1 != '\0' && *(dst - 1) != '/') {
40002f53:	80 3f 00             	cmpb   $0x0,(%edi)
40002f56:	74 0c                	je     40002f64 <join_path+0x54>
40002f58:	80 7e ff 2f          	cmpb   $0x2f,-0x1(%esi)
40002f5c:	74 06                	je     40002f64 <join_path+0x54>
        *dst = '/';
40002f5e:	c6 06 2f             	movb   $0x2f,(%esi)
        dst++;
40002f61:	83 c6 01             	add    $0x1,%esi
    }
    strcpy(dst, p2);
40002f64:	83 ec 08             	sub    $0x8,%esp
40002f67:	55                   	push   %ebp
40002f68:	56                   	push   %esi
40002f69:	e8 52 dd ff ff       	call   40000cc0 <strcpy>
    ASSERT(*(dst + strlen(p2)) == '\0');
40002f6e:	89 2c 24             	mov    %ebp,(%esp)
40002f71:	e8 ea dc ff ff       	call   40000c60 <strlen>
40002f76:	83 c4 10             	add    $0x10,%esp
40002f79:	80 3c 06 00          	cmpb   $0x0,(%esi,%eax,1)
40002f7d:	75 39                	jne    40002fb8 <join_path+0xa8>
}
40002f7f:	83 c4 0c             	add    $0xc,%esp
40002f82:	5b                   	pop    %ebx
40002f83:	5e                   	pop    %esi
40002f84:	5f                   	pop    %edi
40002f85:	5d                   	pop    %ebp
40002f86:	c3                   	ret
40002f87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002f8e:	00 
40002f8f:	90                   	nop
    ASSERT(*p2 != '\0');
40002f90:	8d 83 0f d4 ff ff    	lea    -0x2bf1(%ebx),%eax
40002f96:	50                   	push   %eax
40002f97:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002f9d:	50                   	push   %eax
40002f9e:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
40002fa4:	6a 06                	push   $0x6
40002fa6:	50                   	push   %eax
40002fa7:	e8 a4 d2 ff ff       	call   40000250 <panic>
40002fac:	83 c4 10             	add    $0x10,%esp
40002faf:	eb 83                	jmp    40002f34 <join_path+0x24>
40002fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ASSERT(*(dst + strlen(p2)) == '\0');
40002fb8:	8d 83 2d d4 ff ff    	lea    -0x2bd3(%ebx),%eax
40002fbe:	50                   	push   %eax
40002fbf:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40002fc5:	50                   	push   %eax
40002fc6:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
40002fcc:	6a 12                	push   $0x12
40002fce:	50                   	push   %eax
40002fcf:	e8 7c d2 ff ff       	call   40000250 <panic>
40002fd4:	83 c4 10             	add    $0x10,%esp
}
40002fd7:	83 c4 0c             	add    $0xc,%esp
40002fda:	5b                   	pop    %ebx
40002fdb:	5e                   	pop    %esi
40002fdc:	5f                   	pop    %edi
40002fdd:	5d                   	pop    %ebp
40002fde:	c3                   	ret
40002fdf:	90                   	nop

40002fe0 <split_path>:

// Replace path with the first component of the path and return the remainder.
char *split_path(char *path)
{
40002fe0:	56                   	push   %esi
40002fe1:	53                   	push   %ebx
40002fe2:	e8 b0 d2 ff ff       	call   40000297 <__x86.get_pc_thunk.bx>
40002fe7:	81 c3 0d 40 00 00    	add    $0x400d,%ebx
40002fed:	83 ec 04             	sub    $0x4,%esp
40002ff0:	8b 74 24 10          	mov    0x10(%esp),%esi
    char *rest = NULL;

    ASSERT(*path != '/');
40002ff4:	0f b6 06             	movzbl (%esi),%eax
40002ff7:	3c 2f                	cmp    $0x2f,%al
40002ff9:	74 25                	je     40003020 <split_path+0x40>

    while (*path != '/' && *path != '\0') {
40002ffb:	84 c0                	test   %al,%al
40002ffd:	74 14                	je     40003013 <split_path+0x33>
40002fff:	90                   	nop
40003000:	0f b6 46 01          	movzbl 0x1(%esi),%eax
        path++;
40003004:	83 c6 01             	add    $0x1,%esi
    while (*path != '/' && *path != '\0') {
40003007:	3c 2f                	cmp    $0x2f,%al
40003009:	74 45                	je     40003050 <split_path+0x70>
4000300b:	84 c0                	test   %al,%al
4000300d:	75 f1                	jne    40003000 <split_path+0x20>
    }

    if (*path == '/') {
4000300f:	3c 2f                	cmp    $0x2f,%al
40003011:	74 3d                	je     40003050 <split_path+0x70>
            rest = NULL;
        }
    }

    return rest;
}
40003013:	83 c4 04             	add    $0x4,%esp
    char *rest = NULL;
40003016:	31 c0                	xor    %eax,%eax
}
40003018:	5b                   	pop    %ebx
40003019:	5e                   	pop    %esi
4000301a:	c3                   	ret
4000301b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    ASSERT(*path != '/');
40003020:	8d 83 49 d4 ff ff    	lea    -0x2bb7(%ebx),%eax
40003026:	50                   	push   %eax
40003027:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
4000302d:	50                   	push   %eax
4000302e:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
40003034:	6a 1a                	push   $0x1a
40003036:	50                   	push   %eax
40003037:	e8 14 d2 ff ff       	call   40000250 <panic>
    while (*path != '/' && *path != '\0') {
4000303c:	0f b6 06             	movzbl (%esi),%eax
4000303f:	83 c4 10             	add    $0x10,%esp
40003042:	3c 2f                	cmp    $0x2f,%al
40003044:	75 c5                	jne    4000300b <split_path+0x2b>
40003046:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000304d:	00 
4000304e:	66 90                	xchg   %ax,%ax
        while (*rest == '/' && *rest != '\0') {
40003050:	0f b6 56 01          	movzbl 0x1(%esi),%edx
        *path = '\0';
40003054:	c6 06 00             	movb   $0x0,(%esi)
        rest = path + 1;
40003057:	8d 46 01             	lea    0x1(%esi),%eax
        while (*rest == '/' && *rest != '\0') {
4000305a:	80 fa 2f             	cmp    $0x2f,%dl
4000305d:	75 0d                	jne    4000306c <split_path+0x8c>
4000305f:	90                   	nop
40003060:	0f b6 50 01          	movzbl 0x1(%eax),%edx
            rest++;
40003064:	83 c0 01             	add    $0x1,%eax
        while (*rest == '/' && *rest != '\0') {
40003067:	80 fa 2f             	cmp    $0x2f,%dl
4000306a:	74 f4                	je     40003060 <split_path+0x80>
        if (*rest == '\0') {
4000306c:	84 d2                	test   %dl,%dl
4000306e:	74 a3                	je     40003013 <split_path+0x33>
}
40003070:	83 c4 04             	add    $0x4,%esp
40003073:	5b                   	pop    %ebx
40003074:	5e                   	pop    %esi
40003075:	c3                   	ret
40003076:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000307d:	00 
4000307e:	66 90                	xchg   %ax,%ax

40003080 <normalize_path>:

void normalize_path(char *path)
{
40003080:	55                   	push   %ebp
40003081:	89 e5                	mov    %esp,%ebp
40003083:	57                   	push   %edi
40003084:	56                   	push   %esi
40003085:	53                   	push   %ebx
40003086:	e8 0c d2 ff ff       	call   40000297 <__x86.get_pc_thunk.bx>
4000308b:	81 c3 69 3f 00 00    	add    $0x3f69,%ebx
40003091:	83 ec 38             	sub    $0x38,%esp
    int len = strlen(path);
40003094:	ff 75 08             	push   0x8(%ebp)
40003097:	e8 c4 db ff ff       	call   40000c60 <strlen>
    char *norm = alloca(len + 1);
4000309c:	83 c4 10             	add    $0x10,%esp
    int len = strlen(path);
4000309f:	89 45 d0             	mov    %eax,-0x30(%ebp)
    char *norm = alloca(len + 1);
400030a2:	83 c0 1c             	add    $0x1c,%eax
400030a5:	89 e1                	mov    %esp,%ecx
400030a7:	89 c2                	mov    %eax,%edx
400030a9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
400030ae:	29 c1                	sub    %eax,%ecx
400030b0:	83 e2 f0             	and    $0xfffffff0,%edx
400030b3:	39 cc                	cmp    %ecx,%esp
400030b5:	74 12                	je     400030c9 <normalize_path+0x49>
400030b7:	81 ec 00 10 00 00    	sub    $0x1000,%esp
400030bd:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
400030c4:	00 
400030c5:	39 cc                	cmp    %ecx,%esp
400030c7:	75 ee                	jne    400030b7 <normalize_path+0x37>
400030c9:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
400030cf:	29 d4                	sub    %edx,%esp
400030d1:	85 d2                	test   %edx,%edx
400030d3:	0f 85 7f 02 00 00    	jne    40003358 <normalize_path+0x2d8>
    char *next;

    ASSERT(*path == '/');
    *norm = '/';
    norm_end++;
    path++;
400030d9:	8b 55 08             	mov    0x8(%ebp),%edx
    char *norm = alloca(len + 1);
400030dc:	8d 44 24 0f          	lea    0xf(%esp),%eax
400030e0:	83 e0 f0             	and    $0xfffffff0,%eax
    ASSERT(*path == '/');
400030e3:	80 3a 2f             	cmpb   $0x2f,(%edx)
    char *norm = alloca(len + 1);
400030e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    path++;
400030e9:	8d 7a 01             	lea    0x1(%edx),%edi
    norm_end++;
400030ec:	8d 70 01             	lea    0x1(%eax),%esi
    ASSERT(*path == '/');
400030ef:	0f 85 9b 00 00 00    	jne    40003190 <normalize_path+0x110>
    *norm = '/';
400030f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
400030f8:	c6 00 2f             	movb   $0x2f,(%eax)
400030fb:	8d 83 e8 d3 ff ff    	lea    -0x2c18(%ebx),%eax
40003101:	89 45 dc             	mov    %eax,-0x24(%ebp)

    while (path != NULL) {
        ASSERT(norm < norm_end);
40003104:	8d 83 63 d4 ff ff    	lea    -0x2b9d(%ebx),%eax
4000310a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
4000310d:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40003113:	89 45 d8             	mov    %eax,-0x28(%ebp)
40003116:	89 f0                	mov    %esi,%eax
40003118:	89 fe                	mov    %edi,%esi
4000311a:	89 c7                	mov    %eax,%edi
4000311c:	eb 51                	jmp    4000316f <normalize_path+0xef>
4000311e:	66 90                	xchg   %ax,%ax
        ASSERT(*norm == '/');
40003120:	8b 45 e0             	mov    -0x20(%ebp),%eax
40003123:	80 38 2f             	cmpb   $0x2f,(%eax)
40003126:	74 1b                	je     40003143 <normalize_path+0xc3>
40003128:	8d 83 73 d4 ff ff    	lea    -0x2b8d(%ebx),%eax
4000312e:	50                   	push   %eax
4000312f:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
40003135:	ff 75 d8             	push   -0x28(%ebp)
40003138:	6a 3f                	push   $0x3f
4000313a:	50                   	push   %eax
4000313b:	e8 10 d1 ff ff       	call   40000250 <panic>
40003140:	83 c4 10             	add    $0x10,%esp
        next = split_path(path);
40003143:	83 ec 0c             	sub    $0xc,%esp
40003146:	56                   	push   %esi
40003147:	e8 94 fe ff ff       	call   40002fe0 <split_path>
4000314c:	89 45 e4             	mov    %eax,-0x1c(%ebp)

        if (strcmp(path, ".") == 0) {
4000314f:	5a                   	pop    %edx
40003150:	59                   	pop    %ecx
40003151:	ff 75 dc             	push   -0x24(%ebp)
40003154:	56                   	push   %esi
40003155:	e8 16 dc ff ff       	call   40000d70 <strcmp>
4000315a:	83 c4 10             	add    $0x10,%esp
4000315d:	85 c0                	test   %eax,%eax
4000315f:	75 5f                	jne    400031c0 <normalize_path+0x140>
    while (path != NULL) {
40003161:	8b 45 e4             	mov    -0x1c(%ebp),%eax
40003164:	85 c0                	test   %eax,%eax
40003166:	0f 84 a4 00 00 00    	je     40003210 <normalize_path+0x190>
4000316c:	8b 75 e4             	mov    -0x1c(%ebp),%esi
        ASSERT(norm < norm_end);
4000316f:	39 7d e0             	cmp    %edi,-0x20(%ebp)
40003172:	72 ac                	jb     40003120 <normalize_path+0xa0>
40003174:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
4000317a:	ff 75 d4             	push   -0x2c(%ebp)
4000317d:	ff 75 d8             	push   -0x28(%ebp)
40003180:	6a 3e                	push   $0x3e
40003182:	50                   	push   %eax
40003183:	e8 c8 d0 ff ff       	call   40000250 <panic>
40003188:	83 c4 10             	add    $0x10,%esp
4000318b:	eb 93                	jmp    40003120 <normalize_path+0xa0>
4000318d:	8d 76 00             	lea    0x0(%esi),%esi
    ASSERT(*path == '/');
40003190:	8d 83 56 d4 ff ff    	lea    -0x2baa(%ebx),%eax
40003196:	50                   	push   %eax
40003197:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
4000319d:	50                   	push   %eax
4000319e:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
400031a4:	6a 38                	push   $0x38
400031a6:	50                   	push   %eax
400031a7:	e8 a4 d0 ff ff       	call   40000250 <panic>
    norm_end++;
400031ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
400031af:	83 c4 10             	add    $0x10,%esp
400031b2:	8d 70 01             	lea    0x1(%eax),%esi
    while (path != NULL) {
400031b5:	e9 3b ff ff ff       	jmp    400030f5 <normalize_path+0x75>
400031ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            // Skip
        }
        else if (strcmp(path, "..") == 0) {
400031c0:	83 ec 08             	sub    $0x8,%esp
400031c3:	8d 83 e7 d3 ff ff    	lea    -0x2c19(%ebx),%eax
400031c9:	50                   	push   %eax
400031ca:	56                   	push   %esi
400031cb:	e8 a0 db ff ff       	call   40000d70 <strcmp>
400031d0:	83 c4 10             	add    $0x10,%esp
400031d3:	85 c0                	test   %eax,%eax
400031d5:	0f 84 d5 00 00 00    	je     400032b0 <normalize_path+0x230>
            // Remove one dir
            while (norm < norm_end && *(norm_end - 1) != '/') {
                norm_end--;
            }
        }
        else if (*path != '\0') {
400031db:	80 3e 00             	cmpb   $0x0,(%esi)
400031de:	74 81                	je     40003161 <normalize_path+0xe1>
            // Copy and add trailing '/'
            if (*(norm_end - 1) != '/') {
400031e0:	80 7f ff 2f          	cmpb   $0x2f,-0x1(%edi)
400031e4:	74 06                	je     400031ec <normalize_path+0x16c>
                *norm_end = '/';
400031e6:	c6 07 2f             	movb   $0x2f,(%edi)
                norm_end++;
400031e9:	83 c7 01             	add    $0x1,%edi
            }
            strcpy(norm_end, path);
400031ec:	83 ec 08             	sub    $0x8,%esp
400031ef:	56                   	push   %esi
400031f0:	57                   	push   %edi
400031f1:	e8 ca da ff ff       	call   40000cc0 <strcpy>
            norm_end += strlen(path);
400031f6:	89 34 24             	mov    %esi,(%esp)
400031f9:	e8 62 da ff ff       	call   40000c60 <strlen>
400031fe:	83 c4 10             	add    $0x10,%esp
40003201:	01 c7                	add    %eax,%edi
    while (path != NULL) {
40003203:	8b 45 e4             	mov    -0x1c(%ebp),%eax
40003206:	85 c0                	test   %eax,%eax
40003208:	0f 85 5e ff ff ff    	jne    4000316c <normalize_path+0xec>
4000320e:	66 90                	xchg   %ax,%ax
        }

        path = next;
    }

    ASSERT(norm < norm_end);
40003210:	89 fe                	mov    %edi,%esi
40003212:	39 7d e0             	cmp    %edi,-0x20(%ebp)
40003215:	0f 83 c5 00 00 00    	jae    400032e0 <normalize_path+0x260>
    ASSERT(*norm == '/');
4000321b:	8b 45 e0             	mov    -0x20(%ebp),%eax
4000321e:	80 38 2f             	cmpb   $0x2f,(%eax)
40003221:	74 1f                	je     40003242 <normalize_path+0x1c2>
40003223:	8d 83 73 d4 ff ff    	lea    -0x2b8d(%ebx),%eax
40003229:	50                   	push   %eax
4000322a:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40003230:	50                   	push   %eax
40003231:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
40003237:	6a 59                	push   $0x59
40003239:	50                   	push   %eax
4000323a:	e8 11 d0 ff ff       	call   40000250 <panic>
4000323f:	83 c4 10             	add    $0x10,%esp
    *norm_end = '\0';

    ASSERT(strlen(norm) == norm_end - norm);
40003242:	8b 7d e0             	mov    -0x20(%ebp),%edi
40003245:	83 ec 0c             	sub    $0xc,%esp
    *norm_end = '\0';
40003248:	c6 06 00             	movb   $0x0,(%esi)
    ASSERT(strlen(norm) == norm_end - norm);
4000324b:	57                   	push   %edi
4000324c:	29 fe                	sub    %edi,%esi
4000324e:	e8 0d da ff ff       	call   40000c60 <strlen>
40003253:	83 c4 10             	add    $0x10,%esp
40003256:	39 f0                	cmp    %esi,%eax
40003258:	74 1f                	je     40003279 <normalize_path+0x1f9>
4000325a:	8d 83 54 d7 ff ff    	lea    -0x28ac(%ebx),%eax
40003260:	50                   	push   %eax
40003261:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40003267:	50                   	push   %eax
40003268:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
4000326e:	6a 5c                	push   $0x5c
40003270:	50                   	push   %eax
40003271:	e8 da cf ff ff       	call   40000250 <panic>
40003276:	83 c4 10             	add    $0x10,%esp
    ASSERT(norm_end - norm <= len);
40003279:	8b 45 d0             	mov    -0x30(%ebp),%eax
4000327c:	39 c6                	cmp    %eax,%esi
4000327e:	0f 8f ac 00 00 00    	jg     40003330 <normalize_path+0x2b0>
    strcpy(ret, norm);
40003284:	83 ec 08             	sub    $0x8,%esp
40003287:	ff 75 e0             	push   -0x20(%ebp)
4000328a:	ff 75 08             	push   0x8(%ebp)
4000328d:	e8 2e da ff ff       	call   40000cc0 <strcpy>
    ASSERT(*(ret + (norm_end - norm)) == '\0');
40003292:	8b 45 08             	mov    0x8(%ebp),%eax
40003295:	83 c4 10             	add    $0x10,%esp
40003298:	80 3c 30 00          	cmpb   $0x0,(%eax,%esi,1)
4000329c:	75 6a                	jne    40003308 <normalize_path+0x288>
}
4000329e:	8d 65 f4             	lea    -0xc(%ebp),%esp
400032a1:	5b                   	pop    %ebx
400032a2:	5e                   	pop    %esi
400032a3:	5f                   	pop    %edi
400032a4:	5d                   	pop    %ebp
400032a5:	c3                   	ret
400032a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400032ad:	00 
400032ae:	66 90                	xchg   %ax,%ax
            while (norm < norm_end && *(norm_end - 1) != '/') {
400032b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
400032b3:	39 7d e0             	cmp    %edi,-0x20(%ebp)
400032b6:	72 13                	jb     400032cb <normalize_path+0x24b>
400032b8:	e9 a4 fe ff ff       	jmp    40003161 <normalize_path+0xe1>
400032bd:	8d 76 00             	lea    0x0(%esi),%esi
                norm_end--;
400032c0:	83 ef 01             	sub    $0x1,%edi
            while (norm < norm_end && *(norm_end - 1) != '/') {
400032c3:	39 f8                	cmp    %edi,%eax
400032c5:	0f 84 96 fe ff ff    	je     40003161 <normalize_path+0xe1>
400032cb:	80 7f ff 2f          	cmpb   $0x2f,-0x1(%edi)
400032cf:	75 ef                	jne    400032c0 <normalize_path+0x240>
400032d1:	e9 8b fe ff ff       	jmp    40003161 <normalize_path+0xe1>
400032d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400032dd:	00 
400032de:	66 90                	xchg   %ax,%ax
    ASSERT(norm < norm_end);
400032e0:	8d 83 63 d4 ff ff    	lea    -0x2b9d(%ebx),%eax
400032e6:	50                   	push   %eax
400032e7:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
400032ed:	50                   	push   %eax
400032ee:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
400032f4:	6a 58                	push   $0x58
400032f6:	50                   	push   %eax
400032f7:	e8 54 cf ff ff       	call   40000250 <panic>
400032fc:	83 c4 10             	add    $0x10,%esp
400032ff:	e9 17 ff ff ff       	jmp    4000321b <normalize_path+0x19b>
40003304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ASSERT(*(ret + (norm_end - norm)) == '\0');
40003308:	8d 83 74 d7 ff ff    	lea    -0x288c(%ebx),%eax
4000330e:	50                   	push   %eax
4000330f:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
40003315:	50                   	push   %eax
40003316:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
4000331c:	6a 5f                	push   $0x5f
4000331e:	50                   	push   %eax
4000331f:	e8 2c cf ff ff       	call   40000250 <panic>
40003324:	83 c4 10             	add    $0x10,%esp
}
40003327:	8d 65 f4             	lea    -0xc(%ebp),%esp
4000332a:	5b                   	pop    %ebx
4000332b:	5e                   	pop    %esi
4000332c:	5f                   	pop    %edi
4000332d:	5d                   	pop    %ebp
4000332e:	c3                   	ret
4000332f:	90                   	nop
    ASSERT(norm_end - norm <= len);
40003330:	8d 83 80 d4 ff ff    	lea    -0x2b80(%ebx),%eax
40003336:	50                   	push   %eax
40003337:	8d 83 48 d0 ff ff    	lea    -0x2fb8(%ebx),%eax
4000333d:	50                   	push   %eax
4000333e:	8d 83 1b d4 ff ff    	lea    -0x2be5(%ebx),%eax
40003344:	6a 5d                	push   $0x5d
40003346:	50                   	push   %eax
40003347:	e8 04 cf ff ff       	call   40000250 <panic>
4000334c:	83 c4 10             	add    $0x10,%esp
4000334f:	e9 30 ff ff ff       	jmp    40003284 <normalize_path+0x204>
40003354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    char *norm = alloca(len + 1);
40003358:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
4000335d:	e9 77 fd ff ff       	jmp    400030d9 <normalize_path+0x59>
40003362:	66 90                	xchg   %ax,%ax
40003364:	66 90                	xchg   %ax,%ax
40003366:	66 90                	xchg   %ax,%ax
40003368:	66 90                	xchg   %ax,%ax
4000336a:	66 90                	xchg   %ax,%ax
4000336c:	66 90                	xchg   %ax,%ax
4000336e:	66 90                	xchg   %ax,%ax

40003370 <__udivdi3>:
40003370:	f3 0f 1e fb          	endbr32
40003374:	55                   	push   %ebp
40003375:	57                   	push   %edi
40003376:	56                   	push   %esi
40003377:	53                   	push   %ebx
40003378:	83 ec 1c             	sub    $0x1c,%esp
4000337b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
4000337f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
40003383:	8b 74 24 34          	mov    0x34(%esp),%esi
40003387:	8b 5c 24 38          	mov    0x38(%esp),%ebx
4000338b:	85 c0                	test   %eax,%eax
4000338d:	75 19                	jne    400033a8 <__udivdi3+0x38>
4000338f:	39 de                	cmp    %ebx,%esi
40003391:	73 4d                	jae    400033e0 <__udivdi3+0x70>
40003393:	31 ff                	xor    %edi,%edi
40003395:	89 e8                	mov    %ebp,%eax
40003397:	89 f2                	mov    %esi,%edx
40003399:	f7 f3                	div    %ebx
4000339b:	89 fa                	mov    %edi,%edx
4000339d:	83 c4 1c             	add    $0x1c,%esp
400033a0:	5b                   	pop    %ebx
400033a1:	5e                   	pop    %esi
400033a2:	5f                   	pop    %edi
400033a3:	5d                   	pop    %ebp
400033a4:	c3                   	ret
400033a5:	8d 76 00             	lea    0x0(%esi),%esi
400033a8:	39 c6                	cmp    %eax,%esi
400033aa:	73 14                	jae    400033c0 <__udivdi3+0x50>
400033ac:	31 ff                	xor    %edi,%edi
400033ae:	31 c0                	xor    %eax,%eax
400033b0:	89 fa                	mov    %edi,%edx
400033b2:	83 c4 1c             	add    $0x1c,%esp
400033b5:	5b                   	pop    %ebx
400033b6:	5e                   	pop    %esi
400033b7:	5f                   	pop    %edi
400033b8:	5d                   	pop    %ebp
400033b9:	c3                   	ret
400033ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400033c0:	0f bd f8             	bsr    %eax,%edi
400033c3:	83 f7 1f             	xor    $0x1f,%edi
400033c6:	75 48                	jne    40003410 <__udivdi3+0xa0>
400033c8:	39 f0                	cmp    %esi,%eax
400033ca:	72 06                	jb     400033d2 <__udivdi3+0x62>
400033cc:	31 c0                	xor    %eax,%eax
400033ce:	39 dd                	cmp    %ebx,%ebp
400033d0:	72 de                	jb     400033b0 <__udivdi3+0x40>
400033d2:	b8 01 00 00 00       	mov    $0x1,%eax
400033d7:	eb d7                	jmp    400033b0 <__udivdi3+0x40>
400033d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400033e0:	89 d9                	mov    %ebx,%ecx
400033e2:	85 db                	test   %ebx,%ebx
400033e4:	75 0b                	jne    400033f1 <__udivdi3+0x81>
400033e6:	b8 01 00 00 00       	mov    $0x1,%eax
400033eb:	31 d2                	xor    %edx,%edx
400033ed:	f7 f3                	div    %ebx
400033ef:	89 c1                	mov    %eax,%ecx
400033f1:	31 d2                	xor    %edx,%edx
400033f3:	89 f0                	mov    %esi,%eax
400033f5:	f7 f1                	div    %ecx
400033f7:	89 c6                	mov    %eax,%esi
400033f9:	89 e8                	mov    %ebp,%eax
400033fb:	89 f7                	mov    %esi,%edi
400033fd:	f7 f1                	div    %ecx
400033ff:	89 fa                	mov    %edi,%edx
40003401:	83 c4 1c             	add    $0x1c,%esp
40003404:	5b                   	pop    %ebx
40003405:	5e                   	pop    %esi
40003406:	5f                   	pop    %edi
40003407:	5d                   	pop    %ebp
40003408:	c3                   	ret
40003409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40003410:	89 f9                	mov    %edi,%ecx
40003412:	ba 20 00 00 00       	mov    $0x20,%edx
40003417:	29 fa                	sub    %edi,%edx
40003419:	d3 e0                	shl    %cl,%eax
4000341b:	89 44 24 08          	mov    %eax,0x8(%esp)
4000341f:	89 d1                	mov    %edx,%ecx
40003421:	89 d8                	mov    %ebx,%eax
40003423:	d3 e8                	shr    %cl,%eax
40003425:	89 c1                	mov    %eax,%ecx
40003427:	8b 44 24 08          	mov    0x8(%esp),%eax
4000342b:	09 c1                	or     %eax,%ecx
4000342d:	89 f0                	mov    %esi,%eax
4000342f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40003433:	89 f9                	mov    %edi,%ecx
40003435:	d3 e3                	shl    %cl,%ebx
40003437:	89 d1                	mov    %edx,%ecx
40003439:	d3 e8                	shr    %cl,%eax
4000343b:	89 f9                	mov    %edi,%ecx
4000343d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40003441:	89 eb                	mov    %ebp,%ebx
40003443:	d3 e6                	shl    %cl,%esi
40003445:	89 d1                	mov    %edx,%ecx
40003447:	d3 eb                	shr    %cl,%ebx
40003449:	09 f3                	or     %esi,%ebx
4000344b:	89 c6                	mov    %eax,%esi
4000344d:	89 f2                	mov    %esi,%edx
4000344f:	89 d8                	mov    %ebx,%eax
40003451:	f7 74 24 08          	divl   0x8(%esp)
40003455:	89 d6                	mov    %edx,%esi
40003457:	89 c3                	mov    %eax,%ebx
40003459:	f7 64 24 0c          	mull   0xc(%esp)
4000345d:	39 d6                	cmp    %edx,%esi
4000345f:	72 1f                	jb     40003480 <__udivdi3+0x110>
40003461:	89 f9                	mov    %edi,%ecx
40003463:	d3 e5                	shl    %cl,%ebp
40003465:	39 c5                	cmp    %eax,%ebp
40003467:	73 04                	jae    4000346d <__udivdi3+0xfd>
40003469:	39 d6                	cmp    %edx,%esi
4000346b:	74 13                	je     40003480 <__udivdi3+0x110>
4000346d:	89 d8                	mov    %ebx,%eax
4000346f:	31 ff                	xor    %edi,%edi
40003471:	e9 3a ff ff ff       	jmp    400033b0 <__udivdi3+0x40>
40003476:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000347d:	00 
4000347e:	66 90                	xchg   %ax,%ax
40003480:	8d 43 ff             	lea    -0x1(%ebx),%eax
40003483:	31 ff                	xor    %edi,%edi
40003485:	e9 26 ff ff ff       	jmp    400033b0 <__udivdi3+0x40>
4000348a:	66 90                	xchg   %ax,%ax
4000348c:	66 90                	xchg   %ax,%ax
4000348e:	66 90                	xchg   %ax,%ax

40003490 <__umoddi3>:
40003490:	f3 0f 1e fb          	endbr32
40003494:	55                   	push   %ebp
40003495:	57                   	push   %edi
40003496:	56                   	push   %esi
40003497:	53                   	push   %ebx
40003498:	83 ec 1c             	sub    $0x1c,%esp
4000349b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
4000349f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
400034a3:	8b 74 24 30          	mov    0x30(%esp),%esi
400034a7:	8b 7c 24 38          	mov    0x38(%esp),%edi
400034ab:	89 da                	mov    %ebx,%edx
400034ad:	85 c0                	test   %eax,%eax
400034af:	75 17                	jne    400034c8 <__umoddi3+0x38>
400034b1:	39 fb                	cmp    %edi,%ebx
400034b3:	73 53                	jae    40003508 <__umoddi3+0x78>
400034b5:	89 f0                	mov    %esi,%eax
400034b7:	f7 f7                	div    %edi
400034b9:	89 d0                	mov    %edx,%eax
400034bb:	31 d2                	xor    %edx,%edx
400034bd:	83 c4 1c             	add    $0x1c,%esp
400034c0:	5b                   	pop    %ebx
400034c1:	5e                   	pop    %esi
400034c2:	5f                   	pop    %edi
400034c3:	5d                   	pop    %ebp
400034c4:	c3                   	ret
400034c5:	8d 76 00             	lea    0x0(%esi),%esi
400034c8:	89 f1                	mov    %esi,%ecx
400034ca:	39 c3                	cmp    %eax,%ebx
400034cc:	73 12                	jae    400034e0 <__umoddi3+0x50>
400034ce:	89 f0                	mov    %esi,%eax
400034d0:	83 c4 1c             	add    $0x1c,%esp
400034d3:	5b                   	pop    %ebx
400034d4:	5e                   	pop    %esi
400034d5:	5f                   	pop    %edi
400034d6:	5d                   	pop    %ebp
400034d7:	c3                   	ret
400034d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400034df:	00 
400034e0:	0f bd e8             	bsr    %eax,%ebp
400034e3:	83 f5 1f             	xor    $0x1f,%ebp
400034e6:	75 48                	jne    40003530 <__umoddi3+0xa0>
400034e8:	39 d8                	cmp    %ebx,%eax
400034ea:	0f 82 d0 00 00 00    	jb     400035c0 <__umoddi3+0x130>
400034f0:	39 fe                	cmp    %edi,%esi
400034f2:	0f 83 c8 00 00 00    	jae    400035c0 <__umoddi3+0x130>
400034f8:	89 c8                	mov    %ecx,%eax
400034fa:	83 c4 1c             	add    $0x1c,%esp
400034fd:	5b                   	pop    %ebx
400034fe:	5e                   	pop    %esi
400034ff:	5f                   	pop    %edi
40003500:	5d                   	pop    %ebp
40003501:	c3                   	ret
40003502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40003508:	89 f9                	mov    %edi,%ecx
4000350a:	85 ff                	test   %edi,%edi
4000350c:	75 0b                	jne    40003519 <__umoddi3+0x89>
4000350e:	b8 01 00 00 00       	mov    $0x1,%eax
40003513:	31 d2                	xor    %edx,%edx
40003515:	f7 f7                	div    %edi
40003517:	89 c1                	mov    %eax,%ecx
40003519:	89 d8                	mov    %ebx,%eax
4000351b:	31 d2                	xor    %edx,%edx
4000351d:	f7 f1                	div    %ecx
4000351f:	89 f0                	mov    %esi,%eax
40003521:	f7 f1                	div    %ecx
40003523:	89 d0                	mov    %edx,%eax
40003525:	31 d2                	xor    %edx,%edx
40003527:	eb 94                	jmp    400034bd <__umoddi3+0x2d>
40003529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40003530:	89 e9                	mov    %ebp,%ecx
40003532:	ba 20 00 00 00       	mov    $0x20,%edx
40003537:	29 ea                	sub    %ebp,%edx
40003539:	d3 e0                	shl    %cl,%eax
4000353b:	89 44 24 08          	mov    %eax,0x8(%esp)
4000353f:	89 d1                	mov    %edx,%ecx
40003541:	89 f8                	mov    %edi,%eax
40003543:	d3 e8                	shr    %cl,%eax
40003545:	89 54 24 04          	mov    %edx,0x4(%esp)
40003549:	8b 54 24 04          	mov    0x4(%esp),%edx
4000354d:	89 c1                	mov    %eax,%ecx
4000354f:	8b 44 24 08          	mov    0x8(%esp),%eax
40003553:	09 c1                	or     %eax,%ecx
40003555:	89 d8                	mov    %ebx,%eax
40003557:	89 4c 24 08          	mov    %ecx,0x8(%esp)
4000355b:	89 e9                	mov    %ebp,%ecx
4000355d:	d3 e7                	shl    %cl,%edi
4000355f:	89 d1                	mov    %edx,%ecx
40003561:	d3 e8                	shr    %cl,%eax
40003563:	89 e9                	mov    %ebp,%ecx
40003565:	89 7c 24 0c          	mov    %edi,0xc(%esp)
40003569:	d3 e3                	shl    %cl,%ebx
4000356b:	89 c7                	mov    %eax,%edi
4000356d:	89 d1                	mov    %edx,%ecx
4000356f:	89 f0                	mov    %esi,%eax
40003571:	d3 e8                	shr    %cl,%eax
40003573:	89 fa                	mov    %edi,%edx
40003575:	89 e9                	mov    %ebp,%ecx
40003577:	09 d8                	or     %ebx,%eax
40003579:	d3 e6                	shl    %cl,%esi
4000357b:	f7 74 24 08          	divl   0x8(%esp)
4000357f:	89 d3                	mov    %edx,%ebx
40003581:	f7 64 24 0c          	mull   0xc(%esp)
40003585:	89 c7                	mov    %eax,%edi
40003587:	89 d1                	mov    %edx,%ecx
40003589:	39 d3                	cmp    %edx,%ebx
4000358b:	72 06                	jb     40003593 <__umoddi3+0x103>
4000358d:	75 10                	jne    4000359f <__umoddi3+0x10f>
4000358f:	39 c6                	cmp    %eax,%esi
40003591:	73 0c                	jae    4000359f <__umoddi3+0x10f>
40003593:	2b 44 24 0c          	sub    0xc(%esp),%eax
40003597:	1b 54 24 08          	sbb    0x8(%esp),%edx
4000359b:	89 d1                	mov    %edx,%ecx
4000359d:	89 c7                	mov    %eax,%edi
4000359f:	89 f2                	mov    %esi,%edx
400035a1:	29 fa                	sub    %edi,%edx
400035a3:	19 cb                	sbb    %ecx,%ebx
400035a5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
400035aa:	89 d8                	mov    %ebx,%eax
400035ac:	d3 e0                	shl    %cl,%eax
400035ae:	89 e9                	mov    %ebp,%ecx
400035b0:	d3 ea                	shr    %cl,%edx
400035b2:	d3 eb                	shr    %cl,%ebx
400035b4:	09 d0                	or     %edx,%eax
400035b6:	89 da                	mov    %ebx,%edx
400035b8:	83 c4 1c             	add    $0x1c,%esp
400035bb:	5b                   	pop    %ebx
400035bc:	5e                   	pop    %esi
400035bd:	5f                   	pop    %edi
400035be:	5d                   	pop    %ebp
400035bf:	c3                   	ret
400035c0:	89 da                	mov    %ebx,%edx
400035c2:	89 f1                	mov    %esi,%ecx
400035c4:	29 f9                	sub    %edi,%ecx
400035c6:	19 c2                	sbb    %eax,%edx
400035c8:	89 c8                	mov    %ecx,%eax
400035ca:	e9 2b ff ff ff       	jmp    400034fa <__umoddi3+0x6a>
