package Money_Management is

	type Money_Type is delta 0.01 digits 15;

	-- € bills coins
	type EU_Bills is (
			five_EU, ten_EU, twenty_EU, 
			Fifty_EU, Hundred_EU, Two_Hundred_EU, 
			Five_Hundred_EU );

	type Bill_Count is 
			array EU_Bills of integer;

	type EU_Coins is (
			cent, Two_Cents, Five_Cents, 
			Ten_Cents, Twenty_Cents, 
			Fifty_Cents, One_EU, Two_EU);
			
	type Coin_Count is 
			array EU_Coins of integer;

	-- User classification oriented
	type Wallet is record
    	Bills:  Bill_Count;
    	Coins:  Coin_Count;
    	Total_Money: Money_Type;
			end record;

	million : constant Money_Type:= 1.0E6;

	end Money_Management;
