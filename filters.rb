# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require './candidates'


def find(id)
  @candidates.each do |candidate|
    if candidate[:id]==id
      return candidate
    end
  end
end

def experienced?(candidate)
  if candidate[:years_of_experience]>=2
    return true
  end
end

def gitPoints?(candidate)
  if candidate[:github_points]>=100
    return true
  end
end

def rubyPython?(candidate)
  if candidate[:languages].include?('Python') || candidate[:languages].include?('Ruby')
    return true
  end
end

def applyRecent?(candidate)
  if (0.days.ago.to_date - candidate[:date_applied])<=15
    return true
  end
end

def over17?(candidate)
  if candidate[:age]>17
    return true
  end
end



def qualified_candidates(candidates)
  qualified=[]

  candidates.each do |candidate|
    if (experienced?(candidate) && gitPoints?(candidate) && rubyPython?(candidate) && applyRecent?(candidate) && over17?(candidate))
      qualified.push(candidate)
    end
  end
  return qualified
end


def ordered_by_qualifications(candidates)
  
  candidates.sort_by {|candidate| candidate[:years_of_experience]}.reverse

end


# More methods will go below
