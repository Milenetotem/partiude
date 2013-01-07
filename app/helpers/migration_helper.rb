module MigrationHelper

  def add_foreign_key(to_table, fk_column, from_table)
    constraint_name = "FK_#{to_table}_#{fk_column}"
    execute %{ALTER TABLE #{to_table}
              ADD CONSTRAINT #{constraint_name}
              FOREIGN KEY (#{fk_column})
              REFERENCES #{from_table}(id)} unless Rails.env.test?
  end

  def remove_foreign_key(from_table, fk_column)
    constraint_name = "FK_#{from_table}_#{fk_column}"
    execute %{ALTER TABLE #{from_table}
              DROP CONSTRAINT #{constraint_name}} unless Rails.env.test?
  end

end
