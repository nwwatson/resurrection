module Resurrection
  module Model
    extend ActiveSupport::Concern
    
    included do
      include ActiveSupport::Callbacks
      scope :available, lambda { where(deleted_at: nil) }
      scope :deleted, lambda { where("#{self.table_name}.deleted_at IS NOT NULL") }

      # Define Deleted Callback
      define_callbacks :deleted
      set_callback :deleted, :after, :after_delete

      # Define Restored Callback
      define_callbacks :resurrected
      set_callback :resurrected, :after, :after_resurrection
    end
    
    def delete
      # if the record is new or destroyed, do nothing
      return if new_record? or deleted?
  
      # Calls before_delete callbacks before deletion takes place
      run_callbacks :deleted do
        update_attribute_or_column :deleted_at, Time.now
      end
    end
    alias :delete! :delete
    
    def resurrect
      run_callbacks :restored do
        update_attribute_or_column :deleted_at, nil
      end
    end
    alias :resurrect! :resurrect

    def deleted?
      !self.deleted_at.nil?
    end
    
    def after_delete
     return
    end

    def before_delete
     return
    end

    def after_resurrection
     return
    end

    private

     # Rails 3.1 adds update_column. Rails > 3.2.6 deprecates update_attribute, gone in Rails 4.
     def update_attribute_or_column(*args)
       respond_to?(:update_attribute) ? update_attribute(*args) : update_column(*args)
     end

  end
end