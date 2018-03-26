require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash.each do | holiday, data_hash|
        data_hash.each do | event, supplies |
          if event == :fourth_of_july
            return supplies[1]
          end
        end
    end
 end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash.each do |season, data_hash|
       if season == :winter
          data_hash.each do | event, supplies|
          supplies.push('Balloons')
          end
      end  
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
    holiday_hash.each do | season, data_hash |
      data_hash.each do | event, supplies|
        if event == :memorial_day
          supplies.push(supply)
        end
      end
    end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
  
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []
  # return an array of all of the supplies that are used in the winter season
   holiday_hash.each do | season, data_hash |
     if season == :winter
        data_hash.each do | event, supplies |
          winter_supplies << supplies
        end
     end  
    end 
    winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
    all_supplies = []
    holiday_hash.each do | season, data_hash |
      puts "#{season.capitalize}:"
      data_hash.each do | event, supplies|
       new_event =  event.to_s
        if new_event.index('_')
            split_event = new_event.split('_')
                  i=0
                  while i< split_event.length
                    split_event[i].capitalize!
                    i+=1
                  end
             event = split_event.join(' ')
                puts "  #{event}: #{supplies.join(', ') }"
          else
            puts "  #{event.capitalize}: #{supplies.join(', ') }"
      end
      end  
    end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
    holidays = []
      holiday_hash.each do |season, data_hash|
        data_hash.each do |event, supplies|
         supplies.each do | things|
             if things == "BBQ"
               holidays << event
             end 
         end
        end
      end
      
  holidays
end







