conditions = ["Bardzo Dobry", "Dobry", "Średni", "Zniszczona"]
conditions.each { |d| Condition.where(:name => d).first_or_create }

type_ofs = ["biografia", "fantastyka", "historyczna", "horror", "klasyka", "dla dzieci", "dla młodzieży", "literatura faktu",
			"literatura współczesna", "poezja", "przygodowa", "publicystyka", "romans", "thriller", "sensacja", "kryminał",
			"dramat", "komedia", "tragedia", "popularnonaukowa"].sort_by(&:downcase).uniq
type_ofs.each { |d| TypeOf.where(:name => d).first_or_create }

