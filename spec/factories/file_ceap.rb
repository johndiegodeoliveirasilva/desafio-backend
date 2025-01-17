include ActionDispatch::TestProcess::FixtureFile
include ActiveStorage::Blob::Analyzable
FactoryBot.define do

  factory :file_ceap do
    title  { Faker::Name.name }
    status { "processed" }
    
    trait :with_attachment do
      avatar do
        arquive = Rails.root.join("spec", "support","assets", "files", "Ano-2021.csv")
        ActiveStorage::Blob.create_and_upload!(
          io: File.open(arquive, 'rb'),
          filename: 'Ano-2021.csv',
          content_type: 'text/csv'
        ).signed_id
      end
    end
  end
end
