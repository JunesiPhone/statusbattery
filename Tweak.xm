

%hook UIStatusBarBatteryPercentItemView
	/*
		I'm pretty sure this is where the text is turned into an image.
		We can change the _percentString before that happens.
	*/
	-(id)contentsImage{
		MSHookIvar<NSString *>(self, "_percentString") = [NSString stringWithFormat:@"%@",[MSHookIvar<NSString *>(self, "_percentString") stringByReplacingOccurrencesOfString:@"%" withString:@""]];
		return %orig;
	}
%end

/*
	UIStatusBarBatteryPercentItemView is a subclass of UIStatusBarItemView
	So we can look on it to see when that is getting set.
	We don't want to change it here as imageWithText probably is used for other things too
	You could log here to see it's asking for an image with text though
*/

%hook UIStatusBarItemView
	-(id)imageWithText:(id)arg1{
		//NSLog(@"TestTweak1 Image with text %@", arg1);
		return %orig;
	}
%end



