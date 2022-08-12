//
//  IxHttpRequest.h
//  IxKeypadManageHelper
//
//  Created by hildolfr on 2021/11/23.
//

#import <Foundation/Foundation.h>

@interface IxHttpRequest: NSObject
{
    NSMutableData *receivedData;
    NSURLResponse *response;
    NSString *result;
    id target;
    SEL selector;
}

- (BOOL)requestUrl:(NSString *)url bodyObject:(NSDictionary *)bodyObject;
- (BOOL)requestUrlbyQuery:(NSString *)url bodyObject:(NSString *)bodyObject;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)setDelegate:(id)aTarget selector:(SEL)aSelector;

@property (nonatomic, retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSURLResponse *response;
@property (nonatomic) NSString *result;
@property (nonatomic) id target;
@property (nonatomic, assign) SEL selector;
@end
