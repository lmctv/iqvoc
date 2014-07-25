module Iqvoc
  class Ability
    include CanCan::Ability

    @@if_published = lambda { |o| o.published? }

    def initialize(user = nil)
      can :read, Iqvoc::Concept.root_class.instance
      can :read, ::Collection::Base
      can :read, [::Concept::Base, ::Collection::Base, ::Label::Base], &@@if_published

      # static pages
      can :read, :help

      if user # Every logged in user ...
        can :use, :dashboard
        can :destroy, UserSession

        if user.owns_role?(:editor) || user.owns_role?(:publisher) || user.owns_role?(:administrator) # Editors and above ...
          can :read, [::Concept::Base, ::Collection::Base, ::Label::Base]
          can :create, [::Concept::Base, ::Collection::Base, ::Label::Base]
          can [:update, :destroy, :unlock], [::Concept::Base, ::Collection::Base, ::Label::Base], locked_by: user.id, published_at: nil
          can :lock, [::Concept::Base, ::Collection::Base, ::Label::Base], locked_by: nil, published_at: nil
          can [:check_consistency, :send_to_review], [::Concept::Base, ::Collection::Base, ::Label::Base], published_at: nil
          can :branch, [::Concept::Base, ::Collection::Base, ::Label::Base], &@@if_published
        end

        if user.owns_role?(:match_editor)
          can :read, ::Concept::Base
          can :create, ::Concept::Base
          can [:update, :lock], ::Concept::Base, locked_by: user.id, published_at: nil
          can :lock, ::Concept::Base, locked_by: nil, published_at: nil
          can :branch, ::Concept::Base, &@@if_published
        end

        if user.owns_role?(:publisher) || user.owns_role?(:administrator) # Publishers and above ...
          can :merge, [::Concept::Base, ::Collection::Base, ::Label::Base], published_at: nil
        end

        if user.owns_role?(:administrator)
          can [:update, :destroy, :unlock], [::Concept::Base, ::Label::Base], published_at: nil # Mustn't be locked by myself

          can :manage, User
          can :manage, Iqvoc.config

          can :full_export, ::Concept::Base
          can :import, ::Concept::Base
          can :export, ::Concept::Base

          can :update, Iqvoc::Concept.root_class.instance

          can :use, :administration

          can :reset, :thesaurus
        end
      else # no user
        can :create, UserSession
      end
    end
  end
end
