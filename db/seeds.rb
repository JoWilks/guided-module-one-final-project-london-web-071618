#Insert data into Letters Table
i = Letter.create(letter: "I", description: "Introverted individuals prefer solitary activities and get exhausted by social interaction. They tend to be quite sensitive to external simulation (e.g. sound, sight or smell) in general.")

#Insert data into PersonalityTypes Table
intj = FourLetter.create(myers_briggs_type: "INTJ", subtitle: "Analyst - Architect", description: "Have original minds and great drive for implementing their ideas and achieving their goals. Quickly see patterns in external events and develop long-range explanatory perspectives. When committed, organize a job and carry it through. Skeptical and independent, have high standards of competence and performance - for themselves and others.")

#Insert dummy people into Person table
bob = Person.create(name: "Bob", mind: "I", energy: "N", nature: "T", tactics: "J")
