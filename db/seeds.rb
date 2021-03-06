# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'



company_0 = Company.create!(name: "Test Company 0")
company_1 = Company.create!(name: "Test Company 1")
company_2 = Company.create!(name: "Test Company 2")

t0c0 = Team.create!(name: "Dev", company: company_0)
t1c0 = Team.create!(name: "Support", company: company_0)
t0c1 = Team.create!(name: "Marketing", company: company_1)
t1c1 = Team.create!(name: "Sales", company: company_1)
t0c2 = Team.create!(name: "Product", company: company_2)
t1c2 = Team.create!(name: "QA", company: company_2)

work_life = Driver.create!(name: "Work Life Balance")
workplace = Driver.create!(name: "Workplace")
roles = Driver.create!(name: "Roles and Responsibilities")
management = Driver.create!(name: "Management")
coworkers = Driver.create!(name: "Team's Work")
general = Driver.create!(name: 'General')

work_load = SubDriver.create!(name: "work load", driver: work_life)
scheduling = SubDriver.create!(name: "scheduling", driver: work_life)

happy_team = SubDriver.create!(name: "happy with team", driver: coworkers)
communication = SubDriver.create!(name: "communication", driver: coworkers)

noise = SubDriver.create!(name: "noise", driver: workplace)
office_layout = SubDriver.create!(name: "office layout", driver: workplace)

unclear_objectives = SubDriver.create!(name: "unclear objectives", driver: management)
happy_manager = SubDriver.create!(name: "happy with manager", driver: management)

wants_responsibilities = SubDriver.create!(name: "wants more responsibilities", driver: roles)
not_defined = SubDriver.create!(name: "role not well defined", driver: roles)

comment_00 = Comment.create!(comment_text: "we are understaffed and are behind. we need more help. management already knows this, now they need to act.", driver: general, team: t0c0)
comment_01 = Comment.create!(comment_text:"How come the 3rd floor doesn't get speakers in the bathroom? Also - it shouldn't be warmer outside than it is inside it's WINTER." , driver: general, team: t0c0)
comment_02 = Comment.create!(comment_text:"Feel creatively unfulfilled. It's a stock footage clipart factory. Company structure and organization is poor at best. Getting tired of working for a company that is just barely grasping how to put together a basic cohesive ad campaign. Looking for inspiration. Having trouble finding it." , driver: general, team: t0c0)


comment_0 = Comment.create!(comment_text: "I spend loads of time at work and get home shattered every day." ,driver: work_life ,team: t0c0 )
comment_1 = Comment.create!(comment_text: "Last week before the break does not look as crazy and we are wrapping up few lose ends. I am optimistic and looking forward towards the break!" ,driver: work_life,team: t1c0 )
comment_2 = Comment.create!(comment_text: "Open-space is very noisy, makes it hard to focus often" ,driver: workplace ,team: t1c0 )
comment_3 = Comment.create!(comment_text: "the office isn't clean especially the kitchen area. Desks and the areas surrounding desks are really dusty." ,driver: workplace ,team: t0c1 )
comment_4 = Comment.create!(comment_text: "I feel underutilized for my experience and skill levels." ,driver: roles ,team: t0c1 )
comment_5 = Comment.create!(comment_text: "- Too much work for one person causes overtime
- Work cannot be scheduled, lots of tasks which I'm getting from the promoter is at the last minute, with the expectation, that I will do it now." ,driver: roles ,team:t0c2 )
comment_6 = Comment.create!(comment_text: "Don't really know what else I need to do to get promoted" ,driver: management ,team:t0c2 )
comment_7 = Comment.create!(comment_text: "I would like feedback on my work so far so I can immediately make any adjustments if needed as well as set long term goals so I can meet or exceed expectations" ,driver: management ,team:t1c2 )
comment_8 = Comment.create!(comment_text: "Team is limited in their capability. Not too curious about learning things. They just limit themselves to their tasks" ,driver: coworkers ,team:t1c2 )
comment_9 = Comment.create!(comment_text: "Not at All, No one is doing the job like thy suppose to! How is it possible Ohrid  CS team to have 3to 5 times less answered calls more than any one from Diber! Dont they get paid the same ...?How is it possible for me to have 90 Answered calls and them 15-20 tops! Taking brakes longer that they suppose to! For me ... I can care less , i have to deal with it 30 days and im out , but the rest of the team gets demotivated and its not fear!  Work for what you get paid!" ,driver: coworkers ,team:t1c2 )


csv_list = ['Balance_seed.csv', 'colleagues_seed.csv', 'environment_seed.csv', 'role_seed.csv']
driver_count = 0
csv_list.each do |csv|
  driver_list = [work_life, coworkers, workplace, roles]
  puts csv
  csv_text = File.read(Rails.root.join('lib', 'seeds', csv))
  # puts csv_text

  csv = CSV.parse(csv_text, :headers => false, :encoding => 'ISO-8859-1')
  @count = 0
  csv.each do |row|

    subs = row[1].split(',')

    @comment = Comment.create!(comment_text: row[0] ,driver: driver_list[driver_count], team: t0c0 )
    puts row[0]

    @words_array = row[0].split(/\W+/)
      @words_array.each do |word|
        if Word.find_by(name: word.downcase.strip)
        else
          Word.create!(name: word.downcase.strip)
        end
      end

    subs.each do |i|
      @new_sub = SubDriver.find_by(name: i.downcase.strip)
      if @new_sub == nil
        @sub_driver = SubDriver.create!(name: i.downcase.strip, driver: driver_list[driver_count])
        @new_join = CommentSubJoin.create!(comment: @comment, sub_driver: @sub_driver)
        @count += 1
      else
        CommentSubJoin.create!(comment: @comment, sub_driver: @new_sub)
        @count+= 1
      end

      @words_array.each do |word|
          @selected_word = Word.find_by(name: word.downcase.strip)
          if @new_sub
            SubWordJoin.create!(sub_driver: @new_sub, word: @selected_word )
          else
            SubWordJoin.create!(sub_driver: @sub_driver, word: @selected_word )
          end
        end

    end

    @comment.update_attribute(:tagged, true)

  end
  driver_count += 1
end
puts @count


#management CSV Debugging code

csv_text = File.read(Rails.root.join('lib', 'seeds', 'management_seed.csv'))
csv = CSV.parse(csv_text, :headers => false, :encoding => 'ISO-8859-1')

csv.each do |row|
    subs = row[1].split(',')

    @comment = Comment.create!(comment_text: row[0] ,driver: management, team: t0c0 )
    puts row[0]

    @words_array = row[0].split(/\W+/)
      @words_array.each do |word|
        if Word.find_by(name: word.downcase.strip)
        else
          Word.create!(name: word.downcase.strip)
        end
      end

    subs.each do |i|
      @new_sub = SubDriver.find_by(name: i.downcase.strip)
      if @new_sub == nil
        @sub_driver = SubDriver.create!(name: i.downcase.strip, driver: management)
        @new_join = CommentSubJoin.create!(comment: @comment, sub_driver: @sub_driver)
        @count += 1
      else
        CommentSubJoin.create!(comment: @comment, sub_driver: @new_sub)
        @count+= 1
      end

      @words_array.each do |word|
          @selected_word = Word.find_by(name: word.downcase.strip)
          if @new_sub
            SubWordJoin.create!(sub_driver: @new_sub, word: @selected_word )
          else
            SubWordJoin.create!(sub_driver: @sub_driver, word: @selected_word )
          end
        end

    end

    @comment.update_attribute(:tagged, true)

  end