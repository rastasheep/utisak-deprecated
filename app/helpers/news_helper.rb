module NewsHelper
  def calculate_idnex(index)
     index = index + 1
     unless  params[:page].nil? || params[:page] == "0" || params[:page] == "1"
       index = index + (params[:page].to_i - 1 ) * 20
     end
     return index
  end
end
