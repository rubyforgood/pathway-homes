namespace :dev do
  task :seed => [:environment, :'db:reset', :'db:seed'] do
    abort('This task resets the database. It should only be run in development') unless Rails.env.development?

    user = User.create(name: "administrator", role: "admin", email: "admin@example.com", password: "password", password_confirmation: "password")
    normalUser = User.create(name: "Jane Plain", role: "staff", email: "staff@example.com", password: "password", password_confirmation: "password" )

    ServiceRequest.create(
       community_name:            'Americana Centre',
       apt_number:                '301',
       status:                    'open',
       work_desc:                 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae aperiam quam, distinctio culpa tempora ab, iure laborum ea, iste doloremque itaque veniam, veritatis excepturi inventore quo debitis quaerat a ipsum.',
       special_instructions:      'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, illo vero, molestias consequatur maiores laudantium repellat quia odit cumque beatae reprehenderit, nulla quos alias itaque deleniti soluta. Rerum, voluptate, totam.',
       alarm:                     true,
       community_street_address:  '112 Monroe St.',
       community_zip_code:        '20850',
       created_at:                '2014-08-01',
       pet:                       false,
       authorized_to_enter:       true,
       creator_id:                user.id,
       request_type_id:           RequestType.first.id
    )

    ServiceRequest.create(
       community_name:            'Americana Centre',
       apt_number:                '302',
       status:                    'closed',
       work_desc:                 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae aperiam quam, distinctio culpa tempora ab, iure laborum ea, iste doloremque itaque veniam, veritatis excepturi inventore quo debitis quaerat a ipsum.',
       alarm:                     true,
       community_street_address:  '112 Monroe St.',
       community_zip_code:        '20850',
       closed_on:                 '2014-08-01',
       created_at:                '2014-08-01',
       updated_at:                '2014-08-01 16:25:37 -0400',
       pet:                       false,
       authorized_to_enter:       true,
       creator_id:                user.id,
       request_type_id:           RequestType.first.id
    )

    # Normal staff request
    ServiceRequest.create(
       community_name:            'Fairway House',
       apt_number:                '2',
       status:                    'open',
       work_desc:                 'We have many needs. Many indeed.',
       alarm:                     false,
       community_street_address:  '112 Washington Ave',
       community_zip_code:        '20850',
       created_at:                '2014-07-01',
       updated_at:                '2014-07-11 16:25:37 -0400',
       pet:                       true,
       authorized_to_enter:       true,
       creator_id:                normalUser.id,
       request_type_id:           RequestType.first.id
    )

    ServiceRequest.create(
       community_name:            'Monroe Suites',
       apt_number:                '233',
       status:                    'open',
       work_desc:                 'There was a big flood and a lot of the property was damaged',
       alarm:                     false,
       community_street_address:  '112 Monroe St.',
       community_zip_code:        '20850',
       created_at:                '2014-08-02',
       updated_at:                '2014-08-02 16:25:37 -0400',
       pet:                       true,
       authorized_to_enter:       true,
       creator_id:                normalUser.id,
       request_type_id:           RequestType.first.id
    )
  end
end
