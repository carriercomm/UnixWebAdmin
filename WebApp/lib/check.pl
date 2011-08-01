use Data::Dumper;
require ProcessHandler;
require UserHandler;

sub checkProcessList(){
	my $list = &ProcessHandler::proclist();
	foreach my $pid (keys %$list)
	{
	print $pid,"\t", $list->{ $pid },"\n";
	}
};
sub checkFindUser()
{
	print "Checking FindUser\n";
	my $username = $ENV{USER} || $ENV{USERNAME};
	my $exist = &UserHandler::FindUser($username);
	if($exist) 
	{ print "User $username exist in passwd\n"; }
	$username = "cats";
	$exist = &UserHandler::FindUser($username);
	if($exist)
	{ print "User $username exist in passwd\n";}

};
sub checkUserPass()
{
	print "Checking VerifyPassword\n";
	my $username = "zimbler";
	my $password = "Echo Team";
	my $password2 = "black123";
	if (&UserHandler::VerifyPassword($username,$password2))
		{
			print "Error has occured\n";
		}
	if(&UserHandler::VerifyPassword($username,$password))
		{
			print "correct password given $password\n";
		}
	else
	{
		print "Correct password incorrect $password\n";
	}
};

sub checkGetGroups()
{
	my $hash = &UserHandler::GetAllGroups();
	print $hash, "\n";
	print Dumper($hash),"\n";
}
sub checkAddNewGroup()
{
	my $val = &UserHandler::AddNewGroup("TestGroup1", 1500);
	print $val, "\n";
	$val = &UserHandler::AddNewGroup("TestGroup2", 1500);
	print $val, "\n";
}
sub main()
{
	#checkProcessList();
	#checkFindUser();
	#checkUserPass();
	checkGetGroups();
	checkAddNewGroup();
}


main();
