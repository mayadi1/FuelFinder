/**
 * Copyright (c) 2017 TomTom N.V. All rights reserved.
 *
 * This software is the proprietary copyright of TomTom N.V. and its subsidiaries and may be used
 * for internal evaluation purposes or commercial use strictly subject to separate licensee
 * agreement between you and TomTom. If you are the licensee, you are only permitted to use
 * this Software in accordance with the terms of your license agreement. If you are not the
 * licensee then you are not authorised to use this software in any manner and should
 * immediately return it to TomTom N.V.
 */

#import <Foundation/Foundation.h>

@class TTReverseGeocoderFullAddress;
@class TTReverseGeocoderSummary;
@interface TTReverseGeocoderResult : NSObject

- (id)initWithSummary:(TTReverseGeocoderSummary *)summary
      withFormatVersion:(NSString *)formatVersion
          withAddresses:(NSArray<TTReverseGeocoderFullAddress *> *)addresses;


/**
 */
@property (nonatomic, readonly, copy) TTReverseGeocoderSummary *summary;

/**
 */
@property (nonatomic, readonly, copy) NSString *formatVersion;

/**
 */
@property (nonatomic, readonly, copy) NSArray<TTReverseGeocoderFullAddress*> *addresses;

@end
