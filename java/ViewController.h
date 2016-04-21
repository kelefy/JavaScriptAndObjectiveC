//
//  ViewController.h
//  java
//
//  Created by kongfanyi on 16/4/21.
//  Copyright © 2016年 kongfanyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol jsmodeldelegate <JSExport>

-(void)callCamera:(NSString *)title;

@end

@interface ViewController : UIViewController


@end


@interface JSModel : NSObject<jsmodeldelegate>

@property (nonatomic,strong) JSContext *jsContext;

@end


@implementation JSModel

-(void)callCamera:(NSString *)title
{
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"提示内容" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alert show];
    NSLog(@"%@",title);
    
    JSValue *fun = self.jsContext[@"fun1"];
    [fun callWithArguments:@[@"helloword"]];
}

@end

