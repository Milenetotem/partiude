Fabricator(:recurring) do
 repeat_in { RepeatIn::TODAY }
 hour "13:00"
 repeat_weekly_interval 0
 begin_day Date.today
 sunday false
 monday false
 tuesday false
 wednesday false
 thursday false
 friday false
 saturday false
end

Fabricator(:weekly, :from => :recurring) do
 repeat_in { RepeatIn::WEEKLY }
 hour "13:00"
 begin_day Date.today
 monday true
end

Fabricator(:monthly, :from => :recurring) do
 repeat_in { RepeatIn::MONTHLY }
 hour "13:00"
 begin_day Date.today
 monday true
end

Fabricator(:daily, :from => :recurring) do
 repeat_in { RepeatIn::DAILY }
 hour "13:00"
 begin_day Date.today
end
