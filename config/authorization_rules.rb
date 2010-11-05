authorization do
  role :guest do
    has_permission_on :games, :to => :read
    has_permission_on :search, :to => [:index, :results, :quick_search]
  end
  
  role :user do
    includes :guest    
  end
  
  role :admin do
    includes :user
    has_permission_on [:users, :games, :contents, :categories], :to => [:read, :manage]
  end
end

privileges do
  privilege :manage do
    includes :new, :create, :adjust, :destroy
  end
  
  privilege :read do
    includes :index, :show
  end
  
  privilege :adjust do
    includes :edit, :update
  end

end
