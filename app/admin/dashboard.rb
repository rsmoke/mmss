ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      panel "Partial display Demo" do
        div do
          render("/admin/testing_partial_display", model: "dashboard")
        end
      end
    end

    columns do
      column do
        panel "Recent Applications" do
          ul do
            Enrollment.limit(10).map do |enroll|
              li link_to(enroll.user.email, admin_applicant_detail_path(enroll.user.applicant_detail))
            end
          end
        end

        panel "Recent Payments" do
          ul do
            Payment.limit(10).map do |payment|
              li link_to("#{payment.user.email} - #{ humanized_money_with_symbol(payment.total_amount.to_f / 100)}", admin_payment_path(payment.id))
            end
          end
        end
      end

      column do
        panel "Session Stats" do
          div do
            render("/admin/session_enrolled", model: "dashboard")
          end

          div do
            render("/admin/session_applied", model: "dashboard")
          end
        end

        panel "Financial Aid Requests" do
          div do
            render("/admin/finaid_requests", model: "dashboard")
          end
        end
      end
    end
  end # content
end
