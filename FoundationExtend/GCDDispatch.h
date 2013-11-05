//
//  GCDDispatch.h
//  FoundationExtend
//
//  Created by ZhuJiaQuan on 13-11-1.
//  Copyright (c) 2013年 5codelab. All rights reserved.
//

#ifndef DISPATCH_H_
#define DISPATCH_H_

#pragma mark - GCD

static inline void DispatchAsync(dispatch_block_t block)
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

static inline void DispatchAsyncAfter(double seconds, dispatch_block_t block)
{
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (seconds) * NSEC_PER_SEC),
				   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
				   block);
}

static inline void DispatchUI(dispatch_block_t block)
{
	dispatch_async(dispatch_get_main_queue(), block);
}

static inline void DispatchUIAfter(double seconds, dispatch_block_t block)
{
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (seconds) * NSEC_PER_SEC),
				   dispatch_get_main_queue(),
				   block);
}

#endif /* DISPATCH_H_ */
