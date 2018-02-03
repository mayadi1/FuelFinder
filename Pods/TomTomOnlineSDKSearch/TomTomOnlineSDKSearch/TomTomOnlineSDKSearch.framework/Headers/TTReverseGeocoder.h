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
#import <CoreLocation/CoreLocation.h>

@class TTReverseGeocoderQuery;
@class TTReverseGeocoder;
@class TTReverseGeocoderResult;
@class TTResponseError;

@protocol TTReverseGeocoderDelegate
-(void)reverseGeocoder:(TTReverseGeocoder*)reverseGeocoder completedWithResult:(TTReverseGeocoderResult*)result;
-(void)reverseGeocoder:(TTReverseGeocoder*)reverseGeocoder failedWithError:(TTResponseError*)error;
@end


/**
 *TomTom Search API main object. Contains methods to use Tomtom’s online search engine and provides support for both async and sync calls.
 */
@interface TTReverseGeocoder : NSObject

/**
 *Reverse geocoder with async callback
 *
 *@param query Object containing the data needed to perform a search.
 *@param delegate Delegate that informs the subscriber when a search result is available. It contains a TTReverseGeocoderResult object.
 */
- (void)reverseGeocoderWithQuery:(TTReverseGeocoderQuery*)query
      withAsyncDelegate:(id<TTReverseGeocoderDelegate>)delegate;

/**
 *Reverse geocoder with async block
 *
 *@param request The object which contains data necessary to execute search action
 *@param completionHandler CompletionHandler that informs the subscriber when a search result is available. It contains a TTReverseGeocoderResult object.
 */
- (void)reverseGeocoderWithQuery:(TTReverseGeocoderQuery *)request
                 completionHandler:(void (^)(TTReverseGeocoderResult *result, TTResponseError *error))completionHandler;

/**
 *Reverse geocoder with sync result
 *
 *@param query Object containing the data needed to perform a search.
 *@param error Error
 *@return return TTReverseGeocoderResult object.
 */
- (TTReverseGeocoderResult *)reverseGeocoderWithQuery:(TTReverseGeocoderQuery *)query
                                                error:(TTResponseError *)error;

/**
 *Cancels the current request
 */
- (void)cancel;

@end
