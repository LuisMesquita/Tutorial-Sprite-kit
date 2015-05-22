//
//  GameScene.m
//  Animando o player
//
//  Created by Luis Barroso on 20/05/15.
//  Copyright (c) 2015 Yo. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene{
    SKSpriteNode *_Player;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKTexture* playerTexture1 = [SKTexture textureWithImageNamed:@"mov1 2"];
    playerTexture1.filteringMode = SKTextureFilteringNearest;
    SKTexture* playerTexture2 = [SKTexture textureWithImageNamed:@"mov2 2"];
    playerTexture2.filteringMode = SKTextureFilteringNearest;
    SKTexture* playerTexture3 = [SKTexture textureWithImageNamed:@"mov3 2"];
    playerTexture3.filteringMode = SKTextureFilteringNearest;
    SKTexture* playerTexture4 = [SKTexture textureWithImageNamed:@"mov4 2"];
    playerTexture4.filteringMode = SKTextureFilteringNearest;
    
    SKAction* movimento = [SKAction repeatActionForever:[SKAction animateWithTextures:@[playerTexture1,playerTexture2,playerTexture3,playerTexture4] timePerFrame:0.2]];
                           
    
    _Player = [SKSpriteNode spriteNodeWithTexture:playerTexture1];
                           [_Player setScale:2];
                           _Player.position = CGPointMake((self.frame.size.width/2), (self.frame.size.height/2));
    [_Player runAction:movimento];
    
    [self addChild:_Player];
    
  
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
