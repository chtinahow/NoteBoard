//

//  example.m

//  Notes

//

//  Created by Student on 6/10/15.

//  Copyright (c) 2015 Student. All rights reserved.

//



#import "example.h"



@interface example()



@property BOOL created;



@end





@implementation example





#pragma mark



- (void) didMoveToView:(SKView *)view{
    
    if(!self.created){
        
        [self createScene];
        
        self.created = YES;
        
    }
    
}



- (void)createScene{
    
    self.backgroundColor = [SKColor grayColor];
    
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    SKSpriteNode *pap = [self paperNode];
    
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    
    
    //add date
    SKLabelNode *date = [self dateNode];
    date.position = CGPointMake(-470, 340);
    [pap addChild:date];
    
    
    
    //Add example
    
    SKLabelNode *example = [self exampleNode];
    
    example.position = CGPointMake(0, 230);
    
    [pap addChild:example];
    
    
    
    SKNode *e1 = [self ex1];
    
    e1.position = CGPointMake(-270, 150);
    
    [pap addChild:e1];
    
    SKNode *e2 = [self ex2];
    e2.position = CGPointMake(-180, 100);
    [pap addChild:e2];
    
    SKNode *e7 = [self ex7];
    e7.position = CGPointMake(-180, 50);
    [pap addChild:e7];
    
    SKNode *e3 = [self ex4];
    e3.position = CGPointMake(-180, 0);
    [pap addChild:e3];
    
    
    SKNode *e4 = [self ex3];
    e4.position = CGPointMake(-60, -50);
    [pap addChild:e4];
    
    SKNode *e5 = [self ex5];
    e5.position = CGPointMake(-140, -100);
    [pap addChild:e5];
    
    SKNode *e6 = [self ex6];
    e6.position = CGPointMake(-150, -150);
    [pap addChild:e6];
    
    
    [self addChild:pap];
    
    
    
    
    
}



- (SKNode *) ex1{
    
    SKNode *nerdText = [SKNode node];
    
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    
    a.fontSize = 15;
    
    a.fontColor = [SKColor blackColor];
    
    SKLabelNode *b = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    
    b.fontSize = 15;
    
    b.fontColor = [SKColor blackColor];
    
    NSString *messag1 = @"Example 1: Prove the following statement by Contradiction.";
    
    NSString *message2 = @"There is no greatest even integer.";
    
    /*NSString *message3 = @"Proof:Suppose not. [We take the negation of the theorem and suppose it to be true.] Suppose there is greatest even integer N. [We must deduce a contradiction. Then]";
     
     NSString *m4 = @"For every even integer n, N ≥ n.";
     
     NSString *m5 = @"Now suppose M = N + 2. Then, M is an even integer. [Because it is a sum of even integers.] Also, M > N [since M = N + 2]. Therefore, M is an integer that is greater than the greatest integer. This contradicts the supposition that N ≥ n for every even integer n. [Hence, the supposition is false and the statement is true.]";*/
    
    b.position = CGPointMake(b.position.x, b.position.y - 20);
    
    a.text =messag1;
    
    b.text = message2;
    
    
    
    [nerdText addChild:a];
    
    [nerdText addChild:b];
    
    
    
    return nerdText;
    
}

- (SKNode *) ex2{
    
    SKNode *nerdText = [SKNode node];
    
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    
    a.fontSize = 15;
    
    a.fontColor = [SKColor blackColor];
    
    NSString *message3 = @"Proof:Suppose not. [We take the negation of the theorem and suppose it to be true.]";
    a.position = CGPointMake(a.position.x, a.position.y - 30);
    
    a.text =message3;
    
    [nerdText addChild:a];
    return nerdText;
    
}

- (SKNode *) ex4{
    SKNode *nerd = [SKNode node];
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    a.fontSize = 15;
    a.fontColor = [SKColor blackColor];
    a.text = @"Suppose there is greatest even integer N. [We must deduce a contradiction. Then]";
    [nerd addChild:a];
    
    return nerd;
}

- (SKNode *) ex3{
    
    SKNode *nerdText = [SKNode node];
    
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    
    a.fontSize = 15;
    
    a.fontColor = [SKColor blackColor];
    
    NSString *m5 = @"Now suppose M = N + 2. Then, M is an even integer. [Because it is a sum of even integers.] Also, M > N [since M = N + 2].";
    a.position = CGPointMake(a.position.x, a.position.y - 30);
    
    a.text =m5;
    
    [nerdText addChild:a];
    return nerdText;
    
}

- (SKNode *) ex5{
    SKNode *nerd = [SKNode node];
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    a.fontSize = 15;
    a.fontColor = [SKColor blackColor];
    a.text = @"Therefore, M is an integer that is greater than the greatest integer. This contradicts the supposition that N ≥ n for every even integer n.";
    [nerd addChild:a];
    
    return nerd;
}

- (SKNode *) ex6{
    SKNode *nerd = [SKNode node];
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    a.fontSize = 15;
    a.fontColor = [SKColor blackColor];
    a.text = @"[Hence, the supposition is false and the statement is true.]";
    [nerd addChild:a];
    
    return nerd;
}

- (SKNode *) ex7{
    SKNode *nerd = [SKNode node];
    SKLabelNode *a = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    a.fontSize = 15;
    a.fontColor = [SKColor blackColor];
    a.text = @"[Suppose there is greatest even integer N. [We must deduce a contradiction. Then]";
    [nerd addChild:a];
    
    return nerd;
}
#pragma mark



- (SKSpriteNode *)paperNode{
    
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(1024, 768)];
    
    
    
    return paper;
    
}



#pragma mark



- (SKLabelNode *)dateNode{
    
    SKLabelNode *date = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    
    date.name = @"date";
    
    date.text = @"Date: ";
    
    date.fontSize = 30;
    
    date.fontColor = [SKColor blackColor];
    
    return date;
    
}



#pragma mark



- (SKLabelNode *)exampleNode{
    
    SKLabelNode *example = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    
    example.name = @"example";
    
    example.text = @"Example";
    
    example.fontSize = 30;
    
    example.fontColor = [SKColor blackColor];
    
    return example;
    
}



@end
