//
//  ehm.h
//  VideoIphone
//
//  Created by wangwei34 on 13-5-16.
//  Copyright (c) 2013年 com.baidu. All rights reserved.
//

// undefine variable
#define UNUSE(x)    ((void)x)

#ifndef __DISENABLE_ASSERT__
/*
 *  verify macros
 */
#define VBR(x)      assert(x)   // @"ERROR"
#define VPR(p)      assert(nil != (p))  // @"BAD POINTER"
// verify it's in mainthread
#define VMAINTHREAD()   assert(YES == [NSThread isMainThread])  // @"ERROR"
// TODO flag
#define VTODO()         assert(0)   // @"TODO"
// Not implemented
#define VNOIMPL()       assert(0)   // @"Not implemented yet"
// Error
#define VERROR()    VBR(0)

#else

#define VBR(x)
#define VPR(p)
#define VMAINTHREAD()
#define VTODO()
#define VNOIMPL()
#define VERROR()

#endif

/*
 *  check macros
 */
#define CBR(x)                                                  \
    do {                                                        \
        if (NO == (x))                                          \
        {                                                       \
            ret = NO;                                           \
            goto ERROR;                                         \
        }                                                       \
    } while(0)

#define CBRA(x)                                                 \
    do {                                                        \
        if (NO == (x))                                          \
        {                                                       \
            ret = NO;                                           \
            VBR(0);                                             \
            goto ERROR;                                         \
        }                                                       \
    } while(0)

#define CPR(p)                                                  \
    do {                                                        \
        if (nil == (p))                                         \
        {                                                       \
            ret = NO;                                           \
            goto ERROR;                                         \
        }                                                       \
    } while(0)

#define CCBRA(x)                                                \
                                                                \
if (!(x))                                                       \
{                                                               \
    VBR(0);                                                     \
    continue;                                                   \
}                                                               

#define CCBR(x)                                                 \
                                                                \
if (!(x))                                                       \
{                                                               \
    continue;                                                   \
}

#define CPRA(p)                                                 \
    do {                                                        \
        if (nil == (p))                                         \
        {                                                       \
            ret = NO;                                           \
            VBR(0);                                             \
            goto ERROR;                                         \
        }                                                       \
    } while(0)
