class SubjectsController < ApplicationController
  def index
    parent_subs = Subject.where(ancestry: nil).where.not(category: "カテゴリーなし")
    @subjects = []
    find_category(parent_subs)
  end

  def search_category
    subject = Subject.find_by(category: params[:category])
    first_category_ids = subject.child_ids
    @questions = Question.where(subject_id: first_category_ids).order(created_at: "DESC").page(params[:page]).per(7)
    @keyword = params[:category]
  end

  private
  def find_category(lists)
    lists.each do |subject|
      hash = {}
      child_lists = []
      parent_cat = subject.category
      subject.children.each do |child|
        child_cat = child.category
        child_lists << child_cat
      end
      hash[parent_cat] = child_lists
      @subjects << hash
    end
  end
end
