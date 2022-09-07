#じゃんけん→あっち向いてホイの流れをjankenメソッドで用意する
def janken

#NPCとプレイヤーのじゃんけんの手を判断するための配列を設定しておく
        jankens = ["グー","チョキ","パー","戦わない"]

#ジャンケン始めるための文言を表示し、プレイヤーに選択肢を提示する  
        puts "じゃんけん。。。"
        puts "0(グー)1(チョキ)2(パー)3(戦わない)のうち、１〜３のいずれかを入力してください。"

#プレイヤーは入力された数字から、NPCはrand変数にて出す手を変化させる
        player_hand = gets.chomp.to_i
        program_hand = rand(4)
            
        puts "ホイ！"
        puts "----------"
                
#じゃんけんでお互いの手を一度表示させる
        puts "あなた：#{jankens[player_hand]}"
        puts "相手：#{jankens[program_hand]}"
        puts "----------"

#ゲーム終了の場合
        if player_hand == 3 || program_hand == 3
                puts "勝負が放棄されました。ゲームを終了します。"
                exit
#numberを新たに設定し、計算結果によって勝ち、負け、あいこの場合で条件分岐する
        else 
                number = player_hand - program_hand
                case number
#あいこの場合
                when 0 
                        puts "あいこで。。。"
                        return true
#勝ちの場合、あっち向いてホイに移行する
                when -1 , 2 
                        puts "あっち向いて。。。"
                        puts "0(上)1(下)2(左)3(右)のうち、0~3のいずれかを入力してください。"
#janken_resultにwinを格納しておく
                        janken_result = "win"
#負けの場合、あっち向いてホイに移行する
                when 1 , -2
                        puts "あっち向いて。。。"
                        puts "0(上)1(下)2(左)3(右)のうち、0~3のいずれかを入力してください。"
#janken_resultにloseを格納しておく
                        janken_result = "lose"
                end
        end
                
#以下より、あっち向いてホイの流れを組んでいく
#NPCとプレイヤーであっち向いてホイをするための配列を準備しておく
        directions = ["上","下","左","右"]

#じゃんけんを終えた際のjanken_resultの戻り値を元に、あっち向いてホイを開始する
        player_direction = gets.chomp.to_i
        program_direction = rand(4)
        puts "ホイ！"
        puts "----------"

#プレイヤーとNPCの向く方向によって、条件分岐させる
#❶プレイヤーが指を指す役でかつNPCが同じ方向を向いた場合に、「プレイヤーの勝ち」と表示する
        if janken_result == "win" && player_direction == program_direction
            　　puts "あなた：#{directions[player_direction]}"
                puts "相手：#{directions[program_direction]}"
                puts "----------"
                puts "あなたの勝ちです。"
            #決着がついたため、next_hoiの戻り値としてfalseを渡す
            　　next_hoi = false
                
            #❷NPCが指を指す役でかつプレイヤーが同じ方向を向いた場合に、「プレイヤーの負け」と表示する
        elsif janken_result == "lose" && player_direction == program_direction
                puts "あなた：#{directions[player_direction]}"
                puts "相手：#{directions[program_direction]}"
                puts "----------"
                puts "あなたの負けです。"
            #決着がついたため、next_hoiの戻り値としてfalseを渡す
                next_hoi = false
            
            #❸それ以外の場合にはあっち向いてホイの勝敗はつけず、じゃんけんから再度挑戦させる.
        else
                puts "あなた：#{directions[player_direction]}"
                puts "相手：#{directions[program_direction]}"
                puts "----------"
                puts "決着がつかなかったため、じゃんけんからやり直します。"
                return true
        end
end

#各種変数に初期値を格納しておく
next_janken = true
next_hoi = true
janken_result = "win"

#jankenメソッドを繰り返し、あっち向いてホイで勝敗がついた時点で繰り返しから抜ける
while next_janken do
        next_janken = janken
end