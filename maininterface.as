// ActionScript file
import src.mgr;

[Bindable]

	var _myMgr:mgr;

	function creationComplete(incm:ZZZ_Flex_Project_Root){
	
		//var myMgr:mgr=new mgr();
		var myMgr:mgr = new mgr();
		_myMgr = myMgr;
		myMgr.incm(incm);
	
	}

	function buttontest(incm:ZZZ_Flex_Project_Root):void{
		_myMgr.logincheck();
	}	

