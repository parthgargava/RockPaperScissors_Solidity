contract RockPaperScissors1
{
    
    enum Choice{NONE, ROCK, PAPER, SCISSORS}
    struct Move
    {
        address player;
        Choice choice;
        
    }
    
    Move move1;
    Move move2;
    
    function RockPaperScissors1() public {
        move1.choice=Choice.NONE;
        move2.choice=Choice.NONE;
    }
    
    
    function submitChoice(Choice playerChoice) public payable
    {
        if(move1.choice==Choice.NONE)
        {
            move1.choice=playerChoice;
            move1.player=msg.sender;
            
        }
        
        else if(move2.choice==Choice.NONE)
        {
            move2.choice=playerChoice;
            move2.player=msg.sender;
            
        }
    }
    
    function payout() public 
    {
        if (move1.choice==move2.choice)
        {
            uint reward= this.balance/2;
            move1.player.transfer(reward);
            move2.player.transfer(reward);
            
        }
        
        else if (
            (move1.choice==Choice.ROCK && move2.choice==Choice.SCISSORS) ||
            (move1.choice==Choice.PAPER && move2.choice==Choice.ROCK) ||
            (move1.choice==Choice.SCISSORS && move2.choice==Choice.PAPER)
            )
            {
                move1.player.transfer(this.balance);
                
            }
        else {
            move2.player.transfer(this.balance);
        }
    }
}