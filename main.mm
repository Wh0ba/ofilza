@import UIKit;
#import <LSApplicationWorkspace.h>


NSString* absPathForFileAtPath(NSString* spath);



void pUsage(){
	
	printf("ofilza opens given path in Filza \n usage: ofilza pathToOpen \n ");
	
	
}



NSFileManager *fm;


int main(int argc, char **argv, char **envp) {
	
	fm = [NSFileManager defaultManager];
	
	
	
	if (argc > 1) {
		
		NSString *spath = [NSString stringWithUTF8String:argv[1]];
		
		if (![fm fileExistsAtPath:spath] || ![[spath substringToIndex:1] isEqualToString:@"/"]) {
			
			NSString *tmpPath = absPathForFileAtPath(spath);
			if ([tmpPath isEqualToString:@"FNF"]) {
				
				printf("File or directory not found \n");
				
				pUsage();
				
				return 22;
			}
			spath = [tmpPath copy];
			
		}
		
		
		NSString *strpath = [NSString stringWithFormat: @"filza://%@",spath];
		
		NSURL *urlp = [NSURL URLWithString:strpath];
		
		LSApplicationWorkspace* lsWk = [LSApplicationWorkspace defaultWorkspace];
		
		[lsWk openURL:urlp]; 
		
	}else {
	pUsage();
	return 1;
	}
	
	
	
	
	
	return 0;
}

// vim:ft=objc

NSString* absPathForFileAtPath(NSString* spath) {
	
	static NSString *nPath;
	
	NSString *tmp = [fm currentDirectoryPath];
	tmp = [tmp stringByAppendingPathComponent:spath];
	if (![fm fileExistsAtPath:spath]) {
			return @"FNF";
		}
	nPath = [tmp stringByStandardizingPath];
	
	
	return nPath;
	
}
