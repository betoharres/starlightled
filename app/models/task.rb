class Task < ActiveRecord::Base
  include AASM
  belongs_to :node
  belongs_to :company
  belongs_to :attachable, polymorphic: true

  before_save :execute_at_change
  after_save :flush_cache
  after_update :flush_cache
  after_commit :flush_cache

  validates_presence_of :execute_at, :code, :node, :company, :attachable_id, :attachable_type

  audited allow_mass_assignment: true, associated_with: :company, except: [:aasm_state, :descrption]

  aasm do
    state :waiting, :initial => true
    state :running
    state :failed
    state :done
  end

  def self.cache_tasks serial_num
    Rails.cache.fetch(['tasks', serial_num]) do
      if product = Product.find_by(serial_number: serial_num)
        Task.where("execute_at <= ?", DateTime.now.utc)
            .where(node: product.node,
                    aasm_state: :waiting,
                    company_id: product.company_id)
                    .order(:execute_at)
                    .first
      end
    end
  end

  def execute_at_change
    if self.execute_at_changed?
      self.execute_at = execute_at + 3.hours
    end
  end

  def flush_cache
    Rails.cache.delete(['tasks', node.product.serial_number])
  end

end
