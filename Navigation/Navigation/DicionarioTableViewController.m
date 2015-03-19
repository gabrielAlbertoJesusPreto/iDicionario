//
//  DicionarioTableViewController.m
//  Navigation
//
//  Created by Gabriel Alberto de Jesus Preto on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioTableViewController.h"
#import "Palavras.h"
#import "Palavra.h"

@interface DicionarioTableViewController (){
    Palavras *dicionario;
}

@end

@implementation DicionarioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dicionario = [Palavras getInstance];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[dicionario palavras] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    UILabel *labelPalavra = [[UILabel alloc] initWithFrame:CGRectMake(200,45, self.view.frame.size.width, 18)];
    int index=indexPath.row;
    Palavra *objeto = [dicionario.palavras objectAtIndex:index];
    [labelPalavra setText:[objeto palavra]];
    
     UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 70, 70)];
    imageView.image = [objeto imagem];
    
    
    NSString *letra = [[labelPalavra text] substringToIndex:1];
    UILabel *letraLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 39, 40, 30)];
    [letraLabel setText:letra];

    letraLabel.font = [UIFont fontWithName:@"Helvetica" size:30.0];
    letraLabel.textColor = [UIColor blueColor];
    
    [cell addSubview:letraLabel];
    [cell addSubview:imageView];
    [cell addSubview:labelPalavra];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
