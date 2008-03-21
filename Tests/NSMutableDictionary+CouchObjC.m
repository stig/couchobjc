//
//  NSMutableDictionary+CouchObjC.m
//  CouchObjC
//
//  Created by Stig Brautaset on 21/03/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "NSMutableDictionary+CouchObjC.h"


@implementation NSMutableDictionary (NSMutableDictionary_CouchObjC)

- (NSString*)id {
    return [self objectForKey:@"_id"];
}

- (void)setId:(NSString*)id {
    [self setObject:id forKey:@"_id"];
}

- (NSString*)rev {
    return [self objectForKey:@"_rev"];
}

- (void)setRev:(NSString*)rev {
    [self setObject:rev forKey:@"_rev"];
}

- (NSDictionary*)attachments {
    return [self objectForKey:@"_attachments"];
}

- (void)addAttachmentNamed:(NSString*)name ofType:(NSString*)type data:(id)data {
    id attachments = [self attachments];
    if (!attachments)
        attachments = [NSDictionary dictionary];
    attachments = [NSMutableDictionary dictionaryWithDictionary:attachments];

    NSDictionary *attachment = [NSDictionary dictionaryWithObjectsAndKeys:type, @"type", data, @"data", nil];
    [attachments setObject:attachment forKey:name];
    [self setObject:attachments forKey:@"_attachments"];
}

@end
