##
# Git Pusshu Ten - Configuration
#
# Here you specify all your environments. Most people will be
# satisfied with just 2: "staging" and "production". These are included
# in this configuration template. If you need more, feel free to add more.
#
# For more information, visit:
# http://gitpusshuten.com/documentation/getting-started/configuration/


##
# Example of configuring both a staging and production environment
pusshuten 'My Application', :staging, :production do

  configure do |c|
    c.user       = 'ubuntu'
    c.ip         = '109.107.35.63'
    # c.password   = 'my-password'
    # c.passphrase = 'my-ssh-passphrase'
    # c.port       = '22'

    c.path       = '/var/applications/'
  end

  modules do |m|
      m.add :bundler
      m.add :active_record
      m.add :passenger
      m.add :nginx
      m.add :rvm
      m.add :mysql
      # m.add :bundler
    # m.add :active_record
    # m.add :passenger
    # m.add :nginx
    # m.add :apache
    # m.add :nanoc
    # m.add :rvm
    # m.add :mysql
    # m.add :redis
  end

end
