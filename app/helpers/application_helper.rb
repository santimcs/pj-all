module ApplicationHelper

    def seconds_to_time(duration)
          minutes = (duration / 60).to_i
      if (minutes > 60)
        hours = (minutes / 60).to_i
        minutes = minutes - (hours*60)
      end
          seconds = duration - (minutes * 60)
          minutes.to_s+":"+seconds.to_s.rjust(2, '0')
      end
  
    def seconds_to_hour(duration)
          minutes = (duration / 60).to_i
      hours = 0
      if (minutes > 60)
        hours = (minutes / 60).to_i
        minutes = minutes - (hours*60)
      end
          seconds = duration - ((hours * 3600) + (minutes * 60))
          if hours > 0
              hours.to_s+":"+minutes.to_s.rjust(2, '0')+":"+seconds.to_s.rjust(2, '0')
          else
              minutes.to_s.rjust(2, '0')+":"+seconds.to_s.rjust(2, '0')			
          end
      end
  
      def seconds_to_human(duration)
          minutes = (duration / 60).to_i
          hours = 0
          
          if (minutes > 60)
              hours = (minutes / 60).to_i
              minutes = minutes - (hours * 60)
          end

          if (minutes == 60)
            hours = (minutes / 60).to_i
            minutes = 0
            end  

          seconds = duration - ((hours * 3600) + (minutes * 60))
          if hours > 0
              hours.to_s+" hrs "+minutes.to_s.rjust(2, '0')+" mins"
              hhh = (hours == 1 ? ' hr ' : ' hrs ')
              mmm = (minutes == 1 ? ' min' : ' mins')

              if (minutes > 0)
                hours.to_s+hhh+minutes.to_s.rjust(2, '0')+mmm
              else
                hours.to_s+hhh
              end

          else
              mmm = (minutes == 1 ? ' min' : ' mins')
            #   minutes.to_s.rjust(2, '0')+mmm
              minutes.to_s+mmm
          end
      end
  
  end
