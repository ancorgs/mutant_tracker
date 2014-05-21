class CreateMutantsAndTeams < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :name
      t.string :superpowers

      t.timestamps
    end

    create_table :teams do |t|
      t.string :name

      t.timestamps
    end

    create_table :mutants_teams, id: false do |t|
      t.references :mutant
      t.references :team
    end
    add_foreign_key(:mutants_teams, :mutants)
    add_foreign_key(:mutants_teams, :teams)
  end
end
