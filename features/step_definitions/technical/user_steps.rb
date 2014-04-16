Given(/^there are at least (\d+) users with late take backs from at least (\d+) inventory pools where automatic suspension is activated$/) do |users_n, ips_n|
  cls = ContractLine.to_take_back.where("end_date < CURDATE()").uniq{|cl| cl.contract.inventory_pool and cl.contract.user}
  cls.count.should >= 2
  @contracts = cls.map(&:contract)
end

When(/^the cronjob executes the rake task for reminding and suspending all late users$/) do
  User.remind_and_suspend_all
end

Then(/^every such user is suspended until '(\d+)\.(\d+)\.(\d+)' in the corresponding inventory pool$/) do |day, month, year|
  @contracts.each do |c|
    ip = c.inventory_pool
    u = c.user
    ar = u.access_right_for(ip)
    ar.suspended_until.should == Date.new(year.to_i, month.to_i, day.to_i)
  end
end

Then(/^the suspended reason is the one configured for the corresponding inventory pool$/) do
  @contracts.each do |c|
    ip = c.inventory_pool
    u = c.user
    ar = u.access_right_for(ip)
    ar.suspended_reason == ip.automatic_suspension_reason
  end
end