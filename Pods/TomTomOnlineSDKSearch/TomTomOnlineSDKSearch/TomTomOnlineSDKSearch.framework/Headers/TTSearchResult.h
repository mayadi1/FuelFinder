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

@interface TTSearchResult : NSObject


/**
 */
@property (nonatomic, readonly, copy) NSString *identifier;
/**
 */
@property (nonatomic, readonly, copy) NSString *type;
/**
 */
@property (nonatomic, readonly, copy) NSArray *categories;
/**
 */
@property (nonatomic, readonly, copy) NSString *addressLine1;
/**
 */
@property (nonatomic, readonly, copy) NSString *addressLine2;
/**
 */
@property (nonatomic, readonly, copy) NSString *name;
/**
 */
@property (nonatomic, readonly, copy) NSString *phoneNumber;
/**
 */
@property (nonatomic, readonly, copy) NSString *countryCode;
/**
 */
@property (nonatomic, readonly) CLLocationCoordinate2D position;
/**
 */
@property (nonatomic, readonly, copy) NSString *geoHash;

/**
 */
- (id)initWithIdentifier:(NSString*)identifier
                withType:(NSString*)type
          withCategories:(NSArray*)categories
        withAddressLine1:(NSString*)addressLine1
        withAddressLine2:(NSString*)addressLine2
                withName:(NSString*)name
         withPhoneNumber:(NSString*)phoneNumber
         withCountryCode:(NSString*)countryCode
            withPosition:(CLLocationCoordinate2D)position
             withGeoHash:(NSString*)geoHash;


@end
