require 'colorize'
require 'pry'
class Slots
  attr_reader :player, :casino

  def initialize()
    @player = @player
    @casino = @casino
    @slot_A = [1,2,3,4,5,6,7,8]
    @slot_B = [1,2,3,4,5]
    @slot_C = [1,2,3,4,5,6,7,8,9,10]
    @a = 0
    @b = 0
    @c = 0
    @user_bet
    @i = 0

    @earnings = 0

    @random_number = Random.new(3)
  end

  def display_menu
    puts "======================"
    puts "MAIN MENU"
    puts "1: Make a bet"
    puts "2: Check Earnings"
    puts "3: Exit"
    puts "4: Deposit Money"
    puts
    @c = gets.to_i
  end

  def menu_options(choice)
    case choice
    when 1
      puts "how much would you like to bet?"
      @user_bet = gets.strip.to_i
      if @earnings > 0 && @user_bet <= @earnings
        @earnings -= @user_bet
        shuffle
      else
        puts "YOURE POOR STOP BETTING".colorize(:red)
      end
    when 2
      if @earnings.to_i < 0
        puts "AMOUNT IN ACCOUNT"
        puts @earnings.to_s.colorize(:red)
      else
        puts "AMOUNT IN ACCOUNT"
        puts @earnings.to_s.colorize(:green)
      end
    when 3
      exit_program
    when 4
      puts "How much are you depositing?"
      deposit = gets.strip.to_i
      @earnings = @earnings + deposit
      binding.pry
    else
      puts "Invalid Selection"
    end
  end

  def shuffle

    tester = 1000
    testing = 1
    long_testing = 999

    sleep(1.0/3.0)
    while @i <= 15
      @i += 1
      if @i <= 10
        @a = @slot_A.sample.to_i
        @b = @slot_B.sample.to_i
        @c = @slot_C.sample.to_i

        tester = 0
        testing = 0
        long_testing = 0
        rand_num = @random_number.rand(3).to_s
        case rand_num
        when "0"
          puts "#{@a} #{@b} #{@c}".colorize(:green)
        when "1"
          puts "#{@a} #{@b} #{@c}".colorize(:red)
        else
          puts "#{@a} #{@b} #{@c}".colorize(:blue)
        end
        shuffle
      end
      if @i == 11
        prize(@user_bet)
      else
        @i = 0
        break
      end
    end

  end


  def prize(user_bet)
    if @a == @b || @a == @c || @b == @c
      @earnings += user_bet + (user_bet * 1.5)
      puts @earnings
      puts "You Win!"
    elsif @a == @b && @a == @c
      earnings += user_bet + (user_bet * 3)
      puts @earnings
      puts "JackPot!"
    else
      puts "You Lose, Better Luck Next Time"
    end

    print  "Your initial bet was: $".colorize(:green)
    print  @user_bet.to_s.colorize(:cyan)
    print  " You currently have $".colorize(:green)
    print  @earnings.to_s.colorize(:cyan)
    print  " in your account!".colorize(:green)
  end

  def exit_program
    puts "Goodbye"
    exit
  end
  slots = Slots.new
  while true
    slots.menu_options(slots.display_menu)
  end
end
