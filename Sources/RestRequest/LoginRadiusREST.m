//
//  LoginRadiusREST.m
//
//  Copyright © 2016 LoginRadius Inc. All rights reserved.
//

#import "LoginRadiusREST.h"
#import "LRDictionary.h"
#import "LoginRadiusError.h"

static NSString * const errorCode = @"errorcode";
static NSString * const isProviderError = @"isprovidererror";
static NSString * const description = @"description";
static NSString * const providerErrorResponse = @"providererrorresponse";
static NSString * const message = @"message";

typedef NS_ENUM(NSUInteger, BASE_URL_ENUM) {
    API,
    CONFIG
};
#define BASE_URL_STRING(enum) [@[@"https://api.loginradius.com/",@"https://config.lrcontent.com/"] objectAtIndex:enum]


@interface LoginRadiusREST()
@property(nonatomic, copy) NSURL* baseURL;
@end

@implementation LoginRadiusREST

+ (instancetype) apiInstance {
	static dispatch_once_t onceToken;
	static LoginRadiusREST *_instance;
	dispatch_once(&onceToken, ^{
		_instance = [[LoginRadiusREST alloc]init:API];
    });
	return _instance;
}

+ (instancetype) configInstance {
	static dispatch_once_t onceToken;
	static LoginRadiusREST *_instance;
	dispatch_once(&onceToken, ^{
		_instance = [[LoginRadiusREST alloc]init:CONFIG];
    });
	return _instance;
}

- (instancetype) init {
    return [self init: API];
}

- (instancetype) init:(BASE_URL_ENUM) baseUrlEnum {
    self = [super init];
    if (self) {
        _baseURL = [NSURL URLWithString:BASE_URL_STRING(baseUrlEnum)];
    }
    return self;
}

- (void)sendGET:(NSString *)url queryParams:(id)queryParams completionHandler:(LRAPIResponseHandler)completion {
    
        NSURL *requestUrl = [NSURL URLWithString:[_baseURL.absoluteString stringByAppendingString:queryParams ? [url stringByAppendingString:[queryParams queryString]]: url]];
        
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        
        [request setHTTPMethod:@"GET"];//use GET
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                          
                                          if([httpResponse statusCode] == 200){
                                             
                                              NSError *jsonError = nil;
                                              id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                                              
                                              if ([jsonObject isKindOfClass:[NSArray class]]) {
                                                  NSArray *jsonArray = (NSArray *)jsonObject;
                                                  NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                                                  [dict setObject:jsonArray forKey:@"Data"];
                                                  completion(dict, nil);
                                              }
                                              else {
                                                  NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                                                  completion(jsonDictionary, nil);
            
                                              }
                                          }else{
                                              completion(nil, [self convertError:data response:response]); 
                                          }
                                      }];
        
        [task resume];
  
}

- (void)sendPOST:(NSString *)url queryParams:(id)queryParams body:(id)body completionHandler:(LRAPIResponseHandler)completion {
    
        NSError* error;
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error: &error];
        
        NSURL *requestUrl = [NSURL URLWithString:[_baseURL.absoluteString stringByAppendingString:queryParams ? [url stringByAppendingString:[queryParams queryString]]: url]];
        
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        
        [request setHTTPMethod:@"POST"];//use POST
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-length"];
        [request setHTTPBody:jsonData];//set data
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                          
                                          if([httpResponse statusCode] == 200){
                                              
                                              NSError *jsonError = nil;
                                              id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                                              
                                              if ([jsonObject isKindOfClass:[NSArray class]]) {
                                                  NSArray *jsonArray = (NSArray *)jsonObject;
                                                  NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                                                  [dict setObject:jsonArray forKey:@"Data"];
                                                  completion(dict, nil);
                                              }
                                              else {
                                                  NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                                                  completion(jsonDictionary, nil);
                                                  
                                              }
                                          }else{
                                              completion(nil, [self convertError:data response:response]);
                                          }
                                      }];
        
        [task resume];

}

- (void)sendPUT:(NSString *)url queryParams:(id)queryParams body:(id)body completionHandler:(LRAPIResponseHandler)completion {
    
        NSError* error;
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error: &error];
        
        NSURL *requestUrl = [NSURL URLWithString:[_baseURL.absoluteString stringByAppendingString:queryParams ? [url stringByAppendingString:[queryParams queryString]]: url]];
        
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        
        [request setHTTPMethod:@"PUT"];//use PUT
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-length"];
        [request setHTTPBody:jsonData];//set data
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                          
                                          if([httpResponse statusCode] == 200){
                                              
                                              NSError *jsonError = nil;
                                              id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                                              
                                              if ([jsonObject isKindOfClass:[NSArray class]]) {
                                                  NSArray *jsonArray = (NSArray *)jsonObject;
                                                  NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                                                  [dict setObject:jsonArray forKey:@"Data"];
                                                  completion(dict, nil);
                                              }
                                              else {
                                                  NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                                                  completion(jsonDictionary, nil);
                                                  
                                              }
                                          }else{
                                              completion(nil, [self convertError:data response:response]);
                                          }
                                      }];
        
        [task resume];
}

- (void)sendDELETE:(NSString *)url queryParams:(id)queryParams body:(id)body completionHandler:(LRAPIResponseHandler)completion {

        NSError* error;
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error: &error];

        NSURL *requestUrl = [NSURL URLWithString:[_baseURL.absoluteString stringByAppendingString:queryParams ? [url stringByAppendingString:[queryParams queryString]]: url]];
        
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        
        [request setHTTPMethod:@"DELETE"];//use DELETE
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-length"];
        [request setHTTPBody:jsonData];//set data
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                          
                                          if([httpResponse statusCode] == 200){
                                              
                                              NSError *jsonError = nil;
                                              id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                                              
                                              if ([jsonObject isKindOfClass:[NSArray class]]) {
                                                  NSArray *jsonArray = (NSArray *)jsonObject;
                                                  NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                                                  [dict setObject:jsonArray forKey:@"Data"];
                                                  completion(dict, nil);
                                              }
                                              else {
                                                  NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                                                  completion(jsonDictionary, nil);
                                                  
                                              }
                                          }else{
                                              completion(nil, [self convertError:data response:response]);
                                          }
         }];
        
        [task resume];
    
}



-(NSError*) convertError:(NSData *)data response:(NSURLResponse *)response{
    NSError *loginRadiusError;
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    
    if([httpResponse statusCode] == 0){
    loginRadiusError = [NSError errorWithCode:0 description:@"something went wrong or network not available please try again later" failureReason:@"something went wrong please try again later"];
    }else{
    
        NSError *jsonError;
        NSDictionary *payload = [[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError] dictionaryWithLowercaseKeys]; //lowercase all json dictionary keys
        if (!jsonError) { // HTTP Not acceptable errorCode. Deserialize LoginRadius Error if payload present
            
            if([payload objectForKey:errorCode]){
                if([payload[isProviderError] boolValue]) {
                    loginRadiusError = [NSError errorWithCode:[payload[errorCode] integerValue] description:payload[description] failureReason:payload[providerErrorResponse]];
                } else {
                    loginRadiusError = [NSError errorWithCode:[payload[errorCode] integerValue] description:payload[description] failureReason:payload[message]];
                }
                
            }else{
                NSString *convertedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                if ([response.MIMEType  isEqual: @"application/javascript"])
                {
                    loginRadiusError = [NSError errorWithCode:0 description:convertedString failureReason:convertedString];
                }else
                {
                    loginRadiusError = [NSError errorWithCode:1 description:convertedString failureReason:convertedString];
                    
                }
            }
        }
    }
             return loginRadiusError;
    
}

-(NSData*) convertJSONPtoJSON: (NSData*)jsonpData
{
    NSString *jsonString = [[NSString alloc] initWithData:jsonpData encoding:NSUTF8StringEncoding];
    NSRange range = [jsonString rangeOfString:@"("];
    range.location++;
    NSRange rangeBack = [jsonString rangeOfString:@")" options:NSBackwardsSearch];
    range.length = rangeBack.location - range.location;
    jsonString = [jsonString substringWithRange:range];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return jsonData;
}

@end
