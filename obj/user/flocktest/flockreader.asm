
obj/user/flocktest/flockreader:     file format elf32-i386


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
4000000f:	e8 05 11 00 00       	call   40001119 <__x86.get_pc_thunk.si>
40000014:	81 c6 e0 3f 00 00    	add    $0x3fe0,%esi
4000001a:	53                   	push   %ebx
4000001b:	51                   	push   %ecx
4000001c:	83 ec 24             	sub    $0x24,%esp
    int fd, i;

    printf("=====starting flockreader=====\n\n");
4000001f:	8d 86 c8 e1 ff ff    	lea    -0x1e38(%esi),%eax
40000025:	89 f3                	mov    %esi,%ebx

static gcc_inline int sys_open(char *path, int omode)
{
    int errno;
    int fd;
    int len = strlen(path) + 1;
40000027:	8d be 48 e0 ff ff    	lea    -0x1fb8(%esi),%edi
4000002d:	50                   	push   %eax
4000002e:	e8 bd 03 00 00       	call   400003f0 <printf>
40000033:	89 3c 24             	mov    %edi,(%esp)
40000036:	e8 15 0c 00 00       	call   40000c50 <strlen>

    asm volatile ("int %2"
4000003b:	31 c9                	xor    %ecx,%ecx
4000003d:	89 fb                	mov    %edi,%ebx
    int len = strlen(path) + 1;
4000003f:	8d 50 01             	lea    0x1(%eax),%edx
    asm volatile ("int %2"
40000042:	b8 04 00 00 00       	mov    $0x4,%eax
40000047:	cd 30                	int    $0x30
40000049:	89 5d dc             	mov    %ebx,-0x24(%ebp)

    /* open the file with read only permissions */
    fd = open("flockfile", O_RDONLY);

    if (fd < 0) {
4000004c:	83 c4 10             	add    $0x10,%esp
4000004f:	85 db                	test   %ebx,%ebx
40000051:	0f 88 13 01 00 00    	js     4000016a <main+0x16a>
40000057:	85 c0                	test   %eax,%eax
40000059:	0f 85 0b 01 00 00    	jne    4000016a <main+0x16a>

static gcc_inline int sys_flock(int fd, int op)
{
    int errno, ret;

    asm volatile ("int %2"
4000005f:	8b 5d dc             	mov    -0x24(%ebp),%ebx
40000062:	b8 0d 00 00 00       	mov    $0xd,%eax
40000067:	b9 01 00 00 00       	mov    $0x1,%ecx
4000006c:	cd 30                	int    $0x30
                    "a" (SYS_flock),
                    "b" (fd),
                    "c" (op)
                  : "cc", "memory");

    return errno ? -1 : 0;; // errno ? -1 : 0; 
4000006e:	85 c0                	test   %eax,%eax
40000070:	0f 85 0a 01 00 00    	jne    40000180 <main+0x180>
    asm volatile ("int %2"
40000076:	8d be 0c 00 00 00    	lea    0xc(%esi),%edi
4000007c:	8b 5d dc             	mov    -0x24(%ebp),%ebx
4000007f:	b8 06 00 00 00       	mov    $0x6,%eax
40000084:	ba 64 00 00 00       	mov    $0x64,%edx
40000089:	89 f9                	mov    %edi,%ecx
4000008b:	cd 30                	int    $0x30
        exit();
    }

    /* read the first 100 characters from the file */
    i = read(fd, buf, 100);
    if (i != 100) {
4000008d:	83 fb 64             	cmp    $0x64,%ebx
40000090:	0f 85 9b 00 00 00    	jne    40000131 <main+0x131>
40000096:	85 c0                	test   %eax,%eax
40000098:	0f 85 93 00 00 00    	jne    40000131 <main+0x131>
        close(fd);
        exit();
    }

    /* print to stdout */
    printf("Read from flockfile: ");
4000009e:	83 ec 0c             	sub    $0xc,%esp
400000a1:	8d 86 52 e0 ff ff    	lea    -0x1fae(%esi),%eax
400000a7:	89 f3                	mov    %esi,%ebx
400000a9:	50                   	push   %eax
400000aa:	e8 41 03 00 00       	call   400003f0 <printf>
    for (int k = 0; k < 100; k++) {
400000af:	8d 47 64             	lea    0x64(%edi),%eax
400000b2:	83 c4 10             	add    $0x10,%esp
400000b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
400000b8:	8d 86 68 e0 ff ff    	lea    -0x1f98(%esi),%eax
400000be:	89 45 e0             	mov    %eax,-0x20(%ebp)
400000c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf("%c", buf[k]);
400000c8:	0f be 07             	movsbl (%edi),%eax
400000cb:	83 ec 08             	sub    $0x8,%esp
400000ce:	89 f3                	mov    %esi,%ebx
    for (int k = 0; k < 100; k++) {
400000d0:	83 c7 01             	add    $0x1,%edi
        printf("%c", buf[k]);
400000d3:	50                   	push   %eax
400000d4:	ff 75 e0             	push   -0x20(%ebp)
400000d7:	e8 14 03 00 00       	call   400003f0 <printf>
    for (int k = 0; k < 100; k++) {
400000dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
400000df:	83 c4 10             	add    $0x10,%esp
400000e2:	39 c7                	cmp    %eax,%edi
400000e4:	75 e2                	jne    400000c8 <main+0xc8>
    }
    printf("\n");
400000e6:	83 ec 0c             	sub    $0xc,%esp
400000e9:	8d 86 6b e0 ff ff    	lea    -0x1f95(%esi),%eax
400000ef:	50                   	push   %eax
400000f0:	e8 fb 02 00 00       	call   400003f0 <printf>
    asm volatile ("int %2"
400000f5:	8b 5d dc             	mov    -0x24(%ebp),%ebx
400000f8:	b8 0d 00 00 00       	mov    $0xd,%eax
400000fd:	b9 04 00 00 00       	mov    $0x4,%ecx
40000102:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40000104:	83 c4 10             	add    $0x10,%esp
40000107:	85 c0                	test   %eax,%eax
40000109:	0f 85 91 00 00 00    	jne    400001a0 <main+0x1a0>
    asm volatile ("int %2"
4000010f:	8b 5d dc             	mov    -0x24(%ebp),%ebx
40000112:	b8 05 00 00 00       	mov    $0x5,%eax
40000117:	cd 30                	int    $0x30
        exit();
    }

    close(fd);

    printf("=====finished flockreader=====\n\n");
40000119:	83 ec 0c             	sub    $0xc,%esp
4000011c:	8d 86 98 e2 ff ff    	lea    -0x1d68(%esi),%eax
40000122:	89 f3                	mov    %esi,%ebx
40000124:	50                   	push   %eax
40000125:	e8 c6 02 00 00       	call   400003f0 <printf>

    return 0;
4000012a:	31 c0                	xor    %eax,%eax
4000012c:	83 c4 10             	add    $0x10,%esp
4000012f:	eb 2d                	jmp    4000015e <main+0x15e>
        printf("ERROR in flockreader: did not read 100 characters from flockfile!\n");
40000131:	83 ec 0c             	sub    $0xc,%esp
40000134:	8d 86 54 e2 ff ff    	lea    -0x1dac(%esi),%eax
4000013a:	89 f3                	mov    %esi,%ebx
4000013c:	50                   	push   %eax
4000013d:	e8 ae 02 00 00       	call   400003f0 <printf>
    asm volatile ("int %2"
40000142:	b8 0d 00 00 00       	mov    $0xd,%eax
40000147:	b9 04 00 00 00       	mov    $0x4,%ecx
4000014c:	8b 5d dc             	mov    -0x24(%ebp),%ebx
4000014f:	cd 30                	int    $0x30
    asm volatile ("int %2"
40000151:	b8 05 00 00 00       	mov    $0x5,%eax
40000156:	8b 5d dc             	mov    -0x24(%ebp),%ebx
40000159:	cd 30                	int    $0x30
        exit();
4000015b:	83 c4 10             	add    $0x10,%esp
4000015e:	8d 65 f0             	lea    -0x10(%ebp),%esp
40000161:	59                   	pop    %ecx
40000162:	5b                   	pop    %ebx
40000163:	5e                   	pop    %esi
40000164:	5f                   	pop    %edi
40000165:	5d                   	pop    %ebp
40000166:	8d 61 fc             	lea    -0x4(%ecx),%esp
40000169:	c3                   	ret
        printf("ERROR in flockreader: open flockfile failed!\n");
4000016a:	83 ec 0c             	sub    $0xc,%esp
4000016d:	8d 86 ec e1 ff ff    	lea    -0x1e14(%esi),%eax
40000173:	89 f3                	mov    %esi,%ebx
40000175:	50                   	push   %eax
40000176:	e8 75 02 00 00       	call   400003f0 <printf>
        exit();
4000017b:	83 c4 10             	add    $0x10,%esp
4000017e:	eb de                	jmp    4000015e <main+0x15e>
        printf("ERROR in flockreader: acquired shared flock failed!\n");
40000180:	83 ec 0c             	sub    $0xc,%esp
40000183:	8d 86 1c e2 ff ff    	lea    -0x1de4(%esi),%eax
        printf("ERROR in flockreader: release shared flock failed!\n");
40000189:	50                   	push   %eax
4000018a:	89 f3                	mov    %esi,%ebx
4000018c:	e8 5f 02 00 00       	call   400003f0 <printf>
40000191:	b8 05 00 00 00       	mov    $0x5,%eax
40000196:	8b 5d dc             	mov    -0x24(%ebp),%ebx
40000199:	cd 30                	int    $0x30
        exit();
4000019b:	83 c4 10             	add    $0x10,%esp
4000019e:	eb be                	jmp    4000015e <main+0x15e>
        printf("ERROR in flockreader: release shared flock failed!\n");
400001a0:	83 ec 0c             	sub    $0xc,%esp
400001a3:	8d 86 bc e2 ff ff    	lea    -0x1d44(%esi),%eax
400001a9:	eb de                	jmp    40000189 <main+0x189>

400001ab <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
400001ab:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
400001b1:	75 04                	jne    400001b7 <args_exist>

400001b3 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
400001b3:	6a 00                	push   $0x0
	pushl	$0
400001b5:	6a 00                	push   $0x0

400001b7 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
400001b7:	e8 44 fe ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
400001bc:	50                   	push   %eax

400001bd <spin>:
spin:
	jmp	spin
400001bd:	eb fe                	jmp    400001bd <spin>
400001bf:	90                   	nop

400001c0 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
400001c0:	53                   	push   %ebx
400001c1:	e8 c1 00 00 00       	call   40000287 <__x86.get_pc_thunk.bx>
400001c6:	81 c3 2e 3e 00 00    	add    $0x3e2e,%ebx
400001cc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
400001cf:	ff 74 24 18          	push   0x18(%esp)
400001d3:	ff 74 24 18          	push   0x18(%esp)
400001d7:	8d 83 0c e0 ff ff    	lea    -0x1ff4(%ebx),%eax
400001dd:	50                   	push   %eax
400001de:	e8 0d 02 00 00       	call   400003f0 <printf>
    vcprintf(fmt, ap);
400001e3:	58                   	pop    %eax
400001e4:	5a                   	pop    %edx
400001e5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001e9:	50                   	push   %eax
400001ea:	ff 74 24 24          	push   0x24(%esp)
400001ee:	e8 9d 01 00 00       	call   40000390 <vcprintf>
    va_end(ap);
}
400001f3:	83 c4 18             	add    $0x18,%esp
400001f6:	5b                   	pop    %ebx
400001f7:	c3                   	ret
400001f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001ff:	00 

40000200 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000200:	53                   	push   %ebx
40000201:	e8 81 00 00 00       	call   40000287 <__x86.get_pc_thunk.bx>
40000206:	81 c3 ee 3d 00 00    	add    $0x3dee,%ebx
4000020c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
4000020f:	ff 74 24 18          	push   0x18(%esp)
40000213:	ff 74 24 18          	push   0x18(%esp)
40000217:	8d 83 18 e0 ff ff    	lea    -0x1fe8(%ebx),%eax
4000021d:	50                   	push   %eax
4000021e:	e8 cd 01 00 00       	call   400003f0 <printf>
    vcprintf(fmt, ap);
40000223:	58                   	pop    %eax
40000224:	5a                   	pop    %edx
40000225:	8d 44 24 24          	lea    0x24(%esp),%eax
40000229:	50                   	push   %eax
4000022a:	ff 74 24 24          	push   0x24(%esp)
4000022e:	e8 5d 01 00 00       	call   40000390 <vcprintf>
    va_end(ap);
}
40000233:	83 c4 18             	add    $0x18,%esp
40000236:	5b                   	pop    %ebx
40000237:	c3                   	ret
40000238:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000023f:	00 

40000240 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000240:	53                   	push   %ebx
40000241:	e8 41 00 00 00       	call   40000287 <__x86.get_pc_thunk.bx>
40000246:	81 c3 ae 3d 00 00    	add    $0x3dae,%ebx
4000024c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000024f:	ff 74 24 18          	push   0x18(%esp)
40000253:	ff 74 24 18          	push   0x18(%esp)
40000257:	8d 83 24 e0 ff ff    	lea    -0x1fdc(%ebx),%eax
4000025d:	50                   	push   %eax
4000025e:	e8 8d 01 00 00       	call   400003f0 <printf>
    vcprintf(fmt, ap);
40000263:	58                   	pop    %eax
40000264:	5a                   	pop    %edx
40000265:	8d 44 24 24          	lea    0x24(%esp),%eax
40000269:	50                   	push   %eax
4000026a:	ff 74 24 24          	push   0x24(%esp)
4000026e:	e8 1d 01 00 00       	call   40000390 <vcprintf>
40000273:	83 c4 10             	add    $0x10,%esp
40000276:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000027d:	00 
4000027e:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
40000280:	e8 3b 09 00 00       	call   40000bc0 <yield>
    while (1)
40000285:	eb f9                	jmp    40000280 <panic+0x40>

40000287 <__x86.get_pc_thunk.bx>:
40000287:	8b 1c 24             	mov    (%esp),%ebx
4000028a:	c3                   	ret
4000028b:	66 90                	xchg   %ax,%ax
4000028d:	66 90                	xchg   %ax,%ax
4000028f:	90                   	nop

40000290 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
40000290:	55                   	push   %ebp
40000291:	57                   	push   %edi
40000292:	56                   	push   %esi
40000293:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
40000294:	8b 44 24 14          	mov    0x14(%esp),%eax
40000298:	0f b6 00             	movzbl (%eax),%eax
4000029b:	3c 2b                	cmp    $0x2b,%al
4000029d:	0f 84 8d 00 00 00    	je     40000330 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
400002a3:	3c 2d                	cmp    $0x2d,%al
400002a5:	74 59                	je     40000300 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002a7:	8d 50 d0             	lea    -0x30(%eax),%edx
400002aa:	80 fa 09             	cmp    $0x9,%dl
400002ad:	77 71                	ja     40000320 <atoi+0x90>
    int negative = 0;
400002af:	31 ff                	xor    %edi,%edi
    int loc = 0;
400002b1:	31 f6                	xor    %esi,%esi
        loc++;
400002b3:	89 f2                	mov    %esi,%edx
    int acc = 0;
400002b5:	31 c9                	xor    %ecx,%ecx
400002b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400002be:	00 
400002bf:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
400002c0:	83 e8 30             	sub    $0x30,%eax
400002c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
400002c6:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
400002c9:	0f be c0             	movsbl %al,%eax
400002cc:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002cf:	8b 44 24 14          	mov    0x14(%esp),%eax
400002d3:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
400002d7:	8d 68 d0             	lea    -0x30(%eax),%ebp
400002da:	89 eb                	mov    %ebp,%ebx
400002dc:	80 fb 09             	cmp    $0x9,%bl
400002df:	76 df                	jbe    400002c0 <atoi+0x30>
    }
    if (numstart == loc) {
400002e1:	39 f2                	cmp    %esi,%edx
400002e3:	74 3b                	je     40000320 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
400002e5:	89 c8                	mov    %ecx,%eax
400002e7:	f7 d8                	neg    %eax
400002e9:	85 ff                	test   %edi,%edi
400002eb:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
400002ee:	8b 44 24 18          	mov    0x18(%esp),%eax
400002f2:	89 08                	mov    %ecx,(%eax)
    return loc;
}
400002f4:	89 d0                	mov    %edx,%eax
400002f6:	5b                   	pop    %ebx
400002f7:	5e                   	pop    %esi
400002f8:	5f                   	pop    %edi
400002f9:	5d                   	pop    %ebp
400002fa:	c3                   	ret
400002fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000300:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
40000304:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000309:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000030e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000312:	8d 50 d0             	lea    -0x30(%eax),%edx
40000315:	80 fa 09             	cmp    $0x9,%dl
40000318:	76 99                	jbe    400002b3 <atoi+0x23>
4000031a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000320:	31 d2                	xor    %edx,%edx
}
40000322:	5b                   	pop    %ebx
40000323:	89 d0                	mov    %edx,%eax
40000325:	5e                   	pop    %esi
40000326:	5f                   	pop    %edi
40000327:	5d                   	pop    %ebp
40000328:	c3                   	ret
40000329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000330:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000334:	31 ff                	xor    %edi,%edi
        loc++;
40000336:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000033b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000033f:	8d 50 d0             	lea    -0x30(%eax),%edx
40000342:	80 fa 09             	cmp    $0x9,%dl
40000345:	0f 86 68 ff ff ff    	jbe    400002b3 <atoi+0x23>
        return 0;
4000034b:	31 d2                	xor    %edx,%edx
4000034d:	eb d3                	jmp    40000322 <atoi+0x92>
4000034f:	90                   	nop

40000350 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
40000350:	53                   	push   %ebx
40000351:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000355:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000035a:	8b 02                	mov    (%edx),%eax
4000035c:	8d 48 01             	lea    0x1(%eax),%ecx
4000035f:	89 0a                	mov    %ecx,(%edx)
40000361:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000365:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
4000036b:	75 14                	jne    40000381 <putch+0x31>
        b->buf[b->idx] = 0;
4000036d:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
40000374:	8d 5a 08             	lea    0x8(%edx),%ebx
    asm volatile ("int %0"
40000377:	31 c0                	xor    %eax,%eax
40000379:	cd 30                	int    $0x30
        b->idx = 0;
4000037b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
40000381:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
40000385:	5b                   	pop    %ebx
40000386:	c3                   	ret
40000387:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000038e:	00 
4000038f:	90                   	nop

40000390 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
40000390:	53                   	push   %ebx
40000391:	e8 f1 fe ff ff       	call   40000287 <__x86.get_pc_thunk.bx>
40000396:	81 c3 5e 3c 00 00    	add    $0x3c5e,%ebx
4000039c:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
400003a2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
400003a9:	00 
    b.cnt = 0;
400003aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400003b1:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
400003b2:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400003b9:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400003c0:	8d 44 24 10          	lea    0x10(%esp),%eax
400003c4:	50                   	push   %eax
400003c5:	8d 83 5c c3 ff ff    	lea    -0x3ca4(%ebx),%eax
400003cb:	50                   	push   %eax
400003cc:	e8 3f 01 00 00       	call   40000510 <vprintfmt>

    b.buf[b.idx] = 0;
400003d1:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400003d5:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400003d9:	31 c0                	xor    %eax,%eax
400003db:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400003e0:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
400003e2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400003e6:	81 c4 28 02 00 00    	add    $0x228,%esp
400003ec:	5b                   	pop    %ebx
400003ed:	c3                   	ret
400003ee:	66 90                	xchg   %ax,%ax

400003f0 <printf>:

int printf(const char *fmt, ...)
{
400003f0:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
400003f3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400003f7:	50                   	push   %eax
400003f8:	ff 74 24 1c          	push   0x1c(%esp)
400003fc:	e8 8f ff ff ff       	call   40000390 <vcprintf>
    va_end(ap);

    return cnt;
}
40000401:	83 c4 1c             	add    $0x1c,%esp
40000404:	c3                   	ret
40000405:	66 90                	xchg   %ax,%ax
40000407:	66 90                	xchg   %ax,%ax
40000409:	66 90                	xchg   %ax,%ax
4000040b:	66 90                	xchg   %ax,%ax
4000040d:	66 90                	xchg   %ax,%ax
4000040f:	90                   	nop

40000410 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000410:	e8 86 07 00 00       	call   40000b9b <__x86.get_pc_thunk.cx>
40000415:	81 c1 df 3b 00 00    	add    $0x3bdf,%ecx
{
4000041b:	55                   	push   %ebp
4000041c:	57                   	push   %edi
4000041d:	89 d7                	mov    %edx,%edi
4000041f:	56                   	push   %esi
40000420:	89 c6                	mov    %eax,%esi
40000422:	53                   	push   %ebx
40000423:	83 ec 2c             	sub    $0x2c,%esp
40000426:	8b 44 24 40          	mov    0x40(%esp),%eax
4000042a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000042e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000432:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000439:	00 
{
4000043a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000043e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000442:	8b 44 24 48          	mov    0x48(%esp),%eax
40000446:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000044a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000044e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000452:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000456:	89 44 24 10          	mov    %eax,0x10(%esp)
4000045a:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
4000045e:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
40000461:	73 55                	jae    400004b8 <printnum+0xa8>
        while (--width > 0)
40000463:	83 fa 01             	cmp    $0x1,%edx
40000466:	7e 17                	jle    4000047f <printnum+0x6f>
40000468:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000046f:	00 
            putch(padc, putdat);
40000470:	83 ec 08             	sub    $0x8,%esp
40000473:	57                   	push   %edi
40000474:	55                   	push   %ebp
40000475:	ff d6                	call   *%esi
        while (--width > 0)
40000477:	83 c4 10             	add    $0x10,%esp
4000047a:	83 eb 01             	sub    $0x1,%ebx
4000047d:	75 f1                	jne    40000470 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
4000047f:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000483:	ff 74 24 14          	push   0x14(%esp)
40000487:	ff 74 24 14          	push   0x14(%esp)
4000048b:	ff 74 24 14          	push   0x14(%esp)
4000048f:	ff 74 24 14          	push   0x14(%esp)
40000493:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
40000497:	e8 a4 0d 00 00       	call   40001240 <__umoddi3>
4000049c:	0f be 84 03 30 e0 ff 	movsbl -0x1fd0(%ebx,%eax,1),%eax
400004a3:	ff 
400004a4:	89 44 24 50          	mov    %eax,0x50(%esp)
}
400004a8:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
400004ab:	89 f0                	mov    %esi,%eax
}
400004ad:	5b                   	pop    %ebx
400004ae:	5e                   	pop    %esi
400004af:	5f                   	pop    %edi
400004b0:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
400004b1:	ff e0                	jmp    *%eax
400004b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
400004b8:	83 ec 0c             	sub    $0xc,%esp
400004bb:	55                   	push   %ebp
400004bc:	53                   	push   %ebx
400004bd:	50                   	push   %eax
400004be:	83 ec 08             	sub    $0x8,%esp
400004c1:	ff 74 24 34          	push   0x34(%esp)
400004c5:	ff 74 24 34          	push   0x34(%esp)
400004c9:	ff 74 24 34          	push   0x34(%esp)
400004cd:	ff 74 24 34          	push   0x34(%esp)
400004d1:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400004d5:	e8 46 0c 00 00       	call   40001120 <__udivdi3>
400004da:	83 c4 18             	add    $0x18,%esp
400004dd:	52                   	push   %edx
400004de:	89 fa                	mov    %edi,%edx
400004e0:	50                   	push   %eax
400004e1:	89 f0                	mov    %esi,%eax
400004e3:	e8 28 ff ff ff       	call   40000410 <printnum>
400004e8:	83 c4 20             	add    $0x20,%esp
400004eb:	eb 92                	jmp    4000047f <printnum+0x6f>
400004ed:	8d 76 00             	lea    0x0(%esi),%esi

400004f0 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
400004f0:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
400004f4:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
400004f8:	8b 10                	mov    (%eax),%edx
400004fa:	3b 50 04             	cmp    0x4(%eax),%edx
400004fd:	73 0b                	jae    4000050a <sprintputch+0x1a>
        *b->buf++ = ch;
400004ff:	8d 4a 01             	lea    0x1(%edx),%ecx
40000502:	89 08                	mov    %ecx,(%eax)
40000504:	8b 44 24 04          	mov    0x4(%esp),%eax
40000508:	88 02                	mov    %al,(%edx)
}
4000050a:	c3                   	ret
4000050b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000510 <vprintfmt>:
{
40000510:	e8 7e 06 00 00       	call   40000b93 <__x86.get_pc_thunk.ax>
40000515:	05 df 3a 00 00       	add    $0x3adf,%eax
4000051a:	55                   	push   %ebp
4000051b:	57                   	push   %edi
4000051c:	56                   	push   %esi
4000051d:	53                   	push   %ebx
4000051e:	83 ec 2c             	sub    $0x2c,%esp
40000521:	8b 74 24 40          	mov    0x40(%esp),%esi
40000525:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000529:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000052d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000531:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000535:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000538:	83 f8 25             	cmp    $0x25,%eax
4000053b:	75 19                	jne    40000556 <vprintfmt+0x46>
4000053d:	eb 29                	jmp    40000568 <vprintfmt+0x58>
4000053f:	90                   	nop
            putch(ch, putdat);
40000540:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000543:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000546:	57                   	push   %edi
40000547:	50                   	push   %eax
40000548:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000054a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000054e:	83 c4 10             	add    $0x10,%esp
40000551:	83 f8 25             	cmp    $0x25,%eax
40000554:	74 12                	je     40000568 <vprintfmt+0x58>
            if (ch == '\0')
40000556:	85 c0                	test   %eax,%eax
40000558:	75 e6                	jne    40000540 <vprintfmt+0x30>
}
4000055a:	83 c4 2c             	add    $0x2c,%esp
4000055d:	5b                   	pop    %ebx
4000055e:	5e                   	pop    %esi
4000055f:	5f                   	pop    %edi
40000560:	5d                   	pop    %ebp
40000561:	c3                   	ret
40000562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
40000568:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
4000056d:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
40000572:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
40000579:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000580:	ff 
        lflag = 0;
40000581:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
40000588:	00 
40000589:	89 54 24 14          	mov    %edx,0x14(%esp)
4000058d:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000591:	0f b6 0b             	movzbl (%ebx),%ecx
40000594:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000597:	8d 41 dd             	lea    -0x23(%ecx),%eax
4000059a:	3c 55                	cmp    $0x55,%al
4000059c:	77 12                	ja     400005b0 <.L21>
4000059e:	8b 54 24 0c          	mov    0xc(%esp),%edx
400005a2:	0f b6 c0             	movzbl %al,%eax
400005a5:	8b b4 82 70 e0 ff ff 	mov    -0x1f90(%edx,%eax,4),%esi
400005ac:	01 d6                	add    %edx,%esi
400005ae:	ff e6                	jmp    *%esi

400005b0 <.L21>:
            putch('%', putdat);
400005b0:	8b 74 24 40          	mov    0x40(%esp),%esi
400005b4:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
400005b7:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
400005b9:	57                   	push   %edi
400005ba:	6a 25                	push   $0x25
400005bc:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
400005be:	83 c4 10             	add    $0x10,%esp
400005c1:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
400005c5:	0f 84 66 ff ff ff    	je     40000531 <vprintfmt+0x21>
400005cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400005d0:	83 ed 01             	sub    $0x1,%ebp
400005d3:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400005d7:	75 f7                	jne    400005d0 <.L21+0x20>
400005d9:	e9 53 ff ff ff       	jmp    40000531 <vprintfmt+0x21>
400005de:	66 90                	xchg   %ax,%ax

400005e0 <.L31>:
                ch = *fmt;
400005e0:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
400005e4:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
400005e7:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
400005e9:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
400005ed:	8d 48 d0             	lea    -0x30(%eax),%ecx
400005f0:	83 f9 09             	cmp    $0x9,%ecx
400005f3:	77 28                	ja     4000061d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
400005f5:	8b 74 24 40          	mov    0x40(%esp),%esi
400005f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
40000600:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
40000603:	8d 14 92             	lea    (%edx,%edx,4),%edx
40000606:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
4000060a:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
4000060d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000610:	83 f9 09             	cmp    $0x9,%ecx
40000613:	76 eb                	jbe    40000600 <.L31+0x20>
40000615:	89 54 24 14          	mov    %edx,0x14(%esp)
40000619:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000061d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000621:	85 f6                	test   %esi,%esi
40000623:	0f 89 68 ff ff ff    	jns    40000591 <vprintfmt+0x81>
                width = precision, precision = -1;
40000629:	8b 44 24 14          	mov    0x14(%esp),%eax
4000062d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000634:	ff 
40000635:	89 44 24 08          	mov    %eax,0x8(%esp)
40000639:	e9 53 ff ff ff       	jmp    40000591 <vprintfmt+0x81>

4000063e <.L35>:
            altflag = 1;
4000063e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000645:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000647:	e9 45 ff ff ff       	jmp    40000591 <vprintfmt+0x81>

4000064c <.L34>:
            putch(ch, putdat);
4000064c:	8b 74 24 40          	mov    0x40(%esp),%esi
40000650:	83 ec 08             	sub    $0x8,%esp
40000653:	57                   	push   %edi
40000654:	6a 25                	push   $0x25
40000656:	ff d6                	call   *%esi
            break;
40000658:	83 c4 10             	add    $0x10,%esp
4000065b:	e9 d1 fe ff ff       	jmp    40000531 <vprintfmt+0x21>

40000660 <.L33>:
            precision = va_arg(ap, int);
40000660:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
40000664:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
40000666:	8b 00                	mov    (%eax),%eax
40000668:	89 44 24 14          	mov    %eax,0x14(%esp)
4000066c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000670:	83 c0 04             	add    $0x4,%eax
40000673:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
40000677:	eb a4                	jmp    4000061d <.L31+0x3d>

40000679 <.L32>:
            if (width < 0)
40000679:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000067d:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
4000067f:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000681:	85 c9                	test   %ecx,%ecx
40000683:	0f 49 c1             	cmovns %ecx,%eax
40000686:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
4000068a:	e9 02 ff ff ff       	jmp    40000591 <vprintfmt+0x81>

4000068f <.L30>:
            putch(va_arg(ap, int), putdat);
4000068f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000693:	8b 74 24 40          	mov    0x40(%esp),%esi
40000697:	83 ec 08             	sub    $0x8,%esp
4000069a:	57                   	push   %edi
4000069b:	8d 58 04             	lea    0x4(%eax),%ebx
4000069e:	8b 44 24 58          	mov    0x58(%esp),%eax
400006a2:	ff 30                	push   (%eax)
400006a4:	ff d6                	call   *%esi
400006a6:	89 5c 24 5c          	mov    %ebx,0x5c(%esp)
            break;
400006aa:	83 c4 10             	add    $0x10,%esp
400006ad:	e9 7f fe ff ff       	jmp    40000531 <vprintfmt+0x21>

400006b2 <.L24>:
    if (lflag >= 2)
400006b2:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006b7:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400006bb:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006bf:	0f 8f d8 01 00 00    	jg     4000089d <.L25+0xe0>
        return va_arg(*ap, unsigned long);
400006c5:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400006c9:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400006cc:	31 db                	xor    %ebx,%ebx
400006ce:	ba 0a 00 00 00       	mov    $0xa,%edx
400006d3:	8b 09                	mov    (%ecx),%ecx
400006d5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400006d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
400006e0:	83 ec 0c             	sub    $0xc,%esp
400006e3:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
400006e8:	50                   	push   %eax
400006e9:	89 f0                	mov    %esi,%eax
400006eb:	ff 74 24 18          	push   0x18(%esp)
400006ef:	52                   	push   %edx
400006f0:	89 fa                	mov    %edi,%edx
400006f2:	53                   	push   %ebx
400006f3:	51                   	push   %ecx
400006f4:	e8 17 fd ff ff       	call   40000410 <printnum>
            break;
400006f9:	83 c4 20             	add    $0x20,%esp
400006fc:	e9 30 fe ff ff       	jmp    40000531 <vprintfmt+0x21>

40000701 <.L26>:
            putch('0', putdat);
40000701:	8b 74 24 40          	mov    0x40(%esp),%esi
40000705:	83 ec 08             	sub    $0x8,%esp
40000708:	57                   	push   %edi
40000709:	6a 30                	push   $0x30
4000070b:	ff d6                	call   *%esi
            putch('x', putdat);
4000070d:	59                   	pop    %ecx
4000070e:	5b                   	pop    %ebx
4000070f:	57                   	push   %edi
40000710:	6a 78                	push   $0x78
            num = (unsigned long long)
40000712:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000714:	ff d6                	call   *%esi
            num = (unsigned long long)
40000716:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000071a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000071f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000721:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000724:	83 c0 04             	add    $0x4,%eax
40000727:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000072b:	eb b3                	jmp    400006e0 <.L24+0x2e>

4000072d <.L22>:
    if (lflag >= 2)
4000072d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000732:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000736:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000073a:	0f 8f 6e 01 00 00    	jg     400008ae <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000740:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000744:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000747:	31 db                	xor    %ebx,%ebx
40000749:	ba 10 00 00 00       	mov    $0x10,%edx
4000074e:	8b 09                	mov    (%ecx),%ecx
40000750:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000754:	eb 8a                	jmp    400006e0 <.L24+0x2e>

40000756 <.L29>:
    if (lflag >= 2)
40000756:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
4000075b:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
4000075f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
40000763:	0f 8f 5b 01 00 00    	jg     400008c4 <.L25+0x107>
        return va_arg(*ap, long);
40000769:	8b 00                	mov    (%eax),%eax
4000076b:	89 c3                	mov    %eax,%ebx
4000076d:	89 c1                	mov    %eax,%ecx
4000076f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000773:	c1 fb 1f             	sar    $0x1f,%ebx
40000776:	83 c0 04             	add    $0x4,%eax
40000779:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
4000077d:	85 db                	test   %ebx,%ebx
4000077f:	0f 88 68 01 00 00    	js     400008ed <.L19+0xc>
        return va_arg(*ap, unsigned long long);
40000785:	ba 0a 00 00 00       	mov    $0xa,%edx
4000078a:	e9 51 ff ff ff       	jmp    400006e0 <.L24+0x2e>

4000078f <.L28>:
            lflag++;
4000078f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000794:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000796:	e9 f6 fd ff ff       	jmp    40000591 <vprintfmt+0x81>

4000079b <.L27>:
            putch('X', putdat);
4000079b:	8b 74 24 40          	mov    0x40(%esp),%esi
4000079f:	83 ec 08             	sub    $0x8,%esp
400007a2:	57                   	push   %edi
400007a3:	6a 58                	push   $0x58
400007a5:	ff d6                	call   *%esi
            putch('X', putdat);
400007a7:	58                   	pop    %eax
400007a8:	5a                   	pop    %edx
400007a9:	57                   	push   %edi
400007aa:	6a 58                	push   $0x58
400007ac:	ff d6                	call   *%esi
            putch('X', putdat);
400007ae:	59                   	pop    %ecx
400007af:	5b                   	pop    %ebx
400007b0:	57                   	push   %edi
400007b1:	6a 58                	push   $0x58
400007b3:	ff d6                	call   *%esi
            break;
400007b5:	83 c4 10             	add    $0x10,%esp
400007b8:	e9 74 fd ff ff       	jmp    40000531 <vprintfmt+0x21>

400007bd <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
400007bd:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
400007c1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
400007c5:	8b 54 24 14          	mov    0x14(%esp),%edx
400007c9:	8b 74 24 40          	mov    0x40(%esp),%esi
400007cd:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
400007d0:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
400007d5:	89 44 24 14          	mov    %eax,0x14(%esp)
400007d9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400007dd:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
400007df:	0f 95 c0             	setne  %al
400007e2:	85 c9                	test   %ecx,%ecx
400007e4:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
400007e7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
400007eb:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
400007ed:	85 db                	test   %ebx,%ebx
400007ef:	0f 84 21 01 00 00    	je     40000916 <.L19+0x35>
            if (width > 0 && padc != '-')
400007f5:	84 c0                	test   %al,%al
400007f7:	0f 85 48 01 00 00    	jne    40000945 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
400007fd:	89 d8                	mov    %ebx,%eax
400007ff:	8d 5b 01             	lea    0x1(%ebx),%ebx
40000802:	0f be 08             	movsbl (%eax),%ecx
40000805:	89 c8                	mov    %ecx,%eax
40000807:	85 c9                	test   %ecx,%ecx
40000809:	74 64                	je     4000086f <.L25+0xb2>
4000080b:	89 74 24 40          	mov    %esi,0x40(%esp)
4000080f:	89 d6                	mov    %edx,%esi
40000811:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000815:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000819:	eb 2a                	jmp    40000845 <.L25+0x88>
4000081b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000820:	83 e8 20             	sub    $0x20,%eax
40000823:	83 f8 5e             	cmp    $0x5e,%eax
40000826:	76 2d                	jbe    40000855 <.L25+0x98>
                    putch('?', putdat);
40000828:	83 ec 08             	sub    $0x8,%esp
4000082b:	57                   	push   %edi
4000082c:	6a 3f                	push   $0x3f
4000082e:	ff 54 24 50          	call   *0x50(%esp)
40000832:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000835:	0f be 03             	movsbl (%ebx),%eax
40000838:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000083b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000083e:	0f be c8             	movsbl %al,%ecx
40000841:	85 c9                	test   %ecx,%ecx
40000843:	74 1e                	je     40000863 <.L25+0xa6>
40000845:	85 f6                	test   %esi,%esi
40000847:	78 05                	js     4000084e <.L25+0x91>
                                         || --precision >= 0); width--)
40000849:	83 ee 01             	sub    $0x1,%esi
4000084c:	72 15                	jb     40000863 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000084e:	8b 14 24             	mov    (%esp),%edx
40000851:	85 d2                	test   %edx,%edx
40000853:	75 cb                	jne    40000820 <.L25+0x63>
                    putch(ch, putdat);
40000855:	83 ec 08             	sub    $0x8,%esp
40000858:	57                   	push   %edi
40000859:	51                   	push   %ecx
4000085a:	ff 54 24 50          	call   *0x50(%esp)
4000085e:	83 c4 10             	add    $0x10,%esp
40000861:	eb d2                	jmp    40000835 <.L25+0x78>
40000863:	89 6c 24 08          	mov    %ebp,0x8(%esp)
40000867:	8b 74 24 40          	mov    0x40(%esp),%esi
4000086b:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
4000086f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000873:	85 c0                	test   %eax,%eax
40000875:	7e 19                	jle    40000890 <.L25+0xd3>
40000877:	89 c3                	mov    %eax,%ebx
40000879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
40000880:	83 ec 08             	sub    $0x8,%esp
40000883:	57                   	push   %edi
40000884:	6a 20                	push   $0x20
40000886:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000888:	83 c4 10             	add    $0x10,%esp
4000088b:	83 eb 01             	sub    $0x1,%ebx
4000088e:	75 f0                	jne    40000880 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
40000890:	8b 44 24 14          	mov    0x14(%esp),%eax
40000894:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000898:	e9 94 fc ff ff       	jmp    40000531 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
4000089d:	8b 08                	mov    (%eax),%ecx
4000089f:	8b 58 04             	mov    0x4(%eax),%ebx
400008a2:	83 c0 08             	add    $0x8,%eax
400008a5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008a9:	e9 d7 fe ff ff       	jmp    40000785 <.L29+0x2f>
400008ae:	8b 08                	mov    (%eax),%ecx
400008b0:	8b 58 04             	mov    0x4(%eax),%ebx
400008b3:	83 c0 08             	add    $0x8,%eax
400008b6:	ba 10 00 00 00       	mov    $0x10,%edx
400008bb:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008bf:	e9 1c fe ff ff       	jmp    400006e0 <.L24+0x2e>
        return va_arg(*ap, long long);
400008c4:	8b 08                	mov    (%eax),%ecx
400008c6:	8b 58 04             	mov    0x4(%eax),%ebx
400008c9:	83 c0 08             	add    $0x8,%eax
400008cc:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008d0:	e9 a8 fe ff ff       	jmp    4000077d <.L29+0x27>

400008d5 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
400008d5:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400008da:	89 eb                	mov    %ebp,%ebx
400008dc:	e9 b0 fc ff ff       	jmp    40000591 <vprintfmt+0x81>

400008e1 <.L19>:
            padc = '-';
400008e1:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400008e6:	89 eb                	mov    %ebp,%ebx
400008e8:	e9 a4 fc ff ff       	jmp    40000591 <vprintfmt+0x81>
400008ed:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
400008f1:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
400008f4:	31 db                	xor    %ebx,%ebx
400008f6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
400008fa:	57                   	push   %edi
400008fb:	6a 2d                	push   $0x2d
400008fd:	ff d6                	call   *%esi
                num = -(long long) num;
400008ff:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000903:	ba 0a 00 00 00       	mov    $0xa,%edx
40000908:	f7 d9                	neg    %ecx
4000090a:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
4000090e:	83 c4 10             	add    $0x10,%esp
40000911:	e9 ca fd ff ff       	jmp    400006e0 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000916:	84 c0                	test   %al,%al
40000918:	0f 85 99 00 00 00    	jne    400009b7 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000091e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000922:	89 74 24 40          	mov    %esi,0x40(%esp)
40000926:	b9 28 00 00 00       	mov    $0x28,%ecx
4000092b:	89 d6                	mov    %edx,%esi
4000092d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000931:	b8 28 00 00 00       	mov    $0x28,%eax
40000936:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000093a:	8d 9b 42 e0 ff ff    	lea    -0x1fbe(%ebx),%ebx
40000940:	e9 00 ff ff ff       	jmp    40000845 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000945:	83 ec 08             	sub    $0x8,%esp
40000948:	52                   	push   %edx
40000949:	89 54 24 28          	mov    %edx,0x28(%esp)
4000094d:	ff 74 24 24          	push   0x24(%esp)
40000951:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000955:	e8 26 03 00 00       	call   40000c80 <strnlen>
4000095a:	29 44 24 18          	sub    %eax,0x18(%esp)
4000095e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000962:	83 c4 10             	add    $0x10,%esp
40000965:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000969:	85 c9                	test   %ecx,%ecx
4000096b:	0f 8e 99 00 00 00    	jle    40000a0a <.L19+0x129>
                    putch(padc, putdat);
40000971:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000976:	89 54 24 10          	mov    %edx,0x10(%esp)
4000097a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000097e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000982:	83 ec 08             	sub    $0x8,%esp
40000985:	57                   	push   %edi
40000986:	53                   	push   %ebx
40000987:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
40000989:	83 c4 10             	add    $0x10,%esp
4000098c:	83 ed 01             	sub    $0x1,%ebp
4000098f:	75 f1                	jne    40000982 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
40000991:	8b 44 24 18          	mov    0x18(%esp),%eax
40000995:	8b 54 24 10          	mov    0x10(%esp),%edx
40000999:	89 6c 24 08          	mov    %ebp,0x8(%esp)
4000099d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400009a1:	8d 58 01             	lea    0x1(%eax),%ebx
400009a4:	0f be 00             	movsbl (%eax),%eax
400009a7:	0f be c8             	movsbl %al,%ecx
400009aa:	85 c9                	test   %ecx,%ecx
400009ac:	0f 85 59 fe ff ff    	jne    4000080b <.L25+0x4e>
400009b2:	e9 d9 fe ff ff       	jmp    40000890 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
400009b7:	83 ec 08             	sub    $0x8,%esp
400009ba:	52                   	push   %edx
400009bb:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400009bf:	8d 8b 41 e0 ff ff    	lea    -0x1fbf(%ebx),%ecx
400009c5:	89 54 24 28          	mov    %edx,0x28(%esp)
400009c9:	51                   	push   %ecx
400009ca:	89 4c 24 28          	mov    %ecx,0x28(%esp)
400009ce:	e8 ad 02 00 00       	call   40000c80 <strnlen>
400009d3:	29 44 24 18          	sub    %eax,0x18(%esp)
400009d7:	8b 44 24 18          	mov    0x18(%esp),%eax
400009db:	83 c4 10             	add    $0x10,%esp
400009de:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400009e2:	85 c0                	test   %eax,%eax
400009e4:	7f 8b                	jg     40000971 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
400009e6:	b9 28 00 00 00       	mov    $0x28,%ecx
400009eb:	b8 28 00 00 00       	mov    $0x28,%eax
400009f0:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400009f4:	89 74 24 40          	mov    %esi,0x40(%esp)
400009f8:	89 d6                	mov    %edx,%esi
400009fa:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400009fe:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000a02:	83 c3 01             	add    $0x1,%ebx
40000a05:	e9 3b fe ff ff       	jmp    40000845 <.L25+0x88>
40000a0a:	8b 44 24 18          	mov    0x18(%esp),%eax
40000a0e:	0f be 08             	movsbl (%eax),%ecx
40000a11:	89 c8                	mov    %ecx,%eax
40000a13:	85 c9                	test   %ecx,%ecx
40000a15:	75 d9                	jne    400009f0 <.L19+0x10f>
40000a17:	e9 74 fe ff ff       	jmp    40000890 <.L25+0xd3>
40000a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000a20 <printfmt>:
{
40000a20:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000a23:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000a27:	50                   	push   %eax
40000a28:	ff 74 24 1c          	push   0x1c(%esp)
40000a2c:	ff 74 24 1c          	push   0x1c(%esp)
40000a30:	ff 74 24 1c          	push   0x1c(%esp)
40000a34:	e8 d7 fa ff ff       	call   40000510 <vprintfmt>
}
40000a39:	83 c4 1c             	add    $0x1c,%esp
40000a3c:	c3                   	ret
40000a3d:	8d 76 00             	lea    0x0(%esi),%esi

40000a40 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a40:	e8 4e 01 00 00       	call   40000b93 <__x86.get_pc_thunk.ax>
40000a45:	05 af 35 00 00       	add    $0x35af,%eax
{
40000a4a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a4d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a51:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a58:	ff 
40000a59:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a60:	00 
40000a61:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a65:	ff 74 24 28          	push   0x28(%esp)
40000a69:	ff 74 24 28          	push   0x28(%esp)
40000a6d:	8d 80 fc c4 ff ff    	lea    -0x3b04(%eax),%eax
40000a73:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a77:	52                   	push   %edx
40000a78:	50                   	push   %eax
40000a79:	e8 92 fa ff ff       	call   40000510 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a7e:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a82:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a85:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a89:	83 c4 2c             	add    $0x2c,%esp
40000a8c:	c3                   	ret
40000a8d:	8d 76 00             	lea    0x0(%esi),%esi

40000a90 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a90:	e8 fe 00 00 00       	call   40000b93 <__x86.get_pc_thunk.ax>
40000a95:	05 5f 35 00 00       	add    $0x355f,%eax
{
40000a9a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a9d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000aa1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000aa8:	ff 
40000aa9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000ab0:	00 
40000ab1:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000ab5:	8d 54 24 28          	lea    0x28(%esp),%edx
40000ab9:	52                   	push   %edx
40000aba:	ff 74 24 28          	push   0x28(%esp)
40000abe:	8d 80 fc c4 ff ff    	lea    -0x3b04(%eax),%eax
40000ac4:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000ac8:	52                   	push   %edx
40000ac9:	50                   	push   %eax
40000aca:	e8 41 fa ff ff       	call   40000510 <vprintfmt>
    *b.buf = '\0';
40000acf:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ad3:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
40000ad6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000ada:	83 c4 2c             	add    $0x2c,%esp
40000add:	c3                   	ret
40000ade:	66 90                	xchg   %ax,%ax

40000ae0 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000ae0:	e8 b2 00 00 00       	call   40000b97 <__x86.get_pc_thunk.dx>
40000ae5:	81 c2 0f 35 00 00    	add    $0x350f,%edx
{
40000aeb:	83 ec 1c             	sub    $0x1c,%esp
40000aee:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000af2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000af6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000afd:	00 
40000afe:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b02:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000b06:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000b0a:	ff 74 24 2c          	push   0x2c(%esp)
40000b0e:	ff 74 24 2c          	push   0x2c(%esp)
40000b12:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b16:	50                   	push   %eax
40000b17:	8d 82 fc c4 ff ff    	lea    -0x3b04(%edx),%eax
40000b1d:	50                   	push   %eax
40000b1e:	e8 ed f9 ff ff       	call   40000510 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000b23:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b27:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000b2a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b2e:	83 c4 2c             	add    $0x2c,%esp
40000b31:	c3                   	ret
40000b32:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b39:	00 
40000b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000b40 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000b40:	e8 52 00 00 00       	call   40000b97 <__x86.get_pc_thunk.dx>
40000b45:	81 c2 af 34 00 00    	add    $0x34af,%edx
{
40000b4b:	83 ec 1c             	sub    $0x1c,%esp
40000b4e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000b52:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000b56:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000b5d:	00 
40000b5e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b62:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000b66:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000b6a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000b6e:	50                   	push   %eax
40000b6f:	ff 74 24 2c          	push   0x2c(%esp)
40000b73:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b77:	50                   	push   %eax
40000b78:	8d 82 fc c4 ff ff    	lea    -0x3b04(%edx),%eax
40000b7e:	50                   	push   %eax
40000b7f:	e8 8c f9 ff ff       	call   40000510 <vprintfmt>
    *b.buf = '\0';
40000b84:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b88:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000b8b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b8f:	83 c4 2c             	add    $0x2c,%esp
40000b92:	c3                   	ret

40000b93 <__x86.get_pc_thunk.ax>:
40000b93:	8b 04 24             	mov    (%esp),%eax
40000b96:	c3                   	ret

40000b97 <__x86.get_pc_thunk.dx>:
40000b97:	8b 14 24             	mov    (%esp),%edx
40000b9a:	c3                   	ret

40000b9b <__x86.get_pc_thunk.cx>:
40000b9b:	8b 0c 24             	mov    (%esp),%ecx
40000b9e:	c3                   	ret
40000b9f:	90                   	nop

40000ba0 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000ba0:	53                   	push   %ebx
    asm volatile ("int %2"
40000ba1:	b8 02 00 00 00       	mov    $0x2,%eax
40000ba6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000baa:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000bae:	cd 30                	int    $0x30
    return errno ? -1 : pid;
40000bb0:	85 c0                	test   %eax,%eax
40000bb2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000bb7:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000bba:	5b                   	pop    %ebx
40000bbb:	c3                   	ret
40000bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000bc0 <yield>:
    asm volatile ("int %0"
40000bc0:	b8 03 00 00 00       	mov    $0x3,%eax
40000bc5:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000bc7:	c3                   	ret
40000bc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bcf:	00 

40000bd0 <produce>:

void produce(int item)
{
40000bd0:	53                   	push   %ebx
}

static gcc_inline void sys_produce(unsigned int item)
{
	int errno; 
    asm volatile ("int %1"
40000bd1:	b8 0e 00 00 00       	mov    $0xe,%eax
40000bd6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000bda:	cd 30                	int    $0x30
    sys_produce(item);
}
40000bdc:	5b                   	pop    %ebx
40000bdd:	c3                   	ret
40000bde:	66 90                	xchg   %ax,%ax

40000be0 <consume>:

int consume(void)
{
40000be0:	53                   	push   %ebx

static gcc_inline int sys_consume(void)
{
	int errno, item;

    asm volatile ("int %2"
40000be1:	b8 0f 00 00 00       	mov    $0xf,%eax
40000be6:	cd 30                	int    $0x30
    return sys_consume();
40000be8:	89 d8                	mov    %ebx,%eax
40000bea:	5b                   	pop    %ebx
40000beb:	c3                   	ret
40000bec:	66 90                	xchg   %ax,%ax
40000bee:	66 90                	xchg   %ax,%ax

40000bf0 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000bf0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000bf4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000bfa:	c3                   	ret
40000bfb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000c00 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000c00:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000c04:	b8 01 00 00 00       	mov    $0x1,%eax
40000c09:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000c0c:	85 c0                	test   %eax,%eax
40000c0e:	74 13                	je     40000c23 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000c10:	b9 01 00 00 00       	mov    $0x1,%ecx
40000c15:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000c18:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000c1a:	89 c8                	mov    %ecx,%eax
40000c1c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000c1f:	85 c0                	test   %eax,%eax
40000c21:	75 f5                	jne    40000c18 <spinlock_acquire+0x18>
}
40000c23:	c3                   	ret
40000c24:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c2b:	00 
40000c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000c30 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000c30:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000c34:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000c36:	84 c0                	test   %al,%al
40000c38:	74 05                	je     40000c3f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000c3a:	31 c0                	xor    %eax,%eax
40000c3c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000c3f:	c3                   	ret

40000c40 <spinlock_holding>:
    return *lk;
40000c40:	8b 44 24 04          	mov    0x4(%esp),%eax
40000c44:	8b 00                	mov    (%eax),%eax
}
40000c46:	c3                   	ret
40000c47:	66 90                	xchg   %ax,%ax
40000c49:	66 90                	xchg   %ax,%ax
40000c4b:	66 90                	xchg   %ax,%ax
40000c4d:	66 90                	xchg   %ax,%ax
40000c4f:	90                   	nop

40000c50 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000c50:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000c54:	31 c0                	xor    %eax,%eax
40000c56:	80 3a 00             	cmpb   $0x0,(%edx)
40000c59:	74 15                	je     40000c70 <strlen+0x20>
40000c5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000c60:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000c63:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000c67:	75 f7                	jne    40000c60 <strlen+0x10>
40000c69:	c3                   	ret
40000c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000c70:	c3                   	ret
40000c71:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c78:	00 
40000c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c80 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000c80:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c84:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c88:	31 c0                	xor    %eax,%eax
40000c8a:	85 d2                	test   %edx,%edx
40000c8c:	75 09                	jne    40000c97 <strnlen+0x17>
40000c8e:	c3                   	ret
40000c8f:	90                   	nop
        n++;
40000c90:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c93:	39 c2                	cmp    %eax,%edx
40000c95:	74 09                	je     40000ca0 <strnlen+0x20>
40000c97:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000c9b:	75 f3                	jne    40000c90 <strnlen+0x10>
40000c9d:	c3                   	ret
40000c9e:	66 90                	xchg   %ax,%ax
    return n;
}
40000ca0:	c3                   	ret
40000ca1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ca8:	00 
40000ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000cb0 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000cb0:	53                   	push   %ebx
40000cb1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000cb5:	31 c0                	xor    %eax,%eax
{
40000cb7:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000cbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000cc0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000cc4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000cc7:	83 c0 01             	add    $0x1,%eax
40000cca:	84 d2                	test   %dl,%dl
40000ccc:	75 f2                	jne    40000cc0 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000cce:	89 c8                	mov    %ecx,%eax
40000cd0:	5b                   	pop    %ebx
40000cd1:	c3                   	ret
40000cd2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cd9:	00 
40000cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000ce0 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000ce0:	56                   	push   %esi
40000ce1:	53                   	push   %ebx
40000ce2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000ce6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000cea:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000cee:	85 db                	test   %ebx,%ebx
40000cf0:	74 21                	je     40000d13 <strncpy+0x33>
40000cf2:	01 f3                	add    %esi,%ebx
40000cf4:	89 f0                	mov    %esi,%eax
40000cf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cfd:	00 
40000cfe:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000d00:	0f b6 0a             	movzbl (%edx),%ecx
40000d03:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000d06:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000d09:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000d0c:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000d0f:	39 c3                	cmp    %eax,%ebx
40000d11:	75 ed                	jne    40000d00 <strncpy+0x20>
    }
    return ret;
}
40000d13:	89 f0                	mov    %esi,%eax
40000d15:	5b                   	pop    %ebx
40000d16:	5e                   	pop    %esi
40000d17:	c3                   	ret
40000d18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d1f:	00 

40000d20 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000d20:	56                   	push   %esi
40000d21:	53                   	push   %ebx
40000d22:	8b 44 24 14          	mov    0x14(%esp),%eax
40000d26:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000d2a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000d2e:	85 c0                	test   %eax,%eax
40000d30:	74 29                	je     40000d5b <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000d32:	89 f2                	mov    %esi,%edx
40000d34:	83 e8 01             	sub    $0x1,%eax
40000d37:	74 1f                	je     40000d58 <strlcpy+0x38>
40000d39:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000d3c:	eb 0f                	jmp    40000d4d <strlcpy+0x2d>
40000d3e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000d40:	83 c2 01             	add    $0x1,%edx
40000d43:	83 c1 01             	add    $0x1,%ecx
40000d46:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000d49:	39 da                	cmp    %ebx,%edx
40000d4b:	74 07                	je     40000d54 <strlcpy+0x34>
40000d4d:	0f b6 01             	movzbl (%ecx),%eax
40000d50:	84 c0                	test   %al,%al
40000d52:	75 ec                	jne    40000d40 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000d54:	89 d0                	mov    %edx,%eax
40000d56:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000d58:	c6 02 00             	movb   $0x0,(%edx)
}
40000d5b:	5b                   	pop    %ebx
40000d5c:	5e                   	pop    %esi
40000d5d:	c3                   	ret
40000d5e:	66 90                	xchg   %ax,%ax

40000d60 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000d60:	53                   	push   %ebx
40000d61:	8b 54 24 08          	mov    0x8(%esp),%edx
40000d65:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000d69:	0f b6 02             	movzbl (%edx),%eax
40000d6c:	84 c0                	test   %al,%al
40000d6e:	75 18                	jne    40000d88 <strcmp+0x28>
40000d70:	eb 30                	jmp    40000da2 <strcmp+0x42>
40000d72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000d7c:	83 c2 01             	add    $0x1,%edx
40000d7f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000d82:	84 c0                	test   %al,%al
40000d84:	74 12                	je     40000d98 <strcmp+0x38>
40000d86:	89 d9                	mov    %ebx,%ecx
40000d88:	0f b6 19             	movzbl (%ecx),%ebx
40000d8b:	38 c3                	cmp    %al,%bl
40000d8d:	74 e9                	je     40000d78 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d8f:	29 d8                	sub    %ebx,%eax
}
40000d91:	5b                   	pop    %ebx
40000d92:	c3                   	ret
40000d93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d98:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000d9c:	31 c0                	xor    %eax,%eax
40000d9e:	29 d8                	sub    %ebx,%eax
}
40000da0:	5b                   	pop    %ebx
40000da1:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000da2:	0f b6 19             	movzbl (%ecx),%ebx
40000da5:	31 c0                	xor    %eax,%eax
40000da7:	eb e6                	jmp    40000d8f <strcmp+0x2f>
40000da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000db0 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000db0:	53                   	push   %ebx
40000db1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000db5:	8b 44 24 08          	mov    0x8(%esp),%eax
40000db9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000dbd:	85 d2                	test   %edx,%edx
40000dbf:	75 16                	jne    40000dd7 <strncmp+0x27>
40000dc1:	eb 2d                	jmp    40000df0 <strncmp+0x40>
40000dc3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dc8:	3a 19                	cmp    (%ecx),%bl
40000dca:	75 12                	jne    40000dde <strncmp+0x2e>
        n--, p++, q++;
40000dcc:	83 c0 01             	add    $0x1,%eax
40000dcf:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000dd2:	83 ea 01             	sub    $0x1,%edx
40000dd5:	74 19                	je     40000df0 <strncmp+0x40>
40000dd7:	0f b6 18             	movzbl (%eax),%ebx
40000dda:	84 db                	test   %bl,%bl
40000ddc:	75 ea                	jne    40000dc8 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000dde:	0f b6 00             	movzbl (%eax),%eax
40000de1:	0f b6 11             	movzbl (%ecx),%edx
}
40000de4:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000de5:	29 d0                	sub    %edx,%eax
}
40000de7:	c3                   	ret
40000de8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000def:	00 
        return 0;
40000df0:	31 c0                	xor    %eax,%eax
}
40000df2:	5b                   	pop    %ebx
40000df3:	c3                   	ret
40000df4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dfb:	00 
40000dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000e00 <strchr>:

char *strchr(const char *s, char c)
{
40000e00:	8b 44 24 04          	mov    0x4(%esp),%eax
40000e04:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000e09:	0f b6 10             	movzbl (%eax),%edx
40000e0c:	84 d2                	test   %dl,%dl
40000e0e:	75 13                	jne    40000e23 <strchr+0x23>
40000e10:	eb 1e                	jmp    40000e30 <strchr+0x30>
40000e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000e18:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000e1c:	83 c0 01             	add    $0x1,%eax
40000e1f:	84 d2                	test   %dl,%dl
40000e21:	74 0d                	je     40000e30 <strchr+0x30>
        if (*s == c)
40000e23:	38 d1                	cmp    %dl,%cl
40000e25:	75 f1                	jne    40000e18 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000e27:	c3                   	ret
40000e28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e2f:	00 
    return 0;
40000e30:	31 c0                	xor    %eax,%eax
}
40000e32:	c3                   	ret
40000e33:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e3a:	00 
40000e3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000e40 <strfind>:

char *strfind(const char *s, char c)
{
40000e40:	53                   	push   %ebx
40000e41:	8b 44 24 08          	mov    0x8(%esp),%eax
40000e45:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000e49:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000e4c:	38 d3                	cmp    %dl,%bl
40000e4e:	74 1f                	je     40000e6f <strfind+0x2f>
40000e50:	89 d1                	mov    %edx,%ecx
40000e52:	84 db                	test   %bl,%bl
40000e54:	75 0e                	jne    40000e64 <strfind+0x24>
40000e56:	eb 17                	jmp    40000e6f <strfind+0x2f>
40000e58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e5f:	00 
40000e60:	84 d2                	test   %dl,%dl
40000e62:	74 0b                	je     40000e6f <strfind+0x2f>
    for (; *s; s++)
40000e64:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000e68:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000e6b:	38 ca                	cmp    %cl,%dl
40000e6d:	75 f1                	jne    40000e60 <strfind+0x20>
            break;
    return (char *) s;
}
40000e6f:	5b                   	pop    %ebx
40000e70:	c3                   	ret
40000e71:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e78:	00 
40000e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000e80 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000e80:	55                   	push   %ebp
40000e81:	57                   	push   %edi
40000e82:	56                   	push   %esi
40000e83:	53                   	push   %ebx
40000e84:	8b 54 24 14          	mov    0x14(%esp),%edx
40000e88:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000e8c:	0f b6 02             	movzbl (%edx),%eax
40000e8f:	3c 20                	cmp    $0x20,%al
40000e91:	75 10                	jne    40000ea3 <strtol+0x23>
40000e93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000e9c:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000e9f:	3c 20                	cmp    $0x20,%al
40000ea1:	74 f5                	je     40000e98 <strtol+0x18>
40000ea3:	3c 09                	cmp    $0x9,%al
40000ea5:	74 f1                	je     40000e98 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000ea7:	3c 2b                	cmp    $0x2b,%al
40000ea9:	0f 84 b1 00 00 00    	je     40000f60 <strtol+0xe0>
    int neg = 0;
40000eaf:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000eb1:	3c 2d                	cmp    $0x2d,%al
40000eb3:	0f 84 97 00 00 00    	je     40000f50 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000eb9:	0f b6 02             	movzbl (%edx),%eax
40000ebc:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000ec3:	ff 
40000ec4:	75 1d                	jne    40000ee3 <strtol+0x63>
40000ec6:	3c 30                	cmp    $0x30,%al
40000ec8:	0f 84 a2 00 00 00    	je     40000f70 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000ece:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000ed3:	19 c0                	sbb    %eax,%eax
40000ed5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000ed9:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000ede:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000ee3:	31 c9                	xor    %ecx,%ecx
40000ee5:	eb 1c                	jmp    40000f03 <strtol+0x83>
40000ee7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000eee:	00 
40000eef:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000ef0:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000ef3:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000ef7:	7d 2a                	jge    40000f23 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000ef9:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000efe:	83 c2 01             	add    $0x1,%edx
40000f01:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000f03:	0f be 02             	movsbl (%edx),%eax
40000f06:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000f09:	89 eb                	mov    %ebp,%ebx
40000f0b:	80 fb 09             	cmp    $0x9,%bl
40000f0e:	76 e0                	jbe    40000ef0 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000f10:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000f13:	89 eb                	mov    %ebp,%ebx
40000f15:	80 fb 19             	cmp    $0x19,%bl
40000f18:	77 26                	ja     40000f40 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000f1a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000f1d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000f21:	7c d6                	jl     40000ef9 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000f23:	85 f6                	test   %esi,%esi
40000f25:	74 02                	je     40000f29 <strtol+0xa9>
        *endptr = (char *) s;
40000f27:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000f29:	89 c8                	mov    %ecx,%eax
}
40000f2b:	5b                   	pop    %ebx
40000f2c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000f2d:	f7 d8                	neg    %eax
40000f2f:	85 ff                	test   %edi,%edi
}
40000f31:	5f                   	pop    %edi
40000f32:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000f33:	0f 45 c8             	cmovne %eax,%ecx
}
40000f36:	89 c8                	mov    %ecx,%eax
40000f38:	c3                   	ret
40000f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000f40:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000f43:	89 eb                	mov    %ebp,%ebx
40000f45:	80 fb 19             	cmp    $0x19,%bl
40000f48:	77 d9                	ja     40000f23 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000f4a:	83 e8 37             	sub    $0x37,%eax
40000f4d:	eb a4                	jmp    40000ef3 <strtol+0x73>
40000f4f:	90                   	nop
        s++, neg = 1;
40000f50:	83 c2 01             	add    $0x1,%edx
40000f53:	bf 01 00 00 00       	mov    $0x1,%edi
40000f58:	e9 5c ff ff ff       	jmp    40000eb9 <strtol+0x39>
40000f5d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000f60:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000f63:	31 ff                	xor    %edi,%edi
40000f65:	e9 4f ff ff ff       	jmp    40000eb9 <strtol+0x39>
40000f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000f70:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000f74:	74 25                	je     40000f9b <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000f76:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000f7a:	85 c0                	test   %eax,%eax
40000f7c:	74 0d                	je     40000f8b <strtol+0x10b>
40000f7e:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f85:	00 
40000f86:	e9 58 ff ff ff       	jmp    40000ee3 <strtol+0x63>
        s++, base = 8;
40000f8b:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000f92:	00 
40000f93:	83 c2 01             	add    $0x1,%edx
40000f96:	e9 48 ff ff ff       	jmp    40000ee3 <strtol+0x63>
        s += 2, base = 16;
40000f9b:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000fa2:	00 
40000fa3:	83 c2 02             	add    $0x2,%edx
40000fa6:	e9 38 ff ff ff       	jmp    40000ee3 <strtol+0x63>
40000fab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000fb0 <memset>:

void *memset(void *v, int c, size_t n)
{
40000fb0:	57                   	push   %edi
40000fb1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000fb5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000fb9:	85 c9                	test   %ecx,%ecx
40000fbb:	74 19                	je     40000fd6 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000fbd:	89 f8                	mov    %edi,%eax
40000fbf:	09 c8                	or     %ecx,%eax
40000fc1:	a8 03                	test   $0x3,%al
40000fc3:	75 1b                	jne    40000fe0 <memset+0x30>
        c &= 0xFF;
40000fc5:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000fca:	c1 e9 02             	shr    $0x2,%ecx
40000fcd:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000fd3:	fc                   	cld
40000fd4:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000fd6:	89 f8                	mov    %edi,%eax
40000fd8:	5f                   	pop    %edi
40000fd9:	c3                   	ret
40000fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000fe0:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fe4:	fc                   	cld
40000fe5:	f3 aa                	rep stos %al,%es:(%edi)
}
40000fe7:	89 f8                	mov    %edi,%eax
40000fe9:	5f                   	pop    %edi
40000fea:	c3                   	ret
40000feb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000ff0 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000ff0:	57                   	push   %edi
40000ff1:	56                   	push   %esi
40000ff2:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ff6:	8b 74 24 10          	mov    0x10(%esp),%esi
40000ffa:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000ffe:	39 c6                	cmp    %eax,%esi
40001000:	73 26                	jae    40001028 <memmove+0x38>
40001002:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40001005:	39 d0                	cmp    %edx,%eax
40001007:	73 1f                	jae    40001028 <memmove+0x38>
        s += n;
        d += n;
40001009:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
4000100c:	89 fe                	mov    %edi,%esi
4000100e:	09 ce                	or     %ecx,%esi
40001010:	09 d6                	or     %edx,%esi
40001012:	83 e6 03             	and    $0x3,%esi
40001015:	74 39                	je     40001050 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40001017:	83 ef 01             	sub    $0x1,%edi
4000101a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
4000101d:	fd                   	std
4000101e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40001020:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40001021:	5e                   	pop    %esi
40001022:	5f                   	pop    %edi
40001023:	c3                   	ret
40001024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40001028:	89 c2                	mov    %eax,%edx
4000102a:	09 ca                	or     %ecx,%edx
4000102c:	09 f2                	or     %esi,%edx
4000102e:	83 e2 03             	and    $0x3,%edx
40001031:	74 0d                	je     40001040 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40001033:	89 c7                	mov    %eax,%edi
40001035:	fc                   	cld
40001036:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40001038:	5e                   	pop    %esi
40001039:	5f                   	pop    %edi
4000103a:	c3                   	ret
4000103b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40001040:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40001043:	89 c7                	mov    %eax,%edi
40001045:	fc                   	cld
40001046:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001048:	eb ee                	jmp    40001038 <memmove+0x48>
4000104a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40001050:	83 ef 04             	sub    $0x4,%edi
40001053:	8d 72 fc             	lea    -0x4(%edx),%esi
40001056:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40001059:	fd                   	std
4000105a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
4000105c:	eb c2                	jmp    40001020 <memmove+0x30>
4000105e:	66 90                	xchg   %ax,%ax

40001060 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40001060:	eb 8e                	jmp    40000ff0 <memmove>
40001062:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001069:	00 
4000106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001070 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40001070:	56                   	push   %esi
40001071:	53                   	push   %ebx
40001072:	8b 74 24 14          	mov    0x14(%esp),%esi
40001076:	8b 44 24 0c          	mov    0xc(%esp),%eax
4000107a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
4000107e:	85 f6                	test   %esi,%esi
40001080:	74 2e                	je     400010b0 <memcmp+0x40>
40001082:	01 c6                	add    %eax,%esi
40001084:	eb 14                	jmp    4000109a <memcmp+0x2a>
40001086:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000108d:	00 
4000108e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40001090:	83 c0 01             	add    $0x1,%eax
40001093:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40001096:	39 f0                	cmp    %esi,%eax
40001098:	74 16                	je     400010b0 <memcmp+0x40>
        if (*s1 != *s2)
4000109a:	0f b6 08             	movzbl (%eax),%ecx
4000109d:	0f b6 1a             	movzbl (%edx),%ebx
400010a0:	38 d9                	cmp    %bl,%cl
400010a2:	74 ec                	je     40001090 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
400010a4:	0f b6 c1             	movzbl %cl,%eax
400010a7:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
400010a9:	5b                   	pop    %ebx
400010aa:	5e                   	pop    %esi
400010ab:	c3                   	ret
400010ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
400010b0:	31 c0                	xor    %eax,%eax
}
400010b2:	5b                   	pop    %ebx
400010b3:	5e                   	pop    %esi
400010b4:	c3                   	ret
400010b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400010bc:	00 
400010bd:	8d 76 00             	lea    0x0(%esi),%esi

400010c0 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
400010c0:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
400010c4:	8b 54 24 0c          	mov    0xc(%esp),%edx
400010c8:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
400010ca:	39 d0                	cmp    %edx,%eax
400010cc:	73 1a                	jae    400010e8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
400010ce:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
400010d3:	eb 0a                	jmp    400010df <memchr+0x1f>
400010d5:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
400010d8:	83 c0 01             	add    $0x1,%eax
400010db:	39 c2                	cmp    %eax,%edx
400010dd:	74 09                	je     400010e8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
400010df:	38 08                	cmp    %cl,(%eax)
400010e1:	75 f5                	jne    400010d8 <memchr+0x18>
            return (void *) s;
    return NULL;
}
400010e3:	c3                   	ret
400010e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
400010e8:	31 c0                	xor    %eax,%eax
}
400010ea:	c3                   	ret
400010eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

400010f0 <memzero>:

void *memzero(void *v, size_t n)
{
400010f0:	57                   	push   %edi
400010f1:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400010f5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
400010f9:	85 c9                	test   %ecx,%ecx
400010fb:	74 0f                	je     4000110c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
400010fd:	89 f8                	mov    %edi,%eax
400010ff:	09 c8                	or     %ecx,%eax
40001101:	83 e0 03             	and    $0x3,%eax
40001104:	75 0a                	jne    40001110 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40001106:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40001109:	fc                   	cld
4000110a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
4000110c:	89 f8                	mov    %edi,%eax
4000110e:	5f                   	pop    %edi
4000110f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001110:	31 c0                	xor    %eax,%eax
40001112:	fc                   	cld
40001113:	f3 aa                	rep stos %al,%es:(%edi)
}
40001115:	89 f8                	mov    %edi,%eax
40001117:	5f                   	pop    %edi
40001118:	c3                   	ret

40001119 <__x86.get_pc_thunk.si>:
40001119:	8b 34 24             	mov    (%esp),%esi
4000111c:	c3                   	ret
4000111d:	66 90                	xchg   %ax,%ax
4000111f:	90                   	nop

40001120 <__udivdi3>:
40001120:	f3 0f 1e fb          	endbr32
40001124:	55                   	push   %ebp
40001125:	57                   	push   %edi
40001126:	56                   	push   %esi
40001127:	53                   	push   %ebx
40001128:	83 ec 1c             	sub    $0x1c,%esp
4000112b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
4000112f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
40001133:	8b 74 24 34          	mov    0x34(%esp),%esi
40001137:	8b 5c 24 38          	mov    0x38(%esp),%ebx
4000113b:	85 c0                	test   %eax,%eax
4000113d:	75 19                	jne    40001158 <__udivdi3+0x38>
4000113f:	39 de                	cmp    %ebx,%esi
40001141:	73 4d                	jae    40001190 <__udivdi3+0x70>
40001143:	31 ff                	xor    %edi,%edi
40001145:	89 e8                	mov    %ebp,%eax
40001147:	89 f2                	mov    %esi,%edx
40001149:	f7 f3                	div    %ebx
4000114b:	89 fa                	mov    %edi,%edx
4000114d:	83 c4 1c             	add    $0x1c,%esp
40001150:	5b                   	pop    %ebx
40001151:	5e                   	pop    %esi
40001152:	5f                   	pop    %edi
40001153:	5d                   	pop    %ebp
40001154:	c3                   	ret
40001155:	8d 76 00             	lea    0x0(%esi),%esi
40001158:	39 c6                	cmp    %eax,%esi
4000115a:	73 14                	jae    40001170 <__udivdi3+0x50>
4000115c:	31 ff                	xor    %edi,%edi
4000115e:	31 c0                	xor    %eax,%eax
40001160:	89 fa                	mov    %edi,%edx
40001162:	83 c4 1c             	add    $0x1c,%esp
40001165:	5b                   	pop    %ebx
40001166:	5e                   	pop    %esi
40001167:	5f                   	pop    %edi
40001168:	5d                   	pop    %ebp
40001169:	c3                   	ret
4000116a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001170:	0f bd f8             	bsr    %eax,%edi
40001173:	83 f7 1f             	xor    $0x1f,%edi
40001176:	75 48                	jne    400011c0 <__udivdi3+0xa0>
40001178:	39 f0                	cmp    %esi,%eax
4000117a:	72 06                	jb     40001182 <__udivdi3+0x62>
4000117c:	31 c0                	xor    %eax,%eax
4000117e:	39 dd                	cmp    %ebx,%ebp
40001180:	72 de                	jb     40001160 <__udivdi3+0x40>
40001182:	b8 01 00 00 00       	mov    $0x1,%eax
40001187:	eb d7                	jmp    40001160 <__udivdi3+0x40>
40001189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001190:	89 d9                	mov    %ebx,%ecx
40001192:	85 db                	test   %ebx,%ebx
40001194:	75 0b                	jne    400011a1 <__udivdi3+0x81>
40001196:	b8 01 00 00 00       	mov    $0x1,%eax
4000119b:	31 d2                	xor    %edx,%edx
4000119d:	f7 f3                	div    %ebx
4000119f:	89 c1                	mov    %eax,%ecx
400011a1:	31 d2                	xor    %edx,%edx
400011a3:	89 f0                	mov    %esi,%eax
400011a5:	f7 f1                	div    %ecx
400011a7:	89 c6                	mov    %eax,%esi
400011a9:	89 e8                	mov    %ebp,%eax
400011ab:	89 f7                	mov    %esi,%edi
400011ad:	f7 f1                	div    %ecx
400011af:	89 fa                	mov    %edi,%edx
400011b1:	83 c4 1c             	add    $0x1c,%esp
400011b4:	5b                   	pop    %ebx
400011b5:	5e                   	pop    %esi
400011b6:	5f                   	pop    %edi
400011b7:	5d                   	pop    %ebp
400011b8:	c3                   	ret
400011b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400011c0:	89 f9                	mov    %edi,%ecx
400011c2:	ba 20 00 00 00       	mov    $0x20,%edx
400011c7:	29 fa                	sub    %edi,%edx
400011c9:	d3 e0                	shl    %cl,%eax
400011cb:	89 44 24 08          	mov    %eax,0x8(%esp)
400011cf:	89 d1                	mov    %edx,%ecx
400011d1:	89 d8                	mov    %ebx,%eax
400011d3:	d3 e8                	shr    %cl,%eax
400011d5:	89 c1                	mov    %eax,%ecx
400011d7:	8b 44 24 08          	mov    0x8(%esp),%eax
400011db:	09 c1                	or     %eax,%ecx
400011dd:	89 f0                	mov    %esi,%eax
400011df:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400011e3:	89 f9                	mov    %edi,%ecx
400011e5:	d3 e3                	shl    %cl,%ebx
400011e7:	89 d1                	mov    %edx,%ecx
400011e9:	d3 e8                	shr    %cl,%eax
400011eb:	89 f9                	mov    %edi,%ecx
400011ed:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
400011f1:	89 eb                	mov    %ebp,%ebx
400011f3:	d3 e6                	shl    %cl,%esi
400011f5:	89 d1                	mov    %edx,%ecx
400011f7:	d3 eb                	shr    %cl,%ebx
400011f9:	09 f3                	or     %esi,%ebx
400011fb:	89 c6                	mov    %eax,%esi
400011fd:	89 f2                	mov    %esi,%edx
400011ff:	89 d8                	mov    %ebx,%eax
40001201:	f7 74 24 08          	divl   0x8(%esp)
40001205:	89 d6                	mov    %edx,%esi
40001207:	89 c3                	mov    %eax,%ebx
40001209:	f7 64 24 0c          	mull   0xc(%esp)
4000120d:	39 d6                	cmp    %edx,%esi
4000120f:	72 1f                	jb     40001230 <__udivdi3+0x110>
40001211:	89 f9                	mov    %edi,%ecx
40001213:	d3 e5                	shl    %cl,%ebp
40001215:	39 c5                	cmp    %eax,%ebp
40001217:	73 04                	jae    4000121d <__udivdi3+0xfd>
40001219:	39 d6                	cmp    %edx,%esi
4000121b:	74 13                	je     40001230 <__udivdi3+0x110>
4000121d:	89 d8                	mov    %ebx,%eax
4000121f:	31 ff                	xor    %edi,%edi
40001221:	e9 3a ff ff ff       	jmp    40001160 <__udivdi3+0x40>
40001226:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000122d:	00 
4000122e:	66 90                	xchg   %ax,%ax
40001230:	8d 43 ff             	lea    -0x1(%ebx),%eax
40001233:	31 ff                	xor    %edi,%edi
40001235:	e9 26 ff ff ff       	jmp    40001160 <__udivdi3+0x40>
4000123a:	66 90                	xchg   %ax,%ax
4000123c:	66 90                	xchg   %ax,%ax
4000123e:	66 90                	xchg   %ax,%ax

40001240 <__umoddi3>:
40001240:	f3 0f 1e fb          	endbr32
40001244:	55                   	push   %ebp
40001245:	57                   	push   %edi
40001246:	56                   	push   %esi
40001247:	53                   	push   %ebx
40001248:	83 ec 1c             	sub    $0x1c,%esp
4000124b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
4000124f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40001253:	8b 74 24 30          	mov    0x30(%esp),%esi
40001257:	8b 7c 24 38          	mov    0x38(%esp),%edi
4000125b:	89 da                	mov    %ebx,%edx
4000125d:	85 c0                	test   %eax,%eax
4000125f:	75 17                	jne    40001278 <__umoddi3+0x38>
40001261:	39 fb                	cmp    %edi,%ebx
40001263:	73 53                	jae    400012b8 <__umoddi3+0x78>
40001265:	89 f0                	mov    %esi,%eax
40001267:	f7 f7                	div    %edi
40001269:	89 d0                	mov    %edx,%eax
4000126b:	31 d2                	xor    %edx,%edx
4000126d:	83 c4 1c             	add    $0x1c,%esp
40001270:	5b                   	pop    %ebx
40001271:	5e                   	pop    %esi
40001272:	5f                   	pop    %edi
40001273:	5d                   	pop    %ebp
40001274:	c3                   	ret
40001275:	8d 76 00             	lea    0x0(%esi),%esi
40001278:	89 f1                	mov    %esi,%ecx
4000127a:	39 c3                	cmp    %eax,%ebx
4000127c:	73 12                	jae    40001290 <__umoddi3+0x50>
4000127e:	89 f0                	mov    %esi,%eax
40001280:	83 c4 1c             	add    $0x1c,%esp
40001283:	5b                   	pop    %ebx
40001284:	5e                   	pop    %esi
40001285:	5f                   	pop    %edi
40001286:	5d                   	pop    %ebp
40001287:	c3                   	ret
40001288:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000128f:	00 
40001290:	0f bd e8             	bsr    %eax,%ebp
40001293:	83 f5 1f             	xor    $0x1f,%ebp
40001296:	75 48                	jne    400012e0 <__umoddi3+0xa0>
40001298:	39 d8                	cmp    %ebx,%eax
4000129a:	0f 82 d0 00 00 00    	jb     40001370 <__umoddi3+0x130>
400012a0:	39 fe                	cmp    %edi,%esi
400012a2:	0f 83 c8 00 00 00    	jae    40001370 <__umoddi3+0x130>
400012a8:	89 c8                	mov    %ecx,%eax
400012aa:	83 c4 1c             	add    $0x1c,%esp
400012ad:	5b                   	pop    %ebx
400012ae:	5e                   	pop    %esi
400012af:	5f                   	pop    %edi
400012b0:	5d                   	pop    %ebp
400012b1:	c3                   	ret
400012b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400012b8:	89 f9                	mov    %edi,%ecx
400012ba:	85 ff                	test   %edi,%edi
400012bc:	75 0b                	jne    400012c9 <__umoddi3+0x89>
400012be:	b8 01 00 00 00       	mov    $0x1,%eax
400012c3:	31 d2                	xor    %edx,%edx
400012c5:	f7 f7                	div    %edi
400012c7:	89 c1                	mov    %eax,%ecx
400012c9:	89 d8                	mov    %ebx,%eax
400012cb:	31 d2                	xor    %edx,%edx
400012cd:	f7 f1                	div    %ecx
400012cf:	89 f0                	mov    %esi,%eax
400012d1:	f7 f1                	div    %ecx
400012d3:	89 d0                	mov    %edx,%eax
400012d5:	31 d2                	xor    %edx,%edx
400012d7:	eb 94                	jmp    4000126d <__umoddi3+0x2d>
400012d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400012e0:	89 e9                	mov    %ebp,%ecx
400012e2:	ba 20 00 00 00       	mov    $0x20,%edx
400012e7:	29 ea                	sub    %ebp,%edx
400012e9:	d3 e0                	shl    %cl,%eax
400012eb:	89 44 24 08          	mov    %eax,0x8(%esp)
400012ef:	89 d1                	mov    %edx,%ecx
400012f1:	89 f8                	mov    %edi,%eax
400012f3:	d3 e8                	shr    %cl,%eax
400012f5:	89 54 24 04          	mov    %edx,0x4(%esp)
400012f9:	8b 54 24 04          	mov    0x4(%esp),%edx
400012fd:	89 c1                	mov    %eax,%ecx
400012ff:	8b 44 24 08          	mov    0x8(%esp),%eax
40001303:	09 c1                	or     %eax,%ecx
40001305:	89 d8                	mov    %ebx,%eax
40001307:	89 4c 24 08          	mov    %ecx,0x8(%esp)
4000130b:	89 e9                	mov    %ebp,%ecx
4000130d:	d3 e7                	shl    %cl,%edi
4000130f:	89 d1                	mov    %edx,%ecx
40001311:	d3 e8                	shr    %cl,%eax
40001313:	89 e9                	mov    %ebp,%ecx
40001315:	89 7c 24 0c          	mov    %edi,0xc(%esp)
40001319:	d3 e3                	shl    %cl,%ebx
4000131b:	89 c7                	mov    %eax,%edi
4000131d:	89 d1                	mov    %edx,%ecx
4000131f:	89 f0                	mov    %esi,%eax
40001321:	d3 e8                	shr    %cl,%eax
40001323:	89 fa                	mov    %edi,%edx
40001325:	89 e9                	mov    %ebp,%ecx
40001327:	09 d8                	or     %ebx,%eax
40001329:	d3 e6                	shl    %cl,%esi
4000132b:	f7 74 24 08          	divl   0x8(%esp)
4000132f:	89 d3                	mov    %edx,%ebx
40001331:	f7 64 24 0c          	mull   0xc(%esp)
40001335:	89 c7                	mov    %eax,%edi
40001337:	89 d1                	mov    %edx,%ecx
40001339:	39 d3                	cmp    %edx,%ebx
4000133b:	72 06                	jb     40001343 <__umoddi3+0x103>
4000133d:	75 10                	jne    4000134f <__umoddi3+0x10f>
4000133f:	39 c6                	cmp    %eax,%esi
40001341:	73 0c                	jae    4000134f <__umoddi3+0x10f>
40001343:	2b 44 24 0c          	sub    0xc(%esp),%eax
40001347:	1b 54 24 08          	sbb    0x8(%esp),%edx
4000134b:	89 d1                	mov    %edx,%ecx
4000134d:	89 c7                	mov    %eax,%edi
4000134f:	89 f2                	mov    %esi,%edx
40001351:	29 fa                	sub    %edi,%edx
40001353:	19 cb                	sbb    %ecx,%ebx
40001355:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
4000135a:	89 d8                	mov    %ebx,%eax
4000135c:	d3 e0                	shl    %cl,%eax
4000135e:	89 e9                	mov    %ebp,%ecx
40001360:	d3 ea                	shr    %cl,%edx
40001362:	d3 eb                	shr    %cl,%ebx
40001364:	09 d0                	or     %edx,%eax
40001366:	89 da                	mov    %ebx,%edx
40001368:	83 c4 1c             	add    $0x1c,%esp
4000136b:	5b                   	pop    %ebx
4000136c:	5e                   	pop    %esi
4000136d:	5f                   	pop    %edi
4000136e:	5d                   	pop    %ebp
4000136f:	c3                   	ret
40001370:	89 da                	mov    %ebx,%edx
40001372:	89 f1                	mov    %esi,%ecx
40001374:	29 f9                	sub    %edi,%ecx
40001376:	19 c2                	sbb    %eax,%edx
40001378:	89 c8                	mov    %ecx,%eax
4000137a:	e9 2b ff ff ff       	jmp    400012aa <__umoddi3+0x6a>
