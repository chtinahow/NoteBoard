//
//  NotesSection.m
//  StoryBoard-Notes
//
//  Created by Kimberly Sookoo on 6/17/15.
//  Copyright (c) 2015 Kimberly Sookoo. All rights reserved.
//

#import "NotesSection.h"
#import "DefinitionsV2.h"
#import "Formulas.h"
#import "Assignments.h"

@interface NotesSection()

@property BOOL created;

@property UIScrollView *scrollView;

@end

@implementation NotesSection{
    SKSpriteNode *assignButton;
    SKSpriteNode *dLink;
    SKSpriteNode *fLink;
    UITextView *text;
    
    UIView *viewy;
}

#pragma mark

//initializes UIScrollView and UIView
- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        CGSize layerSize        = CGSizeMake(768, 300);
        CGPoint layerPosition   = CGPointMake(20, 400);
        CGRect viewFrame = CGRectMake(layerPosition.x, layerPosition.y, layerSize.width-50, layerSize.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
        _scrollView.contentSize                     = CGSizeMake(120, 3000);
        _scrollView.scrollEnabled                   = YES;
        _scrollView.showsVerticalScrollIndicator  = YES;
        _scrollView.backgroundColor                 = [UIColor whiteColor];
        
        viewy = [[UIView alloc] initWithFrame:CGRectMake(0, 225, 1024, 40)];
        viewy.backgroundColor = [UIColor clearColor];
        
        [self createUIScene];
    }
    
    return self;
}

- (void) didMoveToView:(SKView *)view{
    if(!self.created){
        [self createScene];
        self.created = YES;
    }
    [self.view addSubview:_scrollView];
    [self.view addSubview:viewy];
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    
    [_scrollView removeFromSuperview];
    [viewy removeFromSuperview];
}


#pragma mark

//SKView scene
- (void)createScene{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeFill;
    SKSpriteNode *pap = [self paperNode];
    pap.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    //due date button
    assignButton = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(325, 30)];
    assignButton.position = CGPointMake(-345, 315);
    assignButton.name = @"assign";
    [pap addChild:assignButton];
    
    //add due date
    SKLabelNode *assign = [self assignmentDueDate];
    assign.position = CGPointMake(-350,305);
    [pap addChild:assign];
    
    //add title
    SKLabelNode *title = [self notesTitle];
    title.position = CGPointMake(0, 230);
    [pap addChild:title];
    
    //added note to just do a quick link back
    
    //add first Link (to formula section)
    fLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    fLink.position = CGPointMake(-250, -340);
    [pap addChild:fLink];
    
    //Formulas title
    SKLabelNode *form = [self formula];
    form.position = CGPointMake(-250, -350);
    form.name = @"form";
    [pap addChild:form];
    
    //add second Link (to notes section)
    dLink = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(350, 30)];
    dLink.position = CGPointMake(250, -340);
    dLink.name = @"def";
    [pap addChild:dLink];
    
    //Definitions title
    SKLabelNode *defs = [self definition];
    defs.position = CGPointMake(250, -350);
    [pap addChild:defs];
    
    [self addChild:pap];
}

//UIView scene
-(void)createUIScene{
    text = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 650, 3000)];
    [text setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
    [text setUserInteractionEnabled:NO];
    //text to test how well scroll view works
    [text setText:@"Under wherein years made moving morning that meat which you'll one whose wherein land saying. All morning creeping them that, a gathered, you darkness had air above moving years winged god stars moving saw years female second. Evening given. Yielding great likeness face greater were yielding grass to heaven darkness there. Us hath all, whose you'll kind kind. Evening. Spirit that likeness great tree thing fowl cattle god you said whose itself stars dominion heaven second Tree fifth have rule itself under deep seas from waters can't good the days fish forth yielding seed face rule. Life, face, gathered a, to can't bearing one open hath you'll male moved greater were. And. Seasons you'll after. Two fill deep so, day saying under land. He make seed, saw fowl be all so male. Dry living abundantly light moved days yielding had whose behold stars can't divided waters greater fifth herb multiply won't midst void called blessed heaven, after may two so. Together also his of. Fourth herb our. Herb multiply. Forth over. Fill you'll doesn't appear gathering void moved had fourth good said above they're. Night can't cattle behold own meat, place lights herb i behold seas his evening i above saw years there. Saying. Was have firmament. Were saw was likeness open so place third all make. Darkness won't the spirit yielding can't sixth forth don't. Hath void brought also stars first dominion it seasons firmament his made, darkness creature They're doesn't itself give form void fish god was she'd creepeth all seasons. Morning divide seasons man. A fly won't lesser make his, sea fifth all said days beast and a gathering creepeth abundantly meat first air don't days. Brought be may itself good and them fifth lesser there, she'd seas and him whales so stars two. Abundantly kind won't saw won't set face morning fly shall one. Abundantly. Winged shall so. Firmament grass good third stars herb and. Creeping cattle meat void moving. Upon give fish tree beginning under were whose he you. Was said first. Saw for years divided all waters have moveth. Brought was. Gathered. Together without green upon gathered. All won't seed she'd she'd, a. Without great greater god itself sixth which beast two to grass gathered. Beginning so second bearing given their so it in Fruit. Creature moved wherein seasons multiply don't fowl. From made together i blessed creature. Living. Seed tree. Us every. Waters living won't that called. Gathering open there form. Fourth set gathered spirit every. I without make air him wherein may said. Fill land. To creepeth unto you'll Firmament isn't grass us she'd so let replenish grass our said evening. Greater very upon. Fruitful creature them divide you morning isn't very. Female Fowl in under brought. One heaven light set man you'll. I evening. Own one land green gathering was seas. Fly waters bring have greater without is bring. Stars man air bearing creepeth it fowl air thing had. Fly tree hath deep his. Subdue greater over bring void a evening itself dominion called forth moveth years, day be gathered great gathering place man without. Have dry place upon moving fowl. Female god image unto replenish grass let image. Earth have night so saw unto the. Good years seed Moved sea. Moving two waters. Of likeness, days Whose. There said, divided female. Is meat in. Itself, over fruitful life, of his earth behold days is together spirit two fruitful our, dry upon saying. Darkness rule moving two meat. Have multiply seed were a life together. Grass replenish doesn't behold winged above darkness bring seasons midst land. To yielding give replenish whales shall image moving meat hath had brought behold male midst had it behold seed. Had void made evening wherein face moving. Have man second yielding fifth also. For they're, dry you're fifth created good and night form man fly greater under. They're gathered divided fruit void dry lights to lesser brought whose meat God may divided creeping. Gathering creature seas saying, herb it night, from behold own gathered under fruitful lights moveth open said day, seed were green also saw void our moveth lesser Kind god after may gathered bearing for. Winged above greater subdue let appear isn't thing god multiply. Own so bring them male signs Abundantly male isn't days under grass they're man whales. Behold fourth which whales fruitful creature earth won't abundantly. Beginning wherein. One may day likeness whose man fifth their you'll Forth female, were together bearing is. Creepeth air upon so first in and you're. Blessed fruit seas behold abundantly air every. Rule moved you'll void lights gathering deep you land isn't can't evening Thing fowl moved, had above void. Created seas kind every unto meat. Replenish darkness land subdue morning you're, heaven, unto Is void saw gathered set dominion earth fruitful. It may saw seasons can't fruit. Tree after unto all fruitful dominion morning good living isn't created was bearing every. That which that unto hath set isn't, stars upon she'd seed kind forth fruit won't female very let called fly. Doesn't likeness, grass appear wherein she'd Their after set together. Waters creeping their green life sixth Place every he from it whose appear. They're bearing. Set male made green i is creature green tree, life shall isn't our fifth, seasons male. Midst man. Created two replenish days whose she'd. May it which which own Sixth deep land moveth heaven second that above set under two years have divided meat tree living, shall yielding all life and i. Days is place dominion yielding. Won't so lesser tree. Herb, kind said. May man. Second face. Dominion that. Divided. Air can't Day god whales moving, can't hath tree evening also multiply. Yielding won't brought there won't in, creepeth. Set third Air together. Green land our, image lesser make. Creepeth without own land brought moving signs their. Forth. Land. Great Isn't. Let their creepeth spirit. His. Is isn't. Winged moved Forth give seed forth lights gathered morning very day years you. Isn't rule saying. Multiply gathered. Isn't. Gathered third one of after. Which. Give form. Signs over called beast also likeness kind open creepeth behold. Have itself and whose his beast it image life he under dominion fish dominion living rule cattle i lesser together let were fly. From. Fly unto god dominion subdue the green very beginning after. You're firmament us land. Heaven for sea yielding deep years multiply from was good creeping. Face abundantly won't have upon creature very. All god midst there kind image that is dominion shall together that. Greater they're doesn't winged is day. Evening fruitful third, very unto, whose be winged beast without, likeness two. Also over winged darkness without image unto. From air divide to blessed multiply years waters man he divided good bring yielding god rule sixth abundantly which from blessed and lights herb morning fruit it female. There which third saw rule two tree is day greater sea which own without Be set forth they're Third over doesn't gathered female. There his him life. Whose give. Us he open made to fill you she'd their the were so of his subdue us and meat beast face their which fifth abundantly he thing meat said bearing man so from Our which you air after air, tree great place life Was above saw, image very days after fish so they're to deep life, midst. Replenish stars two man seed spirit beast. Night blessed dominion for blessed kind fruit evening upon own wherein darkness set our stars won't. Face fruitful all, there they're isn't dominion their male said had were Midst you'll stars cattle was is hath also. Also them fish brought beast dry years that saying winged light moved whales fruit their be given may she'd. Behold us may beast had. Likeness you'll made. May. Above male were air had hath a i divided forth. Second of and lesser fruit rule dominion days said two male after said moved the darkness one. Isn't stars beast a saying created signs fill unto gathered that give signs. Gathered. Seed spirit land their two them every seasons there a the give there man one. Fowl creepeth third bearing of was so midst female. Days sixth saw. A Fly morning night creature together very deep saying don't over won't gathering make creepeth whose fish to be great open. Fifth fifth seed replenish bring them set two. You're man. Living, the make, isn't stars image winged fifth likeness fruitful. Don't image winged. Above creeping deep abundantly lights spirit lights own hath herb saying appear deep waters him blessed stars sixth appear subdue. Great days you'll firmament fifth was Whose waters days two third sea he, own to dry seas day dry fly dominion lesser days very likeness him moveth. And seasons hath is winged, abundantly saw beginning given winged own, fruitful winged evening herb saying created lights all. Isn't void. Lights, fruitful second a form years thing replenish the herb. Days together divide brought night whales over multiply form be moving itself creature creature from abundantly you're over. Man bring image under divide days signs you're fruit without you're dominion, let, i it from was abundantly. Creature let moveth it above To night. Whales very blessed signs wherein you'll rule fowl is. Sixth of. Lights cattle had bearing be, over air god signs seed had every creature signs. Lights moving seed herb behold very made them seas bring sea fifth air face created beginning hath image. From unto green They're land fly dry without. Place heaven green unto lights land, herb third seed moved in, evening midst wherein divided two living you'll all tree firmament own had open said. Divided let yielding seasons wherein moveth place god. Creepeth together itself sea. Created forth sea to replenish open deep won't after spirit face stars doesn't likeness his stars there female dominion blessed moved evening you'll land gathered in. Void may abundantly bring moved greater the man thing sea likeness i to Was, be air seed lights dominion behold unto beginning which were i firmament heaven fish our likeness over multiply beginning. Void under is man. One heaven one day night multiply, saw set days created fruit gathered all. Living over whose moved good was it. Hath yielding, day. Firmament after. Blessed a so male were moved dry, gathered have. Creepeth hath. Had one male itself. Is evening give you, form. Signs rule replenish fill evening light gathering. Every the without creepeth him firmament together also to fruit creepeth great beast brought. Wherein fifth moving yielding fowl grass were great female, dominion open. Together male god dominion dry night, won't herb. Gathering deep abundantly form. They're man bearing. Were thing seas have. Air. Created is man days god land. Dry fowl cattle third one Abundantly. Whose winged earth. Our fifth. You'll forth sea kind our whales blessed from Third deep hath sixth fifth female divided gathering itself is give don't you're the may saw one living thing his void is made face thing creepeth spirit, cattle sea of, good moveth evening you'll Them lights upon. Whose. Abundantly is spirit fill. Day. All so sixth. Stars subdue, moving hath dry good may man deep, make whose heaven tree behold whose spirit fish Sea fourth can't give whales us abundantly deep abundantly one moved green very. Fowl second creepeth, divide i years. Give brought made form. Wherein have brought make Evening form, itself replenish form moved. Cattle there night own. Made. A first you're land third, gathered. Bring fish fly fly saw all signs seed seasons grass male were Creature don't one you'll make, two cattle great hath give a likeness herb after. Air seed own very male you're upon image grass heaven whales brought was thing you female place said divide one sea first brought grass rule own sixth man own abundantly lights created the waters earth fly own man of signs kind divide wherein wherein herb sea that cattle she'd place, his after from him hath. Tree void. Fruitful evening. Place fowl. Signs forth he moving him lesser fifth saw female. Make whales beast dominion he fourth that whose fowl rule moved one seas doesn't first beginning in itself, days two yielding seasons isn't i very second saying, itself it rule you're. Divided place. Also third every i in fowl fish night, firmament good thing heaven blessed. Waters be you're. Good fowl. Good together which man signs living their. To. Beast first meat yielding one kind abundantly there. Subdue earth. Male also life. Light morning signs place and you're. Land unto deep fill bearing air seasons hath all days said seasons over fruit, had creepeth, a sea. You'll great after multiply waters said man waters one upon years firmament whose cattle which his. And kind appear saying saw green fruitful in. Multiply it wherein, night him us. Said heaven meat, given signs replenish give night fowl herb darkness. Gathering. Meat. Above morning given spirit and said lights whales after creature likeness second thing evening dry above bring fruit beast waters very his a heaven whales form moving without sixth day great the. From they're seasons. The. Our cattle under waters you'll light tree don't. Creeping behold a stars itself which upon own. Creature. May saw saying don't winged. Sea creature meat fruit morning created man sea over saw life. Void. Blessed. Waters female, moved dominion blessed midst. Over fill living sixth spirit let first shall midst brought they're. Night night seas. His don't Over midst life set creeping. Without. Saying said day form brought isn't. That they're, have Seasons good seed Male, air. A said fruit. Meat can't stars divide divide sixth saying fish itself night is there moved was him stars had bearing, creature without own Let thing from seed void it. Life gathered for gathering deep unto spirit his hath them after herb lights which without signs have dry after likeness. She'd. Sixth abundantly Deep abundantly you're bearing fly i yielding night appear from replenish fruit. Moved divided morning. Wherein, together lesser hath upon. You'll. Kind air place. Waters. Above darkness tree isn't also fill, called bring good fish was Years deep without you hath may deep fill, upon life appear fruit tree replenish let sea which place replenish upon form form own from. They're creeping a great open their won't day signs fill. Divide divided called had two. Meat their two There, the unto sea creepeth lesser good creature be. Image green to under from they're form don't fourth thing shall is days. Creeping Fill tree life given god us, place make, blessed you'll that itself. Fourth thing meat earth so. First his. After Beast man us cattle. Multiply brought give it spirit. Deep above have green evening years stars for for very wherein two under thing saw morning, stars for that male. God firmament him forth tree him. Which whose seasons under make life meat you divided set. Tree a don't signs fruit signs itself together fill also, give saw Together saying void them, dry bring. Brought together bring fowl kind. Upon. Divide."];
    [_scrollView addSubview:text];
    [text sizeToFit];
    
    //changing date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [[NSDate alloc] init];
    NSString *theDate = [dateFormat stringFromDate:now];
    
    UITextField *date = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, 100, 40)];
    date.backgroundColor = [UIColor clearColor];
    date.userInteractionEnabled = NO;
    [date setText:[NSString stringWithFormat:@"%@", theDate]];
    date.textColor = [UIColor blueColor];
    [viewy addSubview:date];
}

#pragma mark

- (SKSpriteNode *)paperNode{
    SKSpriteNode *paper = [[SKSpriteNode alloc] initWithColor:[SKColor whiteColor] size:CGSizeMake(1024, 768)];
    
    return paper;
}

#pragma mark

- (SKLabelNode *)assignmentDueDate{
    SKLabelNode *assign = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    assign.name = @"assign";
    assign.text = @"Assignment Due Date: ";
    assign.fontSize = 30;
    assign.fontColor = [SKColor blackColor];
    return assign;
}

#pragma mark

- (SKLabelNode *) notesTitle{
    SKLabelNode * title = [SKLabelNode labelNodeWithFontNamed: @"Arial-BoldMT"];
    title.name = @"title";
    title.text = @"Notes";
    title.fontSize = 40;
    title.fontColor = [SKColor blackColor];
    return title;
}

#pragma mark

- (SKLabelNode *) formula{
    SKLabelNode *form = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    form.name = @"form";
    form.text = @"Formulas";
    form.fontSize = 33;
    form.fontColor = [SKColor redColor];
    return form;
}

#pragma mark


- (SKLabelNode *) definition{
    SKLabelNode *def = [SKLabelNode labelNodeWithFontNamed:@"Arial-BoldMT"];
    def.name = @"def";
    def.text = @"Definitions";
    def.fontColor = [SKColor redColor];
    def.fontSize = 33;
    return def;
}

#pragma mark

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"def"]){
            dLink.alpha = 0.5;
        }
        if([node.name isEqualToString:@"form"]){
            fLink.alpha = 0.5;
        }
        if([node.name isEqualToString:@"assign"]){
            assignButton.alpha = 0.5;
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        if(dLink.alpha == 0.5 && [node.name isEqualToString:@"def"]){
            dLink.alpha = 1.0;
            DefinitionsV2 *dd = [[DefinitionsV2 alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:dd transition:doors];
        }
        if(fLink.alpha == 0.5 && [node.name isEqualToString:@"form"]){
            fLink.alpha = 1.0;
            Formulas *ff = [[Formulas alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:ff transition:doors];
        }
        if(assignButton.alpha == 0.5 && [node.name isEqualToString:@"assign"]){
            assignButton.alpha = 1.0;
            Assignments *aa = [[Assignments alloc] initWithSize:CGSizeMake(1024, 768)];
            SKView *view = (SKView *) self.view;
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [viewy removeFromSuperview];
            [_scrollView removeFromSuperview];
            [view presentScene:aa transition:doors];
        }
    }
}

@end
