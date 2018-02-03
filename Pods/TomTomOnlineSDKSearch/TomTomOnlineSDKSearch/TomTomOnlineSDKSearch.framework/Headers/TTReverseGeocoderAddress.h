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

@interface TTReverseGeocoderAddress : NSObject

- (id)initWithBuildingNumber:(NSString *)buildingNumber
                streetNumber:(NSString *)streetNumber
                routeNumbers:(NSArray<NSString*>*)routeNumbers
                      street:(NSString *)street
                  streetName:(NSString *)streetName
         streetNameAndNumber:(NSString *)streetNameAndNumber
                  speedLimit:(NSString *)speedLimit
                     country:(NSString *)country
                 countryCode:(NSString *)countryCode
             countryCodeISO3:(NSString *)countryCodeISO3
          countrySubdivision:(NSString *)countrySubdivision
      countrySubdivisionName:(NSString *)countrySubdivisionName
 countrySecondarySubdivision:(NSString *)countrySecondarySubdivision
                municipality:(NSString *)municipality
     municipalitySubdivision:(NSString *)municipalitySubdivision
                  postalCode:(NSString *)postalCode
             freeformAddress:(NSString *)freeformAddress;

/**
 */
@property (nonatomic, readonly, copy) NSString *buildingNumber;
/**
 */
@property (nonatomic, readonly, copy) NSString *streetNumber;
/**
 */
@property (nonatomic, readonly, copy) NSArray<NSString*> *routeNumbers;
/**
 */
@property (nonatomic, readonly, copy) NSString *street;
/**
 */
@property (nonatomic, readonly, copy) NSString *streetName;
/**
 */
@property (nonatomic, readonly, copy) NSString *streetNameAndNumber;
/**
 */
@property (nonatomic, readonly, copy) NSString *speedLimit;
/**
 */
@property (nonatomic, readonly, copy) NSString *country;
/**
 */
@property (nonatomic, readonly, copy) NSString *countryCode;
/**
 */
@property (nonatomic, readonly, copy) NSString *countryCodeISO3;
/**
 */
@property (nonatomic, readonly, copy) NSString *countrySubdivision;
/**
 */
@property (nonatomic, readonly, copy) NSString *countrySubdivisionName;
/**
 */
@property (nonatomic, readonly, copy) NSString *countrySecondarySubdivision;
/**
 */
@property (nonatomic, readonly, copy) NSString *municipality;
/**
 */
@property (nonatomic, readonly, copy) NSString *municipalitySubdivision;
/**
 */
@property (nonatomic, readonly, copy) NSString *postalCode;
/**
 */
@property (nonatomic, readonly, copy) NSString *freeformAddress;

@end
