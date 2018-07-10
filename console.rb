require_relative('model/bounty')

bounty1 = Bounty.new({ 'name' => 'David Bowie', 'species' => 'Spaceman', 'bounty' => '100000', 'danger_level' => 'low' })

bounty2 = Bounty.new({ 'name' => 'Jamiroquai', 'species' => 'Spacebusker', 'bounty' => '50000', 'danger_level' => 'high' })

bounty3 = Bounty.new({ 'name' => 'Ursa Major', 'species' => 'Bear', 'bounty' => '10000', 'danger_level' => 'ermagerdyerderd' })

bounty1.save
bounty2.save
bounty3.save

# bounty1.danger_level = "medium"
# bounty1.update()
# bounty1.delete

p Bounty.find_by_id('100')
