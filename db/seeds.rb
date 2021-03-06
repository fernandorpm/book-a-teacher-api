# Create Subjects if they don't exist yet
subjects = []

subjects << Subject.create(name: 'React & Redux') if Subject.find_by(name: 'React & Redux').nil?
subjects << Subject.create(name: 'Ruby on Rails') if Subject.find_by(name: 'Ruby on Rails').nil?
subjects << Subject.create(name: 'PHP') if Subject.find_by(name: 'PHP').nil?
subjects << Subject.create(name: 'Java Springboot') if Subject.find_by(name: 'Java Springboot').nil?
subjects << Subject.create(name: 'Elixir') if Subject.find_by(name: 'Elixir').nil?
subjects << Subject.create(name: 'Python Django') if Subject.find_by(name: 'Python Django').nil?
subjects << Subject.create(name: 'Flutter') if Subject.find_by(name: 'Flutter').nil?
subjects << Subject.create(name: 'Unity 3D') if Subject.find_by(name: 'Unity 3D').nil?
subjects << Subject.create(name: 'Arduino') if Subject.find_by(name: 'Arduino').nil?

# Create Cities if they don't exist yet
cities = []

cities << City.create(name: 'Vancouver') if City.find_by(name:'Vancouver').nil?
cities << City.create(name: 'Toronto') if City.find_by(name:'Toronto').nil?
cities << City.create(name: 'Calgary') if City.find_by(name:'Calgary').nil?
cities << City.create(name: 'Surrey') if City.find_by(name:'Surrey').nil?
cities << City.create(name: 'Halifax') if City.find_by(name:'Halifax').nil?
cities << City.create(name: 'Montreal') if City.find_by(name:'Montreal').nil?
cities << City.create(name: 'Ottawa') if City.find_by(name:'Ottawa').nil?
cities << City.create(name: 'Edmonton') if City.find_by(name:'Edmonton').nil?
cities << City.create(name: 'Quebec') if City.find_by(name:'Quebec').nil?
cities << City.create(name: 'Winnipeg') if City.find_by(name:'Winnipeg').nil?
cities << City.create(name: 'Saskatoon') if City.find_by(name:'Saskatoon').nil?
cities << City.create(name: 'Charlottetown') if City.find_by(name:'Charlottetown').nil?
cities << City.create(name: 'London') if City.find_by(name:'London').nil?
cities << City.create(name: 'Moncton') if City.find_by(name:'Moncton').nil?

