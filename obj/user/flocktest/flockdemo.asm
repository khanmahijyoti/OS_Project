
obj/user/flocktest/flockdemo:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:
#define exit(...) return __VA_ARGS__

char buf[8192];

int main(int arc, char *argv[])
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	57                   	push   %edi
4000000e:	56                   	push   %esi
4000000f:	53                   	push   %ebx
40000010:	e8 62 02 00 00       	call   40000277 <__x86.get_pc_thunk.bx>
40000015:	81 c3 df 3f 00 00    	add    $0x3fdf,%ebx
4000001b:	51                   	push   %ecx
4000001c:	83 ec 24             	sub    $0x24,%esp
    int fd, reader_pid, writer_pid;

    printf("=====flockdemo starting=====\n");
4000001f:	8d 83 48 e0 ff ff    	lea    -0x1fb8(%ebx),%eax
40000025:	89 5d dc             	mov    %ebx,-0x24(%ebp)

static gcc_inline int sys_open(char *path, int omode)
{
    int errno;
    int fd;
    int len = strlen(path) + 1;
40000028:	8d bb 66 e0 ff ff    	lea    -0x1f9a(%ebx),%edi
4000002e:	50                   	push   %eax
4000002f:	e8 ac 03 00 00       	call   400003e0 <printf>
40000034:	89 3c 24             	mov    %edi,(%esp)
40000037:	e8 04 0c 00 00       	call   40000c40 <strlen>

    asm volatile ("int %2"
4000003c:	b9 02 02 00 00       	mov    $0x202,%ecx
40000041:	89 fb                	mov    %edi,%ebx
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

    // /* Begin by creating a file and writing some content to it */
    if ((fd = open("flockfile", O_CREATE | O_RDWR)) < 0) {
40000050:	85 c0                	test   %eax,%eax
40000052:	0f 85 a7 00 00 00    	jne    400000ff <main+0xff>
40000058:	89 df                	mov    %ebx,%edi
4000005a:	85 db                	test   %ebx,%ebx
4000005c:	0f 88 9d 00 00 00    	js     400000ff <main+0xff>

static gcc_inline int sys_flock(int fd, int op)
{
    int errno, ret;

    asm volatile ("int %2"
40000062:	b8 0d 00 00 00       	mov    $0xd,%eax
40000067:	b9 02 00 00 00       	mov    $0x2,%ecx
4000006c:	cd 30                	int    $0x30
4000006e:	89 c6                	mov    %eax,%esi
                    "a" (SYS_flock),
                    "b" (fd),
                    "c" (op)
                  : "cc", "memory");

    return errno ? -1 : 0;; // errno ? -1 : 0; 
40000070:	85 c0                	test   %eax,%eax
40000072:	0f 85 f0 00 00 00    	jne    40000168 <main+0x168>
40000078:	8b 45 dc             	mov    -0x24(%ebp),%eax
4000007b:	8d 90 70 e0 ff ff    	lea    -0x1f90(%eax),%edx
    asm volatile ("int %2"
40000081:	8d 80 7b e0 ff ff    	lea    -0x1f85(%eax),%eax
40000087:	89 55 e4             	mov    %edx,-0x1c(%ebp)
4000008a:	89 45 e0             	mov    %eax,-0x20(%ebp)
4000008d:	eb 22                	jmp    400000b1 <main+0xb1>
4000008f:	90                   	nop
        close(fd);
        exit();
    }

    for (int i = 0; i < 100; i++) {
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40000090:	85 c0                	test   %eax,%eax
40000092:	75 33                	jne    400000c7 <main+0xc7>
40000094:	8b 4d e0             	mov    -0x20(%ebp),%ecx
40000097:	b8 07 00 00 00       	mov    $0x7,%eax
4000009c:	89 fb                	mov    %edi,%ebx
4000009e:	cd 30                	int    $0x30
            printf("error: write aa %d new file failed\n", i);
            exit();
        }
        if (write(fd, "bbbbbbbbbb", 10) != 10) {
400000a0:	83 fb 0a             	cmp    $0xa,%ebx
400000a3:	75 43                	jne    400000e8 <main+0xe8>
400000a5:	85 c0                	test   %eax,%eax
400000a7:	75 3f                	jne    400000e8 <main+0xe8>
    for (int i = 0; i < 100; i++) {
400000a9:	83 c6 01             	add    $0x1,%esi
400000ac:	83 fe 64             	cmp    $0x64,%esi
400000af:	74 65                	je     40000116 <main+0x116>
400000b1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
400000b4:	ba 0a 00 00 00       	mov    $0xa,%edx
400000b9:	b8 07 00 00 00       	mov    $0x7,%eax
400000be:	89 fb                	mov    %edi,%ebx
400000c0:	cd 30                	int    $0x30
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
400000c2:	83 fb 0a             	cmp    $0xa,%ebx
400000c5:	74 c9                	je     40000090 <main+0x90>
            printf("error: write aa %d new file failed\n", i);
400000c7:	57                   	push   %edi
400000c8:	57                   	push   %edi
400000c9:	56                   	push   %esi
400000ca:	8b 5d dc             	mov    -0x24(%ebp),%ebx
400000cd:	8d 83 4c e2 ff ff    	lea    -0x1db4(%ebx),%eax
400000d3:	50                   	push   %eax
400000d4:	e8 07 03 00 00       	call   400003e0 <printf>
            exit();
400000d9:	83 c4 10             	add    $0x10,%esp
    writer_pid = spawn(9, 250);
    reader_pid = spawn(8, 250);

    printf("=====flockdemo finished=====\n");
    return 0;
400000dc:	8d 65 f0             	lea    -0x10(%ebp),%esp
400000df:	59                   	pop    %ecx
400000e0:	5b                   	pop    %ebx
400000e1:	5e                   	pop    %esi
400000e2:	5f                   	pop    %edi
400000e3:	5d                   	pop    %ebp
400000e4:	8d 61 fc             	lea    -0x4(%ecx),%esp
400000e7:	c3                   	ret
            printf("error: write bb %d new file failed\n", i);
400000e8:	53                   	push   %ebx
400000e9:	53                   	push   %ebx
400000ea:	56                   	push   %esi
400000eb:	8b 5d dc             	mov    -0x24(%ebp),%ebx
400000ee:	8d 83 70 e2 ff ff    	lea    -0x1d90(%ebx),%eax
400000f4:	50                   	push   %eax
400000f5:	e8 e6 02 00 00       	call   400003e0 <printf>
            exit();
400000fa:	83 c4 10             	add    $0x10,%esp
400000fd:	eb dd                	jmp    400000dc <main+0xdc>
        printf("Error: create flockfile failed!\n");
400000ff:	8b 5d dc             	mov    -0x24(%ebp),%ebx
40000102:	83 ec 0c             	sub    $0xc,%esp
40000105:	8d 83 fc e1 ff ff    	lea    -0x1e04(%ebx),%eax
4000010b:	50                   	push   %eax
4000010c:	e8 cf 02 00 00       	call   400003e0 <printf>
        exit();
40000111:	83 c4 10             	add    $0x10,%esp
40000114:	eb c6                	jmp    400000dc <main+0xdc>
    asm volatile ("int %2"
40000116:	b8 0d 00 00 00       	mov    $0xd,%eax
4000011b:	b9 04 00 00 00       	mov    $0x4,%ecx
40000120:	89 fb                	mov    %edi,%ebx
40000122:	cd 30                	int    $0x30
    return errno ? -1 : 0;; // errno ? -1 : 0; 
40000124:	85 c0                	test   %eax,%eax
40000126:	75 63                	jne    4000018b <main+0x18b>
    asm volatile ("int %2"
40000128:	b8 05 00 00 00       	mov    $0x5,%eax
4000012d:	89 fb                	mov    %edi,%ebx
4000012f:	cd 30                	int    $0x30
    writer_pid = spawn(9, 250);
40000131:	50                   	push   %eax
40000132:	50                   	push   %eax
40000133:	68 fa 00 00 00       	push   $0xfa
40000138:	6a 09                	push   $0x9
4000013a:	8b 5d dc             	mov    -0x24(%ebp),%ebx
4000013d:	e8 4e 0a 00 00       	call   40000b90 <spawn>
    reader_pid = spawn(8, 250);
40000142:	5a                   	pop    %edx
40000143:	59                   	pop    %ecx
40000144:	68 fa 00 00 00       	push   $0xfa
40000149:	6a 08                	push   $0x8
4000014b:	e8 40 0a 00 00       	call   40000b90 <spawn>
    printf("=====flockdemo finished=====\n");
40000150:	8d 83 86 e0 ff ff    	lea    -0x1f7a(%ebx),%eax
40000156:	89 04 24             	mov    %eax,(%esp)
40000159:	e8 82 02 00 00       	call   400003e0 <printf>
4000015e:	31 c0                	xor    %eax,%eax
40000160:	83 c4 10             	add    $0x10,%esp
40000163:	e9 74 ff ff ff       	jmp    400000dc <main+0xdc>
        printf("ERROR: could not obtain an exclusive lock\n");
40000168:	8b 5d dc             	mov    -0x24(%ebp),%ebx
4000016b:	83 ec 0c             	sub    $0xc,%esp
4000016e:	8d 83 20 e2 ff ff    	lea    -0x1de0(%ebx),%eax
        printf("ERROR in flocktest_test_downgrade: release shared flock failed!\n");
40000174:	50                   	push   %eax
40000175:	e8 66 02 00 00       	call   400003e0 <printf>
4000017a:	b8 05 00 00 00       	mov    $0x5,%eax
4000017f:	89 fb                	mov    %edi,%ebx
40000181:	cd 30                	int    $0x30
        exit();
40000183:	83 c4 10             	add    $0x10,%esp
40000186:	e9 51 ff ff ff       	jmp    400000dc <main+0xdc>
        printf("ERROR in flocktest_test_downgrade: release shared flock failed!\n");
4000018b:	8b 5d dc             	mov    -0x24(%ebp),%ebx
4000018e:	83 ec 0c             	sub    $0xc,%esp
40000191:	8d 83 94 e2 ff ff    	lea    -0x1d6c(%ebx),%eax
40000197:	eb db                	jmp    40000174 <main+0x174>

40000199 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
40000199:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
4000019f:	75 04                	jne    400001a5 <args_exist>

400001a1 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
400001a1:	6a 00                	push   $0x0
	pushl	$0
400001a3:	6a 00                	push   $0x0

400001a5 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
400001a5:	e8 56 fe ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
400001aa:	50                   	push   %eax

400001ab <spin>:
spin:
	jmp	spin
400001ab:	eb fe                	jmp    400001ab <spin>
400001ad:	66 90                	xchg   %ax,%ax
400001af:	90                   	nop

400001b0 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
400001b0:	53                   	push   %ebx
400001b1:	e8 c1 00 00 00       	call   40000277 <__x86.get_pc_thunk.bx>
400001b6:	81 c3 3e 3e 00 00    	add    $0x3e3e,%ebx
400001bc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
400001bf:	ff 74 24 18          	push   0x18(%esp)
400001c3:	ff 74 24 18          	push   0x18(%esp)
400001c7:	8d 83 0c e0 ff ff    	lea    -0x1ff4(%ebx),%eax
400001cd:	50                   	push   %eax
400001ce:	e8 0d 02 00 00       	call   400003e0 <printf>
    vcprintf(fmt, ap);
400001d3:	58                   	pop    %eax
400001d4:	5a                   	pop    %edx
400001d5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001d9:	50                   	push   %eax
400001da:	ff 74 24 24          	push   0x24(%esp)
400001de:	e8 9d 01 00 00       	call   40000380 <vcprintf>
    va_end(ap);
}
400001e3:	83 c4 18             	add    $0x18,%esp
400001e6:	5b                   	pop    %ebx
400001e7:	c3                   	ret
400001e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001ef:	00 

400001f0 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
400001f0:	53                   	push   %ebx
400001f1:	e8 81 00 00 00       	call   40000277 <__x86.get_pc_thunk.bx>
400001f6:	81 c3 fe 3d 00 00    	add    $0x3dfe,%ebx
400001fc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
400001ff:	ff 74 24 18          	push   0x18(%esp)
40000203:	ff 74 24 18          	push   0x18(%esp)
40000207:	8d 83 18 e0 ff ff    	lea    -0x1fe8(%ebx),%eax
4000020d:	50                   	push   %eax
4000020e:	e8 cd 01 00 00       	call   400003e0 <printf>
    vcprintf(fmt, ap);
40000213:	58                   	pop    %eax
40000214:	5a                   	pop    %edx
40000215:	8d 44 24 24          	lea    0x24(%esp),%eax
40000219:	50                   	push   %eax
4000021a:	ff 74 24 24          	push   0x24(%esp)
4000021e:	e8 5d 01 00 00       	call   40000380 <vcprintf>
    va_end(ap);
}
40000223:	83 c4 18             	add    $0x18,%esp
40000226:	5b                   	pop    %ebx
40000227:	c3                   	ret
40000228:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000022f:	00 

40000230 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000230:	53                   	push   %ebx
40000231:	e8 41 00 00 00       	call   40000277 <__x86.get_pc_thunk.bx>
40000236:	81 c3 be 3d 00 00    	add    $0x3dbe,%ebx
4000023c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000023f:	ff 74 24 18          	push   0x18(%esp)
40000243:	ff 74 24 18          	push   0x18(%esp)
40000247:	8d 83 24 e0 ff ff    	lea    -0x1fdc(%ebx),%eax
4000024d:	50                   	push   %eax
4000024e:	e8 8d 01 00 00       	call   400003e0 <printf>
    vcprintf(fmt, ap);
40000253:	58                   	pop    %eax
40000254:	5a                   	pop    %edx
40000255:	8d 44 24 24          	lea    0x24(%esp),%eax
40000259:	50                   	push   %eax
4000025a:	ff 74 24 24          	push   0x24(%esp)
4000025e:	e8 1d 01 00 00       	call   40000380 <vcprintf>
40000263:	83 c4 10             	add    $0x10,%esp
40000266:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000026d:	00 
4000026e:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
40000270:	e8 3b 09 00 00       	call   40000bb0 <yield>
    while (1)
40000275:	eb f9                	jmp    40000270 <panic+0x40>

40000277 <__x86.get_pc_thunk.bx>:
40000277:	8b 1c 24             	mov    (%esp),%ebx
4000027a:	c3                   	ret
4000027b:	66 90                	xchg   %ax,%ax
4000027d:	66 90                	xchg   %ax,%ax
4000027f:	90                   	nop

40000280 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
40000280:	55                   	push   %ebp
40000281:	57                   	push   %edi
40000282:	56                   	push   %esi
40000283:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
40000284:	8b 44 24 14          	mov    0x14(%esp),%eax
40000288:	0f b6 00             	movzbl (%eax),%eax
4000028b:	3c 2b                	cmp    $0x2b,%al
4000028d:	0f 84 8d 00 00 00    	je     40000320 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
40000293:	3c 2d                	cmp    $0x2d,%al
40000295:	74 59                	je     400002f0 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000297:	8d 50 d0             	lea    -0x30(%eax),%edx
4000029a:	80 fa 09             	cmp    $0x9,%dl
4000029d:	77 71                	ja     40000310 <atoi+0x90>
    int negative = 0;
4000029f:	31 ff                	xor    %edi,%edi
    int loc = 0;
400002a1:	31 f6                	xor    %esi,%esi
        loc++;
400002a3:	89 f2                	mov    %esi,%edx
    int acc = 0;
400002a5:	31 c9                	xor    %ecx,%ecx
400002a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400002ae:	00 
400002af:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
400002b0:	83 e8 30             	sub    $0x30,%eax
400002b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
400002b6:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
400002b9:	0f be c0             	movsbl %al,%eax
400002bc:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002bf:	8b 44 24 14          	mov    0x14(%esp),%eax
400002c3:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
400002c7:	8d 68 d0             	lea    -0x30(%eax),%ebp
400002ca:	89 eb                	mov    %ebp,%ebx
400002cc:	80 fb 09             	cmp    $0x9,%bl
400002cf:	76 df                	jbe    400002b0 <atoi+0x30>
    }
    if (numstart == loc) {
400002d1:	39 f2                	cmp    %esi,%edx
400002d3:	74 3b                	je     40000310 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
400002d5:	89 c8                	mov    %ecx,%eax
400002d7:	f7 d8                	neg    %eax
400002d9:	85 ff                	test   %edi,%edi
400002db:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
400002de:	8b 44 24 18          	mov    0x18(%esp),%eax
400002e2:	89 08                	mov    %ecx,(%eax)
    return loc;
}
400002e4:	89 d0                	mov    %edx,%eax
400002e6:	5b                   	pop    %ebx
400002e7:	5e                   	pop    %esi
400002e8:	5f                   	pop    %edi
400002e9:	5d                   	pop    %ebp
400002ea:	c3                   	ret
400002eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002f0:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
400002f4:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
400002f9:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400002fe:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000302:	8d 50 d0             	lea    -0x30(%eax),%edx
40000305:	80 fa 09             	cmp    $0x9,%dl
40000308:	76 99                	jbe    400002a3 <atoi+0x23>
4000030a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000310:	31 d2                	xor    %edx,%edx
}
40000312:	5b                   	pop    %ebx
40000313:	89 d0                	mov    %edx,%eax
40000315:	5e                   	pop    %esi
40000316:	5f                   	pop    %edi
40000317:	5d                   	pop    %ebp
40000318:	c3                   	ret
40000319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000320:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000324:	31 ff                	xor    %edi,%edi
        loc++;
40000326:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000032b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000032f:	8d 50 d0             	lea    -0x30(%eax),%edx
40000332:	80 fa 09             	cmp    $0x9,%dl
40000335:	0f 86 68 ff ff ff    	jbe    400002a3 <atoi+0x23>
        return 0;
4000033b:	31 d2                	xor    %edx,%edx
4000033d:	eb d3                	jmp    40000312 <atoi+0x92>
4000033f:	90                   	nop

40000340 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
40000340:	53                   	push   %ebx
40000341:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000345:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000034a:	8b 02                	mov    (%edx),%eax
4000034c:	8d 48 01             	lea    0x1(%eax),%ecx
4000034f:	89 0a                	mov    %ecx,(%edx)
40000351:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000355:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
4000035b:	75 14                	jne    40000371 <putch+0x31>
        b->buf[b->idx] = 0;
4000035d:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
40000364:	8d 5a 08             	lea    0x8(%edx),%ebx
    asm volatile ("int %0"
40000367:	31 c0                	xor    %eax,%eax
40000369:	cd 30                	int    $0x30
        b->idx = 0;
4000036b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
40000371:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
40000375:	5b                   	pop    %ebx
40000376:	c3                   	ret
40000377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000037e:	00 
4000037f:	90                   	nop

40000380 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
40000380:	53                   	push   %ebx
40000381:	e8 f1 fe ff ff       	call   40000277 <__x86.get_pc_thunk.bx>
40000386:	81 c3 6e 3c 00 00    	add    $0x3c6e,%ebx
4000038c:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
40000392:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000399:	00 
    b.cnt = 0;
4000039a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400003a1:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
400003a2:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400003a9:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400003b0:	8d 44 24 10          	lea    0x10(%esp),%eax
400003b4:	50                   	push   %eax
400003b5:	8d 83 4c c3 ff ff    	lea    -0x3cb4(%ebx),%eax
400003bb:	50                   	push   %eax
400003bc:	e8 3f 01 00 00       	call   40000500 <vprintfmt>

    b.buf[b.idx] = 0;
400003c1:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400003c5:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400003c9:	31 c0                	xor    %eax,%eax
400003cb:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400003d0:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
400003d2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400003d6:	81 c4 28 02 00 00    	add    $0x228,%esp
400003dc:	5b                   	pop    %ebx
400003dd:	c3                   	ret
400003de:	66 90                	xchg   %ax,%ax

400003e0 <printf>:

int printf(const char *fmt, ...)
{
400003e0:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
400003e3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400003e7:	50                   	push   %eax
400003e8:	ff 74 24 1c          	push   0x1c(%esp)
400003ec:	e8 8f ff ff ff       	call   40000380 <vcprintf>
    va_end(ap);

    return cnt;
}
400003f1:	83 c4 1c             	add    $0x1c,%esp
400003f4:	c3                   	ret
400003f5:	66 90                	xchg   %ax,%ax
400003f7:	66 90                	xchg   %ax,%ax
400003f9:	66 90                	xchg   %ax,%ax
400003fb:	66 90                	xchg   %ax,%ax
400003fd:	66 90                	xchg   %ax,%ax
400003ff:	90                   	nop

40000400 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000400:	e8 86 07 00 00       	call   40000b8b <__x86.get_pc_thunk.cx>
40000405:	81 c1 ef 3b 00 00    	add    $0x3bef,%ecx
{
4000040b:	55                   	push   %ebp
4000040c:	57                   	push   %edi
4000040d:	89 d7                	mov    %edx,%edi
4000040f:	56                   	push   %esi
40000410:	89 c6                	mov    %eax,%esi
40000412:	53                   	push   %ebx
40000413:	83 ec 2c             	sub    $0x2c,%esp
40000416:	8b 44 24 40          	mov    0x40(%esp),%eax
4000041a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000041e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000422:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000429:	00 
{
4000042a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000042e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000432:	8b 44 24 48          	mov    0x48(%esp),%eax
40000436:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000043a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000043e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000442:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000446:	89 44 24 10          	mov    %eax,0x10(%esp)
4000044a:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
4000044e:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
40000451:	73 55                	jae    400004a8 <printnum+0xa8>
        while (--width > 0)
40000453:	83 fa 01             	cmp    $0x1,%edx
40000456:	7e 17                	jle    4000046f <printnum+0x6f>
40000458:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000045f:	00 
            putch(padc, putdat);
40000460:	83 ec 08             	sub    $0x8,%esp
40000463:	57                   	push   %edi
40000464:	55                   	push   %ebp
40000465:	ff d6                	call   *%esi
        while (--width > 0)
40000467:	83 c4 10             	add    $0x10,%esp
4000046a:	83 eb 01             	sub    $0x1,%ebx
4000046d:	75 f1                	jne    40000460 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
4000046f:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000473:	ff 74 24 14          	push   0x14(%esp)
40000477:	ff 74 24 14          	push   0x14(%esp)
4000047b:	ff 74 24 14          	push   0x14(%esp)
4000047f:	ff 74 24 14          	push   0x14(%esp)
40000483:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
40000487:	e8 a4 0d 00 00       	call   40001230 <__umoddi3>
4000048c:	0f be 84 03 30 e0 ff 	movsbl -0x1fd0(%ebx,%eax,1),%eax
40000493:	ff 
40000494:	89 44 24 50          	mov    %eax,0x50(%esp)
}
40000498:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
4000049b:	89 f0                	mov    %esi,%eax
}
4000049d:	5b                   	pop    %ebx
4000049e:	5e                   	pop    %esi
4000049f:	5f                   	pop    %edi
400004a0:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
400004a1:	ff e0                	jmp    *%eax
400004a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
400004a8:	83 ec 0c             	sub    $0xc,%esp
400004ab:	55                   	push   %ebp
400004ac:	53                   	push   %ebx
400004ad:	50                   	push   %eax
400004ae:	83 ec 08             	sub    $0x8,%esp
400004b1:	ff 74 24 34          	push   0x34(%esp)
400004b5:	ff 74 24 34          	push   0x34(%esp)
400004b9:	ff 74 24 34          	push   0x34(%esp)
400004bd:	ff 74 24 34          	push   0x34(%esp)
400004c1:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400004c5:	e8 46 0c 00 00       	call   40001110 <__udivdi3>
400004ca:	83 c4 18             	add    $0x18,%esp
400004cd:	52                   	push   %edx
400004ce:	89 fa                	mov    %edi,%edx
400004d0:	50                   	push   %eax
400004d1:	89 f0                	mov    %esi,%eax
400004d3:	e8 28 ff ff ff       	call   40000400 <printnum>
400004d8:	83 c4 20             	add    $0x20,%esp
400004db:	eb 92                	jmp    4000046f <printnum+0x6f>
400004dd:	8d 76 00             	lea    0x0(%esi),%esi

400004e0 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
400004e0:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
400004e4:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
400004e8:	8b 10                	mov    (%eax),%edx
400004ea:	3b 50 04             	cmp    0x4(%eax),%edx
400004ed:	73 0b                	jae    400004fa <sprintputch+0x1a>
        *b->buf++ = ch;
400004ef:	8d 4a 01             	lea    0x1(%edx),%ecx
400004f2:	89 08                	mov    %ecx,(%eax)
400004f4:	8b 44 24 04          	mov    0x4(%esp),%eax
400004f8:	88 02                	mov    %al,(%edx)
}
400004fa:	c3                   	ret
400004fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000500 <vprintfmt>:
{
40000500:	e8 7e 06 00 00       	call   40000b83 <__x86.get_pc_thunk.ax>
40000505:	05 ef 3a 00 00       	add    $0x3aef,%eax
4000050a:	55                   	push   %ebp
4000050b:	57                   	push   %edi
4000050c:	56                   	push   %esi
4000050d:	53                   	push   %ebx
4000050e:	83 ec 2c             	sub    $0x2c,%esp
40000511:	8b 74 24 40          	mov    0x40(%esp),%esi
40000515:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000519:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000051d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000521:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000525:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000528:	83 f8 25             	cmp    $0x25,%eax
4000052b:	75 19                	jne    40000546 <vprintfmt+0x46>
4000052d:	eb 29                	jmp    40000558 <vprintfmt+0x58>
4000052f:	90                   	nop
            putch(ch, putdat);
40000530:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000533:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000536:	57                   	push   %edi
40000537:	50                   	push   %eax
40000538:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000053a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000053e:	83 c4 10             	add    $0x10,%esp
40000541:	83 f8 25             	cmp    $0x25,%eax
40000544:	74 12                	je     40000558 <vprintfmt+0x58>
            if (ch == '\0')
40000546:	85 c0                	test   %eax,%eax
40000548:	75 e6                	jne    40000530 <vprintfmt+0x30>
}
4000054a:	83 c4 2c             	add    $0x2c,%esp
4000054d:	5b                   	pop    %ebx
4000054e:	5e                   	pop    %esi
4000054f:	5f                   	pop    %edi
40000550:	5d                   	pop    %ebp
40000551:	c3                   	ret
40000552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
40000558:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
4000055d:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
40000562:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
40000569:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000570:	ff 
        lflag = 0;
40000571:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
40000578:	00 
40000579:	89 54 24 14          	mov    %edx,0x14(%esp)
4000057d:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000581:	0f b6 0b             	movzbl (%ebx),%ecx
40000584:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000587:	8d 41 dd             	lea    -0x23(%ecx),%eax
4000058a:	3c 55                	cmp    $0x55,%al
4000058c:	77 12                	ja     400005a0 <.L21>
4000058e:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000592:	0f b6 c0             	movzbl %al,%eax
40000595:	8b b4 82 a4 e0 ff ff 	mov    -0x1f5c(%edx,%eax,4),%esi
4000059c:	01 d6                	add    %edx,%esi
4000059e:	ff e6                	jmp    *%esi

400005a0 <.L21>:
            putch('%', putdat);
400005a0:	8b 74 24 40          	mov    0x40(%esp),%esi
400005a4:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
400005a7:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
400005a9:	57                   	push   %edi
400005aa:	6a 25                	push   $0x25
400005ac:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
400005ae:	83 c4 10             	add    $0x10,%esp
400005b1:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
400005b5:	0f 84 66 ff ff ff    	je     40000521 <vprintfmt+0x21>
400005bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400005c0:	83 ed 01             	sub    $0x1,%ebp
400005c3:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400005c7:	75 f7                	jne    400005c0 <.L21+0x20>
400005c9:	e9 53 ff ff ff       	jmp    40000521 <vprintfmt+0x21>
400005ce:	66 90                	xchg   %ax,%ax

400005d0 <.L31>:
                ch = *fmt;
400005d0:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
400005d4:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
400005d7:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
400005d9:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
400005dd:	8d 48 d0             	lea    -0x30(%eax),%ecx
400005e0:	83 f9 09             	cmp    $0x9,%ecx
400005e3:	77 28                	ja     4000060d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
400005e5:	8b 74 24 40          	mov    0x40(%esp),%esi
400005e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
400005f0:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
400005f3:	8d 14 92             	lea    (%edx,%edx,4),%edx
400005f6:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
400005fa:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
400005fd:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000600:	83 f9 09             	cmp    $0x9,%ecx
40000603:	76 eb                	jbe    400005f0 <.L31+0x20>
40000605:	89 54 24 14          	mov    %edx,0x14(%esp)
40000609:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000060d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000611:	85 f6                	test   %esi,%esi
40000613:	0f 89 68 ff ff ff    	jns    40000581 <vprintfmt+0x81>
                width = precision, precision = -1;
40000619:	8b 44 24 14          	mov    0x14(%esp),%eax
4000061d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000624:	ff 
40000625:	89 44 24 08          	mov    %eax,0x8(%esp)
40000629:	e9 53 ff ff ff       	jmp    40000581 <vprintfmt+0x81>

4000062e <.L35>:
            altflag = 1;
4000062e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000635:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000637:	e9 45 ff ff ff       	jmp    40000581 <vprintfmt+0x81>

4000063c <.L34>:
            putch(ch, putdat);
4000063c:	8b 74 24 40          	mov    0x40(%esp),%esi
40000640:	83 ec 08             	sub    $0x8,%esp
40000643:	57                   	push   %edi
40000644:	6a 25                	push   $0x25
40000646:	ff d6                	call   *%esi
            break;
40000648:	83 c4 10             	add    $0x10,%esp
4000064b:	e9 d1 fe ff ff       	jmp    40000521 <vprintfmt+0x21>

40000650 <.L33>:
            precision = va_arg(ap, int);
40000650:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
40000654:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
40000656:	8b 00                	mov    (%eax),%eax
40000658:	89 44 24 14          	mov    %eax,0x14(%esp)
4000065c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000660:	83 c0 04             	add    $0x4,%eax
40000663:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
40000667:	eb a4                	jmp    4000060d <.L31+0x3d>

40000669 <.L32>:
            if (width < 0)
40000669:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000066d:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
4000066f:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000671:	85 c9                	test   %ecx,%ecx
40000673:	0f 49 c1             	cmovns %ecx,%eax
40000676:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
4000067a:	e9 02 ff ff ff       	jmp    40000581 <vprintfmt+0x81>

4000067f <.L30>:
            putch(va_arg(ap, int), putdat);
4000067f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000683:	8b 74 24 40          	mov    0x40(%esp),%esi
40000687:	83 ec 08             	sub    $0x8,%esp
4000068a:	57                   	push   %edi
4000068b:	8d 58 04             	lea    0x4(%eax),%ebx
4000068e:	8b 44 24 58          	mov    0x58(%esp),%eax
40000692:	ff 30                	push   (%eax)
40000694:	ff d6                	call   *%esi
40000696:	89 5c 24 5c          	mov    %ebx,0x5c(%esp)
            break;
4000069a:	83 c4 10             	add    $0x10,%esp
4000069d:	e9 7f fe ff ff       	jmp    40000521 <vprintfmt+0x21>

400006a2 <.L24>:
    if (lflag >= 2)
400006a2:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006a7:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400006ab:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006af:	0f 8f d8 01 00 00    	jg     4000088d <.L25+0xe0>
        return va_arg(*ap, unsigned long);
400006b5:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400006b9:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400006bc:	31 db                	xor    %ebx,%ebx
400006be:	ba 0a 00 00 00       	mov    $0xa,%edx
400006c3:	8b 09                	mov    (%ecx),%ecx
400006c5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400006c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
400006d0:	83 ec 0c             	sub    $0xc,%esp
400006d3:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
400006d8:	50                   	push   %eax
400006d9:	89 f0                	mov    %esi,%eax
400006db:	ff 74 24 18          	push   0x18(%esp)
400006df:	52                   	push   %edx
400006e0:	89 fa                	mov    %edi,%edx
400006e2:	53                   	push   %ebx
400006e3:	51                   	push   %ecx
400006e4:	e8 17 fd ff ff       	call   40000400 <printnum>
            break;
400006e9:	83 c4 20             	add    $0x20,%esp
400006ec:	e9 30 fe ff ff       	jmp    40000521 <vprintfmt+0x21>

400006f1 <.L26>:
            putch('0', putdat);
400006f1:	8b 74 24 40          	mov    0x40(%esp),%esi
400006f5:	83 ec 08             	sub    $0x8,%esp
400006f8:	57                   	push   %edi
400006f9:	6a 30                	push   $0x30
400006fb:	ff d6                	call   *%esi
            putch('x', putdat);
400006fd:	59                   	pop    %ecx
400006fe:	5b                   	pop    %ebx
400006ff:	57                   	push   %edi
40000700:	6a 78                	push   $0x78
            num = (unsigned long long)
40000702:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000704:	ff d6                	call   *%esi
            num = (unsigned long long)
40000706:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000070a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000070f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000711:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000714:	83 c0 04             	add    $0x4,%eax
40000717:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000071b:	eb b3                	jmp    400006d0 <.L24+0x2e>

4000071d <.L22>:
    if (lflag >= 2)
4000071d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000722:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000726:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000072a:	0f 8f 6e 01 00 00    	jg     4000089e <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000730:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000734:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000737:	31 db                	xor    %ebx,%ebx
40000739:	ba 10 00 00 00       	mov    $0x10,%edx
4000073e:	8b 09                	mov    (%ecx),%ecx
40000740:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000744:	eb 8a                	jmp    400006d0 <.L24+0x2e>

40000746 <.L29>:
    if (lflag >= 2)
40000746:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
4000074b:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
4000074f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
40000753:	0f 8f 5b 01 00 00    	jg     400008b4 <.L25+0x107>
        return va_arg(*ap, long);
40000759:	8b 00                	mov    (%eax),%eax
4000075b:	89 c3                	mov    %eax,%ebx
4000075d:	89 c1                	mov    %eax,%ecx
4000075f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000763:	c1 fb 1f             	sar    $0x1f,%ebx
40000766:	83 c0 04             	add    $0x4,%eax
40000769:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
4000076d:	85 db                	test   %ebx,%ebx
4000076f:	0f 88 68 01 00 00    	js     400008dd <.L19+0xc>
        return va_arg(*ap, unsigned long long);
40000775:	ba 0a 00 00 00       	mov    $0xa,%edx
4000077a:	e9 51 ff ff ff       	jmp    400006d0 <.L24+0x2e>

4000077f <.L28>:
            lflag++;
4000077f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000784:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000786:	e9 f6 fd ff ff       	jmp    40000581 <vprintfmt+0x81>

4000078b <.L27>:
            putch('X', putdat);
4000078b:	8b 74 24 40          	mov    0x40(%esp),%esi
4000078f:	83 ec 08             	sub    $0x8,%esp
40000792:	57                   	push   %edi
40000793:	6a 58                	push   $0x58
40000795:	ff d6                	call   *%esi
            putch('X', putdat);
40000797:	58                   	pop    %eax
40000798:	5a                   	pop    %edx
40000799:	57                   	push   %edi
4000079a:	6a 58                	push   $0x58
4000079c:	ff d6                	call   *%esi
            putch('X', putdat);
4000079e:	59                   	pop    %ecx
4000079f:	5b                   	pop    %ebx
400007a0:	57                   	push   %edi
400007a1:	6a 58                	push   $0x58
400007a3:	ff d6                	call   *%esi
            break;
400007a5:	83 c4 10             	add    $0x10,%esp
400007a8:	e9 74 fd ff ff       	jmp    40000521 <vprintfmt+0x21>

400007ad <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
400007ad:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
400007b1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
400007b5:	8b 54 24 14          	mov    0x14(%esp),%edx
400007b9:	8b 74 24 40          	mov    0x40(%esp),%esi
400007bd:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
400007c0:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
400007c5:	89 44 24 14          	mov    %eax,0x14(%esp)
400007c9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400007cd:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
400007cf:	0f 95 c0             	setne  %al
400007d2:	85 c9                	test   %ecx,%ecx
400007d4:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
400007d7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
400007db:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
400007dd:	85 db                	test   %ebx,%ebx
400007df:	0f 84 21 01 00 00    	je     40000906 <.L19+0x35>
            if (width > 0 && padc != '-')
400007e5:	84 c0                	test   %al,%al
400007e7:	0f 85 48 01 00 00    	jne    40000935 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
400007ed:	89 d8                	mov    %ebx,%eax
400007ef:	8d 5b 01             	lea    0x1(%ebx),%ebx
400007f2:	0f be 08             	movsbl (%eax),%ecx
400007f5:	89 c8                	mov    %ecx,%eax
400007f7:	85 c9                	test   %ecx,%ecx
400007f9:	74 64                	je     4000085f <.L25+0xb2>
400007fb:	89 74 24 40          	mov    %esi,0x40(%esp)
400007ff:	89 d6                	mov    %edx,%esi
40000801:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000805:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000809:	eb 2a                	jmp    40000835 <.L25+0x88>
4000080b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000810:	83 e8 20             	sub    $0x20,%eax
40000813:	83 f8 5e             	cmp    $0x5e,%eax
40000816:	76 2d                	jbe    40000845 <.L25+0x98>
                    putch('?', putdat);
40000818:	83 ec 08             	sub    $0x8,%esp
4000081b:	57                   	push   %edi
4000081c:	6a 3f                	push   $0x3f
4000081e:	ff 54 24 50          	call   *0x50(%esp)
40000822:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000825:	0f be 03             	movsbl (%ebx),%eax
40000828:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000082b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000082e:	0f be c8             	movsbl %al,%ecx
40000831:	85 c9                	test   %ecx,%ecx
40000833:	74 1e                	je     40000853 <.L25+0xa6>
40000835:	85 f6                	test   %esi,%esi
40000837:	78 05                	js     4000083e <.L25+0x91>
                                         || --precision >= 0); width--)
40000839:	83 ee 01             	sub    $0x1,%esi
4000083c:	72 15                	jb     40000853 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000083e:	8b 14 24             	mov    (%esp),%edx
40000841:	85 d2                	test   %edx,%edx
40000843:	75 cb                	jne    40000810 <.L25+0x63>
                    putch(ch, putdat);
40000845:	83 ec 08             	sub    $0x8,%esp
40000848:	57                   	push   %edi
40000849:	51                   	push   %ecx
4000084a:	ff 54 24 50          	call   *0x50(%esp)
4000084e:	83 c4 10             	add    $0x10,%esp
40000851:	eb d2                	jmp    40000825 <.L25+0x78>
40000853:	89 6c 24 08          	mov    %ebp,0x8(%esp)
40000857:	8b 74 24 40          	mov    0x40(%esp),%esi
4000085b:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
4000085f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000863:	85 c0                	test   %eax,%eax
40000865:	7e 19                	jle    40000880 <.L25+0xd3>
40000867:	89 c3                	mov    %eax,%ebx
40000869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
40000870:	83 ec 08             	sub    $0x8,%esp
40000873:	57                   	push   %edi
40000874:	6a 20                	push   $0x20
40000876:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000878:	83 c4 10             	add    $0x10,%esp
4000087b:	83 eb 01             	sub    $0x1,%ebx
4000087e:	75 f0                	jne    40000870 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
40000880:	8b 44 24 14          	mov    0x14(%esp),%eax
40000884:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000888:	e9 94 fc ff ff       	jmp    40000521 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
4000088d:	8b 08                	mov    (%eax),%ecx
4000088f:	8b 58 04             	mov    0x4(%eax),%ebx
40000892:	83 c0 08             	add    $0x8,%eax
40000895:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000899:	e9 d7 fe ff ff       	jmp    40000775 <.L29+0x2f>
4000089e:	8b 08                	mov    (%eax),%ecx
400008a0:	8b 58 04             	mov    0x4(%eax),%ebx
400008a3:	83 c0 08             	add    $0x8,%eax
400008a6:	ba 10 00 00 00       	mov    $0x10,%edx
400008ab:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008af:	e9 1c fe ff ff       	jmp    400006d0 <.L24+0x2e>
        return va_arg(*ap, long long);
400008b4:	8b 08                	mov    (%eax),%ecx
400008b6:	8b 58 04             	mov    0x4(%eax),%ebx
400008b9:	83 c0 08             	add    $0x8,%eax
400008bc:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400008c0:	e9 a8 fe ff ff       	jmp    4000076d <.L29+0x27>

400008c5 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
400008c5:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400008ca:	89 eb                	mov    %ebp,%ebx
400008cc:	e9 b0 fc ff ff       	jmp    40000581 <vprintfmt+0x81>

400008d1 <.L19>:
            padc = '-';
400008d1:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400008d6:	89 eb                	mov    %ebp,%ebx
400008d8:	e9 a4 fc ff ff       	jmp    40000581 <vprintfmt+0x81>
400008dd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
400008e1:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
400008e4:	31 db                	xor    %ebx,%ebx
400008e6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
400008ea:	57                   	push   %edi
400008eb:	6a 2d                	push   $0x2d
400008ed:	ff d6                	call   *%esi
                num = -(long long) num;
400008ef:	8b 4c 24 10          	mov    0x10(%esp),%ecx
400008f3:	ba 0a 00 00 00       	mov    $0xa,%edx
400008f8:	f7 d9                	neg    %ecx
400008fa:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
400008fe:	83 c4 10             	add    $0x10,%esp
40000901:	e9 ca fd ff ff       	jmp    400006d0 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000906:	84 c0                	test   %al,%al
40000908:	0f 85 99 00 00 00    	jne    400009a7 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000090e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000912:	89 74 24 40          	mov    %esi,0x40(%esp)
40000916:	b9 28 00 00 00       	mov    $0x28,%ecx
4000091b:	89 d6                	mov    %edx,%esi
4000091d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000921:	b8 28 00 00 00       	mov    $0x28,%eax
40000926:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000092a:	8d 9b 42 e0 ff ff    	lea    -0x1fbe(%ebx),%ebx
40000930:	e9 00 ff ff ff       	jmp    40000835 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000935:	83 ec 08             	sub    $0x8,%esp
40000938:	52                   	push   %edx
40000939:	89 54 24 28          	mov    %edx,0x28(%esp)
4000093d:	ff 74 24 24          	push   0x24(%esp)
40000941:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000945:	e8 26 03 00 00       	call   40000c70 <strnlen>
4000094a:	29 44 24 18          	sub    %eax,0x18(%esp)
4000094e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000952:	83 c4 10             	add    $0x10,%esp
40000955:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000959:	85 c9                	test   %ecx,%ecx
4000095b:	0f 8e 99 00 00 00    	jle    400009fa <.L19+0x129>
                    putch(padc, putdat);
40000961:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000966:	89 54 24 10          	mov    %edx,0x10(%esp)
4000096a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000096e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000972:	83 ec 08             	sub    $0x8,%esp
40000975:	57                   	push   %edi
40000976:	53                   	push   %ebx
40000977:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
40000979:	83 c4 10             	add    $0x10,%esp
4000097c:	83 ed 01             	sub    $0x1,%ebp
4000097f:	75 f1                	jne    40000972 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
40000981:	8b 44 24 18          	mov    0x18(%esp),%eax
40000985:	8b 54 24 10          	mov    0x10(%esp),%edx
40000989:	89 6c 24 08          	mov    %ebp,0x8(%esp)
4000098d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000991:	8d 58 01             	lea    0x1(%eax),%ebx
40000994:	0f be 00             	movsbl (%eax),%eax
40000997:	0f be c8             	movsbl %al,%ecx
4000099a:	85 c9                	test   %ecx,%ecx
4000099c:	0f 85 59 fe ff ff    	jne    400007fb <.L25+0x4e>
400009a2:	e9 d9 fe ff ff       	jmp    40000880 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
400009a7:	83 ec 08             	sub    $0x8,%esp
400009aa:	52                   	push   %edx
400009ab:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400009af:	8d 8b 41 e0 ff ff    	lea    -0x1fbf(%ebx),%ecx
400009b5:	89 54 24 28          	mov    %edx,0x28(%esp)
400009b9:	51                   	push   %ecx
400009ba:	89 4c 24 28          	mov    %ecx,0x28(%esp)
400009be:	e8 ad 02 00 00       	call   40000c70 <strnlen>
400009c3:	29 44 24 18          	sub    %eax,0x18(%esp)
400009c7:	8b 44 24 18          	mov    0x18(%esp),%eax
400009cb:	83 c4 10             	add    $0x10,%esp
400009ce:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400009d2:	85 c0                	test   %eax,%eax
400009d4:	7f 8b                	jg     40000961 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
400009d6:	b9 28 00 00 00       	mov    $0x28,%ecx
400009db:	b8 28 00 00 00       	mov    $0x28,%eax
400009e0:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400009e4:	89 74 24 40          	mov    %esi,0x40(%esp)
400009e8:	89 d6                	mov    %edx,%esi
400009ea:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400009ee:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400009f2:	83 c3 01             	add    $0x1,%ebx
400009f5:	e9 3b fe ff ff       	jmp    40000835 <.L25+0x88>
400009fa:	8b 44 24 18          	mov    0x18(%esp),%eax
400009fe:	0f be 08             	movsbl (%eax),%ecx
40000a01:	89 c8                	mov    %ecx,%eax
40000a03:	85 c9                	test   %ecx,%ecx
40000a05:	75 d9                	jne    400009e0 <.L19+0x10f>
40000a07:	e9 74 fe ff ff       	jmp    40000880 <.L25+0xd3>
40000a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000a10 <printfmt>:
{
40000a10:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000a13:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000a17:	50                   	push   %eax
40000a18:	ff 74 24 1c          	push   0x1c(%esp)
40000a1c:	ff 74 24 1c          	push   0x1c(%esp)
40000a20:	ff 74 24 1c          	push   0x1c(%esp)
40000a24:	e8 d7 fa ff ff       	call   40000500 <vprintfmt>
}
40000a29:	83 c4 1c             	add    $0x1c,%esp
40000a2c:	c3                   	ret
40000a2d:	8d 76 00             	lea    0x0(%esi),%esi

40000a30 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a30:	e8 4e 01 00 00       	call   40000b83 <__x86.get_pc_thunk.ax>
40000a35:	05 bf 35 00 00       	add    $0x35bf,%eax
{
40000a3a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a3d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a41:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a48:	ff 
40000a49:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a50:	00 
40000a51:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a55:	ff 74 24 28          	push   0x28(%esp)
40000a59:	ff 74 24 28          	push   0x28(%esp)
40000a5d:	8d 80 ec c4 ff ff    	lea    -0x3b14(%eax),%eax
40000a63:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a67:	52                   	push   %edx
40000a68:	50                   	push   %eax
40000a69:	e8 92 fa ff ff       	call   40000500 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a6e:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a72:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a75:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a79:	83 c4 2c             	add    $0x2c,%esp
40000a7c:	c3                   	ret
40000a7d:	8d 76 00             	lea    0x0(%esi),%esi

40000a80 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a80:	e8 fe 00 00 00       	call   40000b83 <__x86.get_pc_thunk.ax>
40000a85:	05 6f 35 00 00       	add    $0x356f,%eax
{
40000a8a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000a8d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a91:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a98:	ff 
40000a99:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000aa0:	00 
40000aa1:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000aa5:	8d 54 24 28          	lea    0x28(%esp),%edx
40000aa9:	52                   	push   %edx
40000aaa:	ff 74 24 28          	push   0x28(%esp)
40000aae:	8d 80 ec c4 ff ff    	lea    -0x3b14(%eax),%eax
40000ab4:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000ab8:	52                   	push   %edx
40000ab9:	50                   	push   %eax
40000aba:	e8 41 fa ff ff       	call   40000500 <vprintfmt>
    *b.buf = '\0';
40000abf:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ac3:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
40000ac6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000aca:	83 c4 2c             	add    $0x2c,%esp
40000acd:	c3                   	ret
40000ace:	66 90                	xchg   %ax,%ax

40000ad0 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000ad0:	e8 b2 00 00 00       	call   40000b87 <__x86.get_pc_thunk.dx>
40000ad5:	81 c2 1f 35 00 00    	add    $0x351f,%edx
{
40000adb:	83 ec 1c             	sub    $0x1c,%esp
40000ade:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000ae2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000ae6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000aed:	00 
40000aee:	89 44 24 04          	mov    %eax,0x4(%esp)
40000af2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000af6:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000afa:	ff 74 24 2c          	push   0x2c(%esp)
40000afe:	ff 74 24 2c          	push   0x2c(%esp)
40000b02:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b06:	50                   	push   %eax
40000b07:	8d 82 ec c4 ff ff    	lea    -0x3b14(%edx),%eax
40000b0d:	50                   	push   %eax
40000b0e:	e8 ed f9 ff ff       	call   40000500 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000b13:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b17:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000b1a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b1e:	83 c4 2c             	add    $0x2c,%esp
40000b21:	c3                   	ret
40000b22:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b29:	00 
40000b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000b30 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000b30:	e8 52 00 00 00       	call   40000b87 <__x86.get_pc_thunk.dx>
40000b35:	81 c2 bf 34 00 00    	add    $0x34bf,%edx
{
40000b3b:	83 ec 1c             	sub    $0x1c,%esp
40000b3e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000b42:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000b46:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000b4d:	00 
40000b4e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000b52:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000b56:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000b5a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000b5e:	50                   	push   %eax
40000b5f:	ff 74 24 2c          	push   0x2c(%esp)
40000b63:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000b67:	50                   	push   %eax
40000b68:	8d 82 ec c4 ff ff    	lea    -0x3b14(%edx),%eax
40000b6e:	50                   	push   %eax
40000b6f:	e8 8c f9 ff ff       	call   40000500 <vprintfmt>
    *b.buf = '\0';
40000b74:	8b 44 24 14          	mov    0x14(%esp),%eax
40000b78:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000b7b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000b7f:	83 c4 2c             	add    $0x2c,%esp
40000b82:	c3                   	ret

40000b83 <__x86.get_pc_thunk.ax>:
40000b83:	8b 04 24             	mov    (%esp),%eax
40000b86:	c3                   	ret

40000b87 <__x86.get_pc_thunk.dx>:
40000b87:	8b 14 24             	mov    (%esp),%edx
40000b8a:	c3                   	ret

40000b8b <__x86.get_pc_thunk.cx>:
40000b8b:	8b 0c 24             	mov    (%esp),%ecx
40000b8e:	c3                   	ret
40000b8f:	90                   	nop

40000b90 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000b90:	53                   	push   %ebx
    asm volatile ("int %2"
40000b91:	b8 02 00 00 00       	mov    $0x2,%eax
40000b96:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000b9a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000b9e:	cd 30                	int    $0x30
    return errno ? -1 : pid;
40000ba0:	85 c0                	test   %eax,%eax
40000ba2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000ba7:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000baa:	5b                   	pop    %ebx
40000bab:	c3                   	ret
40000bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000bb0 <yield>:
    asm volatile ("int %0"
40000bb0:	b8 03 00 00 00       	mov    $0x3,%eax
40000bb5:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000bb7:	c3                   	ret
40000bb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bbf:	00 

40000bc0 <produce>:

void produce(int item)
{
40000bc0:	53                   	push   %ebx
}

static gcc_inline void sys_produce(unsigned int item)
{
	int errno; 
    asm volatile ("int %1"
40000bc1:	b8 0e 00 00 00       	mov    $0xe,%eax
40000bc6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000bca:	cd 30                	int    $0x30
    sys_produce(item);
}
40000bcc:	5b                   	pop    %ebx
40000bcd:	c3                   	ret
40000bce:	66 90                	xchg   %ax,%ax

40000bd0 <consume>:

int consume(void)
{
40000bd0:	53                   	push   %ebx

static gcc_inline int sys_consume(void)
{
	int errno, item;

    asm volatile ("int %2"
40000bd1:	b8 0f 00 00 00       	mov    $0xf,%eax
40000bd6:	cd 30                	int    $0x30
    return sys_consume();
40000bd8:	89 d8                	mov    %ebx,%eax
40000bda:	5b                   	pop    %ebx
40000bdb:	c3                   	ret
40000bdc:	66 90                	xchg   %ax,%ax
40000bde:	66 90                	xchg   %ax,%ax

40000be0 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000be0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000be4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000bea:	c3                   	ret
40000beb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000bf0 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000bf0:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000bf4:	b8 01 00 00 00       	mov    $0x1,%eax
40000bf9:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000bfc:	85 c0                	test   %eax,%eax
40000bfe:	74 13                	je     40000c13 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000c00:	b9 01 00 00 00       	mov    $0x1,%ecx
40000c05:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000c08:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000c0a:	89 c8                	mov    %ecx,%eax
40000c0c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000c0f:	85 c0                	test   %eax,%eax
40000c11:	75 f5                	jne    40000c08 <spinlock_acquire+0x18>
}
40000c13:	c3                   	ret
40000c14:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c1b:	00 
40000c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000c20 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000c20:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000c24:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000c26:	84 c0                	test   %al,%al
40000c28:	74 05                	je     40000c2f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000c2a:	31 c0                	xor    %eax,%eax
40000c2c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000c2f:	c3                   	ret

40000c30 <spinlock_holding>:
    return *lk;
40000c30:	8b 44 24 04          	mov    0x4(%esp),%eax
40000c34:	8b 00                	mov    (%eax),%eax
}
40000c36:	c3                   	ret
40000c37:	66 90                	xchg   %ax,%ax
40000c39:	66 90                	xchg   %ax,%ax
40000c3b:	66 90                	xchg   %ax,%ax
40000c3d:	66 90                	xchg   %ax,%ax
40000c3f:	90                   	nop

40000c40 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000c40:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000c44:	31 c0                	xor    %eax,%eax
40000c46:	80 3a 00             	cmpb   $0x0,(%edx)
40000c49:	74 15                	je     40000c60 <strlen+0x20>
40000c4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000c50:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000c53:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000c57:	75 f7                	jne    40000c50 <strlen+0x10>
40000c59:	c3                   	ret
40000c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000c60:	c3                   	ret
40000c61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c68:	00 
40000c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c70 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000c70:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c74:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c78:	31 c0                	xor    %eax,%eax
40000c7a:	85 d2                	test   %edx,%edx
40000c7c:	75 09                	jne    40000c87 <strnlen+0x17>
40000c7e:	c3                   	ret
40000c7f:	90                   	nop
        n++;
40000c80:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000c83:	39 c2                	cmp    %eax,%edx
40000c85:	74 09                	je     40000c90 <strnlen+0x20>
40000c87:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000c8b:	75 f3                	jne    40000c80 <strnlen+0x10>
40000c8d:	c3                   	ret
40000c8e:	66 90                	xchg   %ax,%ax
    return n;
}
40000c90:	c3                   	ret
40000c91:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c98:	00 
40000c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000ca0 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000ca0:	53                   	push   %ebx
40000ca1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000ca5:	31 c0                	xor    %eax,%eax
{
40000ca7:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000cab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000cb0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000cb4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000cb7:	83 c0 01             	add    $0x1,%eax
40000cba:	84 d2                	test   %dl,%dl
40000cbc:	75 f2                	jne    40000cb0 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000cbe:	89 c8                	mov    %ecx,%eax
40000cc0:	5b                   	pop    %ebx
40000cc1:	c3                   	ret
40000cc2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cc9:	00 
40000cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000cd0 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000cd0:	56                   	push   %esi
40000cd1:	53                   	push   %ebx
40000cd2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000cd6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000cda:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000cde:	85 db                	test   %ebx,%ebx
40000ce0:	74 21                	je     40000d03 <strncpy+0x33>
40000ce2:	01 f3                	add    %esi,%ebx
40000ce4:	89 f0                	mov    %esi,%eax
40000ce6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ced:	00 
40000cee:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000cf0:	0f b6 0a             	movzbl (%edx),%ecx
40000cf3:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000cf6:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000cf9:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000cfc:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000cff:	39 c3                	cmp    %eax,%ebx
40000d01:	75 ed                	jne    40000cf0 <strncpy+0x20>
    }
    return ret;
}
40000d03:	89 f0                	mov    %esi,%eax
40000d05:	5b                   	pop    %ebx
40000d06:	5e                   	pop    %esi
40000d07:	c3                   	ret
40000d08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d0f:	00 

40000d10 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000d10:	56                   	push   %esi
40000d11:	53                   	push   %ebx
40000d12:	8b 44 24 14          	mov    0x14(%esp),%eax
40000d16:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000d1a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000d1e:	85 c0                	test   %eax,%eax
40000d20:	74 29                	je     40000d4b <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000d22:	89 f2                	mov    %esi,%edx
40000d24:	83 e8 01             	sub    $0x1,%eax
40000d27:	74 1f                	je     40000d48 <strlcpy+0x38>
40000d29:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000d2c:	eb 0f                	jmp    40000d3d <strlcpy+0x2d>
40000d2e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000d30:	83 c2 01             	add    $0x1,%edx
40000d33:	83 c1 01             	add    $0x1,%ecx
40000d36:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000d39:	39 da                	cmp    %ebx,%edx
40000d3b:	74 07                	je     40000d44 <strlcpy+0x34>
40000d3d:	0f b6 01             	movzbl (%ecx),%eax
40000d40:	84 c0                	test   %al,%al
40000d42:	75 ec                	jne    40000d30 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000d44:	89 d0                	mov    %edx,%eax
40000d46:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000d48:	c6 02 00             	movb   $0x0,(%edx)
}
40000d4b:	5b                   	pop    %ebx
40000d4c:	5e                   	pop    %esi
40000d4d:	c3                   	ret
40000d4e:	66 90                	xchg   %ax,%ax

40000d50 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000d50:	53                   	push   %ebx
40000d51:	8b 54 24 08          	mov    0x8(%esp),%edx
40000d55:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000d59:	0f b6 02             	movzbl (%edx),%eax
40000d5c:	84 c0                	test   %al,%al
40000d5e:	75 18                	jne    40000d78 <strcmp+0x28>
40000d60:	eb 30                	jmp    40000d92 <strcmp+0x42>
40000d62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d68:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000d6c:	83 c2 01             	add    $0x1,%edx
40000d6f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000d72:	84 c0                	test   %al,%al
40000d74:	74 12                	je     40000d88 <strcmp+0x38>
40000d76:	89 d9                	mov    %ebx,%ecx
40000d78:	0f b6 19             	movzbl (%ecx),%ebx
40000d7b:	38 c3                	cmp    %al,%bl
40000d7d:	74 e9                	je     40000d68 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d7f:	29 d8                	sub    %ebx,%eax
}
40000d81:	5b                   	pop    %ebx
40000d82:	c3                   	ret
40000d83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d88:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000d8c:	31 c0                	xor    %eax,%eax
40000d8e:	29 d8                	sub    %ebx,%eax
}
40000d90:	5b                   	pop    %ebx
40000d91:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d92:	0f b6 19             	movzbl (%ecx),%ebx
40000d95:	31 c0                	xor    %eax,%eax
40000d97:	eb e6                	jmp    40000d7f <strcmp+0x2f>
40000d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000da0 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000da0:	53                   	push   %ebx
40000da1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000da5:	8b 44 24 08          	mov    0x8(%esp),%eax
40000da9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000dad:	85 d2                	test   %edx,%edx
40000daf:	75 16                	jne    40000dc7 <strncmp+0x27>
40000db1:	eb 2d                	jmp    40000de0 <strncmp+0x40>
40000db3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000db8:	3a 19                	cmp    (%ecx),%bl
40000dba:	75 12                	jne    40000dce <strncmp+0x2e>
        n--, p++, q++;
40000dbc:	83 c0 01             	add    $0x1,%eax
40000dbf:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000dc2:	83 ea 01             	sub    $0x1,%edx
40000dc5:	74 19                	je     40000de0 <strncmp+0x40>
40000dc7:	0f b6 18             	movzbl (%eax),%ebx
40000dca:	84 db                	test   %bl,%bl
40000dcc:	75 ea                	jne    40000db8 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000dce:	0f b6 00             	movzbl (%eax),%eax
40000dd1:	0f b6 11             	movzbl (%ecx),%edx
}
40000dd4:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000dd5:	29 d0                	sub    %edx,%eax
}
40000dd7:	c3                   	ret
40000dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ddf:	00 
        return 0;
40000de0:	31 c0                	xor    %eax,%eax
}
40000de2:	5b                   	pop    %ebx
40000de3:	c3                   	ret
40000de4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000deb:	00 
40000dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000df0 <strchr>:

char *strchr(const char *s, char c)
{
40000df0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000df4:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000df9:	0f b6 10             	movzbl (%eax),%edx
40000dfc:	84 d2                	test   %dl,%dl
40000dfe:	75 13                	jne    40000e13 <strchr+0x23>
40000e00:	eb 1e                	jmp    40000e20 <strchr+0x30>
40000e02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000e08:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000e0c:	83 c0 01             	add    $0x1,%eax
40000e0f:	84 d2                	test   %dl,%dl
40000e11:	74 0d                	je     40000e20 <strchr+0x30>
        if (*s == c)
40000e13:	38 d1                	cmp    %dl,%cl
40000e15:	75 f1                	jne    40000e08 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000e17:	c3                   	ret
40000e18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e1f:	00 
    return 0;
40000e20:	31 c0                	xor    %eax,%eax
}
40000e22:	c3                   	ret
40000e23:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e2a:	00 
40000e2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000e30 <strfind>:

char *strfind(const char *s, char c)
{
40000e30:	53                   	push   %ebx
40000e31:	8b 44 24 08          	mov    0x8(%esp),%eax
40000e35:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000e39:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000e3c:	38 d3                	cmp    %dl,%bl
40000e3e:	74 1f                	je     40000e5f <strfind+0x2f>
40000e40:	89 d1                	mov    %edx,%ecx
40000e42:	84 db                	test   %bl,%bl
40000e44:	75 0e                	jne    40000e54 <strfind+0x24>
40000e46:	eb 17                	jmp    40000e5f <strfind+0x2f>
40000e48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e4f:	00 
40000e50:	84 d2                	test   %dl,%dl
40000e52:	74 0b                	je     40000e5f <strfind+0x2f>
    for (; *s; s++)
40000e54:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000e58:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000e5b:	38 ca                	cmp    %cl,%dl
40000e5d:	75 f1                	jne    40000e50 <strfind+0x20>
            break;
    return (char *) s;
}
40000e5f:	5b                   	pop    %ebx
40000e60:	c3                   	ret
40000e61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e68:	00 
40000e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000e70 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000e70:	55                   	push   %ebp
40000e71:	57                   	push   %edi
40000e72:	56                   	push   %esi
40000e73:	53                   	push   %ebx
40000e74:	8b 54 24 14          	mov    0x14(%esp),%edx
40000e78:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000e7c:	0f b6 02             	movzbl (%edx),%eax
40000e7f:	3c 20                	cmp    $0x20,%al
40000e81:	75 10                	jne    40000e93 <strtol+0x23>
40000e83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e88:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000e8c:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000e8f:	3c 20                	cmp    $0x20,%al
40000e91:	74 f5                	je     40000e88 <strtol+0x18>
40000e93:	3c 09                	cmp    $0x9,%al
40000e95:	74 f1                	je     40000e88 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000e97:	3c 2b                	cmp    $0x2b,%al
40000e99:	0f 84 b1 00 00 00    	je     40000f50 <strtol+0xe0>
    int neg = 0;
40000e9f:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000ea1:	3c 2d                	cmp    $0x2d,%al
40000ea3:	0f 84 97 00 00 00    	je     40000f40 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000ea9:	0f b6 02             	movzbl (%edx),%eax
40000eac:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000eb3:	ff 
40000eb4:	75 1d                	jne    40000ed3 <strtol+0x63>
40000eb6:	3c 30                	cmp    $0x30,%al
40000eb8:	0f 84 a2 00 00 00    	je     40000f60 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000ebe:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000ec3:	19 c0                	sbb    %eax,%eax
40000ec5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000ec9:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000ece:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000ed3:	31 c9                	xor    %ecx,%ecx
40000ed5:	eb 1c                	jmp    40000ef3 <strtol+0x83>
40000ed7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ede:	00 
40000edf:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000ee0:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000ee3:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000ee7:	7d 2a                	jge    40000f13 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000ee9:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000eee:	83 c2 01             	add    $0x1,%edx
40000ef1:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000ef3:	0f be 02             	movsbl (%edx),%eax
40000ef6:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000ef9:	89 eb                	mov    %ebp,%ebx
40000efb:	80 fb 09             	cmp    $0x9,%bl
40000efe:	76 e0                	jbe    40000ee0 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000f00:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000f03:	89 eb                	mov    %ebp,%ebx
40000f05:	80 fb 19             	cmp    $0x19,%bl
40000f08:	77 26                	ja     40000f30 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000f0a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000f0d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000f11:	7c d6                	jl     40000ee9 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000f13:	85 f6                	test   %esi,%esi
40000f15:	74 02                	je     40000f19 <strtol+0xa9>
        *endptr = (char *) s;
40000f17:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000f19:	89 c8                	mov    %ecx,%eax
}
40000f1b:	5b                   	pop    %ebx
40000f1c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000f1d:	f7 d8                	neg    %eax
40000f1f:	85 ff                	test   %edi,%edi
}
40000f21:	5f                   	pop    %edi
40000f22:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000f23:	0f 45 c8             	cmovne %eax,%ecx
}
40000f26:	89 c8                	mov    %ecx,%eax
40000f28:	c3                   	ret
40000f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000f30:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000f33:	89 eb                	mov    %ebp,%ebx
40000f35:	80 fb 19             	cmp    $0x19,%bl
40000f38:	77 d9                	ja     40000f13 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000f3a:	83 e8 37             	sub    $0x37,%eax
40000f3d:	eb a4                	jmp    40000ee3 <strtol+0x73>
40000f3f:	90                   	nop
        s++, neg = 1;
40000f40:	83 c2 01             	add    $0x1,%edx
40000f43:	bf 01 00 00 00       	mov    $0x1,%edi
40000f48:	e9 5c ff ff ff       	jmp    40000ea9 <strtol+0x39>
40000f4d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000f50:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000f53:	31 ff                	xor    %edi,%edi
40000f55:	e9 4f ff ff ff       	jmp    40000ea9 <strtol+0x39>
40000f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000f60:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000f64:	74 25                	je     40000f8b <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000f66:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000f6a:	85 c0                	test   %eax,%eax
40000f6c:	74 0d                	je     40000f7b <strtol+0x10b>
40000f6e:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f75:	00 
40000f76:	e9 58 ff ff ff       	jmp    40000ed3 <strtol+0x63>
        s++, base = 8;
40000f7b:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000f82:	00 
40000f83:	83 c2 01             	add    $0x1,%edx
40000f86:	e9 48 ff ff ff       	jmp    40000ed3 <strtol+0x63>
        s += 2, base = 16;
40000f8b:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f92:	00 
40000f93:	83 c2 02             	add    $0x2,%edx
40000f96:	e9 38 ff ff ff       	jmp    40000ed3 <strtol+0x63>
40000f9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000fa0 <memset>:

void *memset(void *v, int c, size_t n)
{
40000fa0:	57                   	push   %edi
40000fa1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000fa5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000fa9:	85 c9                	test   %ecx,%ecx
40000fab:	74 19                	je     40000fc6 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000fad:	89 f8                	mov    %edi,%eax
40000faf:	09 c8                	or     %ecx,%eax
40000fb1:	a8 03                	test   $0x3,%al
40000fb3:	75 1b                	jne    40000fd0 <memset+0x30>
        c &= 0xFF;
40000fb5:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000fba:	c1 e9 02             	shr    $0x2,%ecx
40000fbd:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000fc3:	fc                   	cld
40000fc4:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000fc6:	89 f8                	mov    %edi,%eax
40000fc8:	5f                   	pop    %edi
40000fc9:	c3                   	ret
40000fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000fd0:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fd4:	fc                   	cld
40000fd5:	f3 aa                	rep stos %al,%es:(%edi)
}
40000fd7:	89 f8                	mov    %edi,%eax
40000fd9:	5f                   	pop    %edi
40000fda:	c3                   	ret
40000fdb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000fe0 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000fe0:	57                   	push   %edi
40000fe1:	56                   	push   %esi
40000fe2:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fe6:	8b 74 24 10          	mov    0x10(%esp),%esi
40000fea:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000fee:	39 c6                	cmp    %eax,%esi
40000ff0:	73 26                	jae    40001018 <memmove+0x38>
40000ff2:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000ff5:	39 d0                	cmp    %edx,%eax
40000ff7:	73 1f                	jae    40001018 <memmove+0x38>
        s += n;
        d += n;
40000ff9:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000ffc:	89 fe                	mov    %edi,%esi
40000ffe:	09 ce                	or     %ecx,%esi
40001000:	09 d6                	or     %edx,%esi
40001002:	83 e6 03             	and    $0x3,%esi
40001005:	74 39                	je     40001040 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40001007:	83 ef 01             	sub    $0x1,%edi
4000100a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
4000100d:	fd                   	std
4000100e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40001010:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40001011:	5e                   	pop    %esi
40001012:	5f                   	pop    %edi
40001013:	c3                   	ret
40001014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40001018:	89 c2                	mov    %eax,%edx
4000101a:	09 ca                	or     %ecx,%edx
4000101c:	09 f2                	or     %esi,%edx
4000101e:	83 e2 03             	and    $0x3,%edx
40001021:	74 0d                	je     40001030 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40001023:	89 c7                	mov    %eax,%edi
40001025:	fc                   	cld
40001026:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40001028:	5e                   	pop    %esi
40001029:	5f                   	pop    %edi
4000102a:	c3                   	ret
4000102b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40001030:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40001033:	89 c7                	mov    %eax,%edi
40001035:	fc                   	cld
40001036:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001038:	eb ee                	jmp    40001028 <memmove+0x48>
4000103a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40001040:	83 ef 04             	sub    $0x4,%edi
40001043:	8d 72 fc             	lea    -0x4(%edx),%esi
40001046:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40001049:	fd                   	std
4000104a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
4000104c:	eb c2                	jmp    40001010 <memmove+0x30>
4000104e:	66 90                	xchg   %ax,%ax

40001050 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40001050:	eb 8e                	jmp    40000fe0 <memmove>
40001052:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001059:	00 
4000105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40001060 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40001060:	56                   	push   %esi
40001061:	53                   	push   %ebx
40001062:	8b 74 24 14          	mov    0x14(%esp),%esi
40001066:	8b 44 24 0c          	mov    0xc(%esp),%eax
4000106a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
4000106e:	85 f6                	test   %esi,%esi
40001070:	74 2e                	je     400010a0 <memcmp+0x40>
40001072:	01 c6                	add    %eax,%esi
40001074:	eb 14                	jmp    4000108a <memcmp+0x2a>
40001076:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000107d:	00 
4000107e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40001080:	83 c0 01             	add    $0x1,%eax
40001083:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40001086:	39 f0                	cmp    %esi,%eax
40001088:	74 16                	je     400010a0 <memcmp+0x40>
        if (*s1 != *s2)
4000108a:	0f b6 08             	movzbl (%eax),%ecx
4000108d:	0f b6 1a             	movzbl (%edx),%ebx
40001090:	38 d9                	cmp    %bl,%cl
40001092:	74 ec                	je     40001080 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40001094:	0f b6 c1             	movzbl %cl,%eax
40001097:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40001099:	5b                   	pop    %ebx
4000109a:	5e                   	pop    %esi
4000109b:	c3                   	ret
4000109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
400010a0:	31 c0                	xor    %eax,%eax
}
400010a2:	5b                   	pop    %ebx
400010a3:	5e                   	pop    %esi
400010a4:	c3                   	ret
400010a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400010ac:	00 
400010ad:	8d 76 00             	lea    0x0(%esi),%esi

400010b0 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
400010b0:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
400010b4:	8b 54 24 0c          	mov    0xc(%esp),%edx
400010b8:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
400010ba:	39 d0                	cmp    %edx,%eax
400010bc:	73 1a                	jae    400010d8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
400010be:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
400010c3:	eb 0a                	jmp    400010cf <memchr+0x1f>
400010c5:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
400010c8:	83 c0 01             	add    $0x1,%eax
400010cb:	39 c2                	cmp    %eax,%edx
400010cd:	74 09                	je     400010d8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
400010cf:	38 08                	cmp    %cl,(%eax)
400010d1:	75 f5                	jne    400010c8 <memchr+0x18>
            return (void *) s;
    return NULL;
}
400010d3:	c3                   	ret
400010d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
400010d8:	31 c0                	xor    %eax,%eax
}
400010da:	c3                   	ret
400010db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

400010e0 <memzero>:

void *memzero(void *v, size_t n)
{
400010e0:	57                   	push   %edi
400010e1:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400010e5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
400010e9:	85 c9                	test   %ecx,%ecx
400010eb:	74 0f                	je     400010fc <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
400010ed:	89 f8                	mov    %edi,%eax
400010ef:	09 c8                	or     %ecx,%eax
400010f1:	83 e0 03             	and    $0x3,%eax
400010f4:	75 0a                	jne    40001100 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
400010f6:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
400010f9:	fc                   	cld
400010fa:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
400010fc:	89 f8                	mov    %edi,%eax
400010fe:	5f                   	pop    %edi
400010ff:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001100:	31 c0                	xor    %eax,%eax
40001102:	fc                   	cld
40001103:	f3 aa                	rep stos %al,%es:(%edi)
}
40001105:	89 f8                	mov    %edi,%eax
40001107:	5f                   	pop    %edi
40001108:	c3                   	ret
40001109:	66 90                	xchg   %ax,%ax
4000110b:	66 90                	xchg   %ax,%ax
4000110d:	66 90                	xchg   %ax,%ax
4000110f:	90                   	nop

40001110 <__udivdi3>:
40001110:	f3 0f 1e fb          	endbr32
40001114:	55                   	push   %ebp
40001115:	57                   	push   %edi
40001116:	56                   	push   %esi
40001117:	53                   	push   %ebx
40001118:	83 ec 1c             	sub    $0x1c,%esp
4000111b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
4000111f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
40001123:	8b 74 24 34          	mov    0x34(%esp),%esi
40001127:	8b 5c 24 38          	mov    0x38(%esp),%ebx
4000112b:	85 c0                	test   %eax,%eax
4000112d:	75 19                	jne    40001148 <__udivdi3+0x38>
4000112f:	39 de                	cmp    %ebx,%esi
40001131:	73 4d                	jae    40001180 <__udivdi3+0x70>
40001133:	31 ff                	xor    %edi,%edi
40001135:	89 e8                	mov    %ebp,%eax
40001137:	89 f2                	mov    %esi,%edx
40001139:	f7 f3                	div    %ebx
4000113b:	89 fa                	mov    %edi,%edx
4000113d:	83 c4 1c             	add    $0x1c,%esp
40001140:	5b                   	pop    %ebx
40001141:	5e                   	pop    %esi
40001142:	5f                   	pop    %edi
40001143:	5d                   	pop    %ebp
40001144:	c3                   	ret
40001145:	8d 76 00             	lea    0x0(%esi),%esi
40001148:	39 c6                	cmp    %eax,%esi
4000114a:	73 14                	jae    40001160 <__udivdi3+0x50>
4000114c:	31 ff                	xor    %edi,%edi
4000114e:	31 c0                	xor    %eax,%eax
40001150:	89 fa                	mov    %edi,%edx
40001152:	83 c4 1c             	add    $0x1c,%esp
40001155:	5b                   	pop    %ebx
40001156:	5e                   	pop    %esi
40001157:	5f                   	pop    %edi
40001158:	5d                   	pop    %ebp
40001159:	c3                   	ret
4000115a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001160:	0f bd f8             	bsr    %eax,%edi
40001163:	83 f7 1f             	xor    $0x1f,%edi
40001166:	75 48                	jne    400011b0 <__udivdi3+0xa0>
40001168:	39 f0                	cmp    %esi,%eax
4000116a:	72 06                	jb     40001172 <__udivdi3+0x62>
4000116c:	31 c0                	xor    %eax,%eax
4000116e:	39 dd                	cmp    %ebx,%ebp
40001170:	72 de                	jb     40001150 <__udivdi3+0x40>
40001172:	b8 01 00 00 00       	mov    $0x1,%eax
40001177:	eb d7                	jmp    40001150 <__udivdi3+0x40>
40001179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001180:	89 d9                	mov    %ebx,%ecx
40001182:	85 db                	test   %ebx,%ebx
40001184:	75 0b                	jne    40001191 <__udivdi3+0x81>
40001186:	b8 01 00 00 00       	mov    $0x1,%eax
4000118b:	31 d2                	xor    %edx,%edx
4000118d:	f7 f3                	div    %ebx
4000118f:	89 c1                	mov    %eax,%ecx
40001191:	31 d2                	xor    %edx,%edx
40001193:	89 f0                	mov    %esi,%eax
40001195:	f7 f1                	div    %ecx
40001197:	89 c6                	mov    %eax,%esi
40001199:	89 e8                	mov    %ebp,%eax
4000119b:	89 f7                	mov    %esi,%edi
4000119d:	f7 f1                	div    %ecx
4000119f:	89 fa                	mov    %edi,%edx
400011a1:	83 c4 1c             	add    $0x1c,%esp
400011a4:	5b                   	pop    %ebx
400011a5:	5e                   	pop    %esi
400011a6:	5f                   	pop    %edi
400011a7:	5d                   	pop    %ebp
400011a8:	c3                   	ret
400011a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400011b0:	89 f9                	mov    %edi,%ecx
400011b2:	ba 20 00 00 00       	mov    $0x20,%edx
400011b7:	29 fa                	sub    %edi,%edx
400011b9:	d3 e0                	shl    %cl,%eax
400011bb:	89 44 24 08          	mov    %eax,0x8(%esp)
400011bf:	89 d1                	mov    %edx,%ecx
400011c1:	89 d8                	mov    %ebx,%eax
400011c3:	d3 e8                	shr    %cl,%eax
400011c5:	89 c1                	mov    %eax,%ecx
400011c7:	8b 44 24 08          	mov    0x8(%esp),%eax
400011cb:	09 c1                	or     %eax,%ecx
400011cd:	89 f0                	mov    %esi,%eax
400011cf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400011d3:	89 f9                	mov    %edi,%ecx
400011d5:	d3 e3                	shl    %cl,%ebx
400011d7:	89 d1                	mov    %edx,%ecx
400011d9:	d3 e8                	shr    %cl,%eax
400011db:	89 f9                	mov    %edi,%ecx
400011dd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
400011e1:	89 eb                	mov    %ebp,%ebx
400011e3:	d3 e6                	shl    %cl,%esi
400011e5:	89 d1                	mov    %edx,%ecx
400011e7:	d3 eb                	shr    %cl,%ebx
400011e9:	09 f3                	or     %esi,%ebx
400011eb:	89 c6                	mov    %eax,%esi
400011ed:	89 f2                	mov    %esi,%edx
400011ef:	89 d8                	mov    %ebx,%eax
400011f1:	f7 74 24 08          	divl   0x8(%esp)
400011f5:	89 d6                	mov    %edx,%esi
400011f7:	89 c3                	mov    %eax,%ebx
400011f9:	f7 64 24 0c          	mull   0xc(%esp)
400011fd:	39 d6                	cmp    %edx,%esi
400011ff:	72 1f                	jb     40001220 <__udivdi3+0x110>
40001201:	89 f9                	mov    %edi,%ecx
40001203:	d3 e5                	shl    %cl,%ebp
40001205:	39 c5                	cmp    %eax,%ebp
40001207:	73 04                	jae    4000120d <__udivdi3+0xfd>
40001209:	39 d6                	cmp    %edx,%esi
4000120b:	74 13                	je     40001220 <__udivdi3+0x110>
4000120d:	89 d8                	mov    %ebx,%eax
4000120f:	31 ff                	xor    %edi,%edi
40001211:	e9 3a ff ff ff       	jmp    40001150 <__udivdi3+0x40>
40001216:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000121d:	00 
4000121e:	66 90                	xchg   %ax,%ax
40001220:	8d 43 ff             	lea    -0x1(%ebx),%eax
40001223:	31 ff                	xor    %edi,%edi
40001225:	e9 26 ff ff ff       	jmp    40001150 <__udivdi3+0x40>
4000122a:	66 90                	xchg   %ax,%ax
4000122c:	66 90                	xchg   %ax,%ax
4000122e:	66 90                	xchg   %ax,%ax

40001230 <__umoddi3>:
40001230:	f3 0f 1e fb          	endbr32
40001234:	55                   	push   %ebp
40001235:	57                   	push   %edi
40001236:	56                   	push   %esi
40001237:	53                   	push   %ebx
40001238:	83 ec 1c             	sub    $0x1c,%esp
4000123b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
4000123f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40001243:	8b 74 24 30          	mov    0x30(%esp),%esi
40001247:	8b 7c 24 38          	mov    0x38(%esp),%edi
4000124b:	89 da                	mov    %ebx,%edx
4000124d:	85 c0                	test   %eax,%eax
4000124f:	75 17                	jne    40001268 <__umoddi3+0x38>
40001251:	39 fb                	cmp    %edi,%ebx
40001253:	73 53                	jae    400012a8 <__umoddi3+0x78>
40001255:	89 f0                	mov    %esi,%eax
40001257:	f7 f7                	div    %edi
40001259:	89 d0                	mov    %edx,%eax
4000125b:	31 d2                	xor    %edx,%edx
4000125d:	83 c4 1c             	add    $0x1c,%esp
40001260:	5b                   	pop    %ebx
40001261:	5e                   	pop    %esi
40001262:	5f                   	pop    %edi
40001263:	5d                   	pop    %ebp
40001264:	c3                   	ret
40001265:	8d 76 00             	lea    0x0(%esi),%esi
40001268:	89 f1                	mov    %esi,%ecx
4000126a:	39 c3                	cmp    %eax,%ebx
4000126c:	73 12                	jae    40001280 <__umoddi3+0x50>
4000126e:	89 f0                	mov    %esi,%eax
40001270:	83 c4 1c             	add    $0x1c,%esp
40001273:	5b                   	pop    %ebx
40001274:	5e                   	pop    %esi
40001275:	5f                   	pop    %edi
40001276:	5d                   	pop    %ebp
40001277:	c3                   	ret
40001278:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000127f:	00 
40001280:	0f bd e8             	bsr    %eax,%ebp
40001283:	83 f5 1f             	xor    $0x1f,%ebp
40001286:	75 48                	jne    400012d0 <__umoddi3+0xa0>
40001288:	39 d8                	cmp    %ebx,%eax
4000128a:	0f 82 d0 00 00 00    	jb     40001360 <__umoddi3+0x130>
40001290:	39 fe                	cmp    %edi,%esi
40001292:	0f 83 c8 00 00 00    	jae    40001360 <__umoddi3+0x130>
40001298:	89 c8                	mov    %ecx,%eax
4000129a:	83 c4 1c             	add    $0x1c,%esp
4000129d:	5b                   	pop    %ebx
4000129e:	5e                   	pop    %esi
4000129f:	5f                   	pop    %edi
400012a0:	5d                   	pop    %ebp
400012a1:	c3                   	ret
400012a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400012a8:	89 f9                	mov    %edi,%ecx
400012aa:	85 ff                	test   %edi,%edi
400012ac:	75 0b                	jne    400012b9 <__umoddi3+0x89>
400012ae:	b8 01 00 00 00       	mov    $0x1,%eax
400012b3:	31 d2                	xor    %edx,%edx
400012b5:	f7 f7                	div    %edi
400012b7:	89 c1                	mov    %eax,%ecx
400012b9:	89 d8                	mov    %ebx,%eax
400012bb:	31 d2                	xor    %edx,%edx
400012bd:	f7 f1                	div    %ecx
400012bf:	89 f0                	mov    %esi,%eax
400012c1:	f7 f1                	div    %ecx
400012c3:	89 d0                	mov    %edx,%eax
400012c5:	31 d2                	xor    %edx,%edx
400012c7:	eb 94                	jmp    4000125d <__umoddi3+0x2d>
400012c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400012d0:	89 e9                	mov    %ebp,%ecx
400012d2:	ba 20 00 00 00       	mov    $0x20,%edx
400012d7:	29 ea                	sub    %ebp,%edx
400012d9:	d3 e0                	shl    %cl,%eax
400012db:	89 44 24 08          	mov    %eax,0x8(%esp)
400012df:	89 d1                	mov    %edx,%ecx
400012e1:	89 f8                	mov    %edi,%eax
400012e3:	d3 e8                	shr    %cl,%eax
400012e5:	89 54 24 04          	mov    %edx,0x4(%esp)
400012e9:	8b 54 24 04          	mov    0x4(%esp),%edx
400012ed:	89 c1                	mov    %eax,%ecx
400012ef:	8b 44 24 08          	mov    0x8(%esp),%eax
400012f3:	09 c1                	or     %eax,%ecx
400012f5:	89 d8                	mov    %ebx,%eax
400012f7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400012fb:	89 e9                	mov    %ebp,%ecx
400012fd:	d3 e7                	shl    %cl,%edi
400012ff:	89 d1                	mov    %edx,%ecx
40001301:	d3 e8                	shr    %cl,%eax
40001303:	89 e9                	mov    %ebp,%ecx
40001305:	89 7c 24 0c          	mov    %edi,0xc(%esp)
40001309:	d3 e3                	shl    %cl,%ebx
4000130b:	89 c7                	mov    %eax,%edi
4000130d:	89 d1                	mov    %edx,%ecx
4000130f:	89 f0                	mov    %esi,%eax
40001311:	d3 e8                	shr    %cl,%eax
40001313:	89 fa                	mov    %edi,%edx
40001315:	89 e9                	mov    %ebp,%ecx
40001317:	09 d8                	or     %ebx,%eax
40001319:	d3 e6                	shl    %cl,%esi
4000131b:	f7 74 24 08          	divl   0x8(%esp)
4000131f:	89 d3                	mov    %edx,%ebx
40001321:	f7 64 24 0c          	mull   0xc(%esp)
40001325:	89 c7                	mov    %eax,%edi
40001327:	89 d1                	mov    %edx,%ecx
40001329:	39 d3                	cmp    %edx,%ebx
4000132b:	72 06                	jb     40001333 <__umoddi3+0x103>
4000132d:	75 10                	jne    4000133f <__umoddi3+0x10f>
4000132f:	39 c6                	cmp    %eax,%esi
40001331:	73 0c                	jae    4000133f <__umoddi3+0x10f>
40001333:	2b 44 24 0c          	sub    0xc(%esp),%eax
40001337:	1b 54 24 08          	sbb    0x8(%esp),%edx
4000133b:	89 d1                	mov    %edx,%ecx
4000133d:	89 c7                	mov    %eax,%edi
4000133f:	89 f2                	mov    %esi,%edx
40001341:	29 fa                	sub    %edi,%edx
40001343:	19 cb                	sbb    %ecx,%ebx
40001345:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
4000134a:	89 d8                	mov    %ebx,%eax
4000134c:	d3 e0                	shl    %cl,%eax
4000134e:	89 e9                	mov    %ebp,%ecx
40001350:	d3 ea                	shr    %cl,%edx
40001352:	d3 eb                	shr    %cl,%ebx
40001354:	09 d0                	or     %edx,%eax
40001356:	89 da                	mov    %ebx,%edx
40001358:	83 c4 1c             	add    $0x1c,%esp
4000135b:	5b                   	pop    %ebx
4000135c:	5e                   	pop    %esi
4000135d:	5f                   	pop    %edi
4000135e:	5d                   	pop    %ebp
4000135f:	c3                   	ret
40001360:	89 da                	mov    %ebx,%edx
40001362:	89 f1                	mov    %esi,%ecx
40001364:	29 f9                	sub    %edi,%ecx
40001366:	19 c2                	sbb    %eax,%edx
40001368:	89 c8                	mov    %ecx,%eax
4000136a:	e9 2b ff ff ff       	jmp    4000129a <__umoddi3+0x6a>
