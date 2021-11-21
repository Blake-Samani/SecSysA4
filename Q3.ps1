#this script runs a rock paper scissors game
$ou_rock = @{
    scissors = 0;
    paper = 1;
}

$osu_paper = @{
    rock = 0;
    scissors = 1;
}

$ocu_scissors = @{
    paper = 0;
    rock = 1;
}
$uco_rand = @{
    scissors = 0;
    paper = 0;
    rock = 0;
}

$rps = $ou_rock, $osu_paper, $ocu_scissors, $uco_rand;


$p1points = 0;
$cpupoints = 0;
$playerwin = 0;
$cpuwin = 0;
$gamestate = 1;
$cpuchoice = 0;
$cpurand = 0;

while($gamestate -eq 1){ #while game is not over, 0 would be game over state
Write-Host "Please enter a school, Choices are UCO, OCU, OU, OSU" -ForegroundColor Magenta
$input = Read-Host 


if($input -eq "UCO" -or $input-eq "OCU" -or $input -eq "OU" -or $input -eq "OSU" -or $input -eq "Q"){

    if($input -eq "OU"){ #p1 chooses rock
    $cpurand = Get-Random -Minimum 0 -Maximum 4; #random number that isnt a tie
    $cpuchoice = $rps[$cpurand]
        if($cpuchoice.rock -eq 1){ #if cpu loses to rock
            $p1points += 1;
            Write-Host "YOU WON THIS ROUND, YOUR POINTS: $p1points" -ForegroundColor Green
            continue;
        }elseif ($cpuchoice.rock -eq 0){ #if cpu wins to rock
            $cpupoints += 1;
            Write-Host "CPU WON THIS ROUND, CPU POINTS: $cpupoints" -ForegroundColor Red
            continue;
        }else{ #else its a tie
            Write-Host "TIE ROUND, GO AGAIN" -ForegroundColor Cyan
            continue;
        }

    }
    if($input -eq "OSU"){ #p1 chooses paper
        $cpurand = Get-Random -Minimum 0 -Maximum 4; #random number that isnt a tie
        $cpuchoice = $rps[$cpurand]
        if($cpuchoice.paper -eq 1){ #if cpu loses to paper
            $p1points += 1;
            Write-Host "YOU WON YOU HAVE: $p1points" -ForegroundColor Green
            continue;
        }elseif ($cpuchoice.paper -eq 0){ #if cpu wins to paper
            $cpupoints += 1;
            Write-Host "CPU WON THIS ROUND, CPU POINTS: $cpupoints" -ForegroundColor Red
            continue;
        }else{ #else its a tie
            Write-Host "TIE ROUND, GO AGAIN" -ForegroundColor Cyan
            continue;
        }

    }
    if($input -eq "UCO"){ #p1 chooses UCO, AUTO WIN IF NOT TIE
        $cpurand = Get-Random -Minimum 0 -Maximum 4; #random number that isnt a tie
        $cpuchoice = $rps[$cpurand]
            if($cpuchoice.scissors -ne 3){ #if cpu loses to UCO
            $p1points += 1;
            Write-Host "YOU WON YOU HAVE: $p1points" -ForegroundColor Green
            continue;
            }
            else{ #else its a tie
            Write-Host "TIE ROUND, GO AGAIN" -ForegroundColor Cyan
            continue;
            }

    }

    if($input -eq "OCU"){ #p1 chooses scissors
        $cpurand = Get-Random -Minimum 0 -Maximum 4; #random number that isnt a tie
        $cpuchoice = $rps[$cpurand]
        if($cpuchoice.scissors -eq 1){ #if cpu loses to scissors
            $p1points += 1;
            Write-Host "YOU WON YOU HAVE: $p1points" -ForegroundColor Green
            continue;
        }elseif ($cpuchoice.scissors -eq 0){ #if cpu wins to scisoors
            $cpupoints += 1;
            Write-Host "CPU WON THIS ROUND, CPU POINTS: $cpupoints" -ForegroundColor Red
            continue;
        }else{ #else its a tie
            Write-Host "TIE ROUND, GO AGAIN" -ForegroundColor Magenta
            continue;
        }

    }

    if($input -eq "Q"){ #User quits
    Write-Host "Final Score:" -ForegroundColor DarkYellow
    Write-Host "-----------"-ForegroundColor DarkYellow
    Write-Host "Player: $p1points" -ForegroundColor Green
    Write-Host "CPU: $cpupoints" -ForegroundColor Red
    $gamestate = 0;
    }
    
}else{
    Write-Host "invalid input, please try again" -ForegroundColor Magenta
    continue
    }
}