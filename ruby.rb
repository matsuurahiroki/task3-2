# frozen_string_literal: true

def janken
  hands = ['グー', 'チョキ', 'パー']
  puts 'じゃんけん...'
  puts '0:グー 1:チョキ 2:パー'

  me = nil
  loop do
    me = gets.to_i
    break if (0..2).include?(me)
    puts '不正な値です。0〜2の数字を入力してください。'
  end

  enemy = rand(3)
  puts "あなた：#{hands[me]} vs 相手：#{hands[enemy]}"

  case [me, enemy]
  when [0, 0], [1, 1], [2, 2]
    puts 'あいこで...'
    return :draw
  when [0, 1], [1, 2], [2, 0]
    puts 'あなたの勝ち！'
    return :win
  else
    puts 'あなたの負け...'
    return :lose
  end
end

def acchimuite_hoi(result)
  directions = ['上', '下', '左', '右']
  puts 'あっち向いてホイ！'
  puts '0:上 1:下 2:左 3:右'

  me_dir = nil
  loop do
    me_dir = gets.to_i
    break if (0..3).include?(me_dir)
    puts '不正な値です。0〜3の数字を入力してください。'
  end

  enemy_dir = rand(4)
  puts "あなた：#{directions[me_dir]} vs 相手：#{directions[enemy_dir]}"

  if me_dir == enemy_dir
    if result == :win
      puts 'あなたの勝ちです！🎉'
    else
      puts 'あなたの負けです...'
    end
    return true
  else
    puts 'もう一度じゃんけんから！'
    return false
  end
end

# ===== メイン処理 =====
loop do
  result = janken
  next if result == :draw   # あいこなら再戦
  finished = acchimuite_hoi(result)
  break if finished         # 勝敗がついたら終了
end
