# frozen_string_literal: true

class NotePolicy < ApplicationPolicy
  def create?
    own_record?
  end

  def update?
    own_record?
  end

  def destroy?
    own_record?
  end

  def own_record?
    record.user == user
  end
end
