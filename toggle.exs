defmodule ListToggle do

    def toggle(list) do
      length = length(list)
      if lenth_is_odd(length) do
        last_item = List.last(list)
        index = length-1
        new_list= List.delete_at(list, index)
        new_l = chunck_new_list(new_list)
        toggle_list =  List.flatten(new_l) ++ [last_item]
        IO.inspect toggle_list
        toggle_list
      else
        new_l = chunck_new_list(list)
        toggle_list =  List.flatten(new_l)
        IO.inspect toggle_list
        toggle_list
      end
    end


    defp lenth_is_odd(length) do
      if rem(length, 2) == 0 do
        :false
      else
        :true
      end
    end

    defp chunck_new_list(list) do
        kk = Enum.chunk_every(list, 2)
        new_l = for l <- kk  do
          f_index = Enum.at(l, 0)
          s_index = Enum.at(l, 1)
          l = List.replace_at(l, 0, s_index)
          l = List.replace_at(l, 1, f_index)
          l
      end

      new_l
    end

end

ListToggle.toggle([1,4,3,11])
