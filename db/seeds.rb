# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Symptom.destroy_all

Symptom.create!(
  [
    {
      symptom_id: 10,
      name: 'Abdominal pain'
    },
    {
      symptom_id: 238,
      name: 'Anxiety'
    },
    {
      symptom_id: 104,
      name: 'Back pain'
    },
    {
      symptom_id: 75,
      name: 'Burning eyes'
    },
    {
      symptom_id: 46,
      name: 'Burning in the throat'
    },
    {
      symptom_id: 170,
      name: 'Cheek swelling'
    },
    {
      symptom_id: 17,
      name: 'Chest pain'
    },
    {
      symptom_id: 31,
      name: 'Chest tightness'
    },
    {
      symptom_id: 175,
      name: 'Chills'
    },
    {
      symptom_id: 139,
      name: 'Cold sweats'
    },
    {
      symptom_id: 15,
      name: 'Cough'
    },
    {
      symptom_id: 207,
      name: 'Dizziness'
    },
    {
      symptom_id: 244,
      name: 'Drooping eyelid'
    },
    {
      symptom_id: 273,
      name: 'Dry eyes'
    },
    {
      symptom_id: 87,
      name: 'Earache'
    },
    {
      symptom_id: 92,
      name: 'Early satiety'
    },
    {
      symptom_id: 287,
      name: 'Eye pain'
    },
    {
      symptom_id: 33,
      name: 'Eye redness'
    },
    {
      symptom_id: 153,
      name: 'Fast, deepened breathing'
    },
    {
      symptom_id: 76,
      name: 'Feeling of foreign body in the eye'
    },
    {
      symptom_id: 11,
      name: 'Fever'
    },
    {
      symptom_id: 57,
      name: 'Going black before the eyes'
    },
    {
      symptom_id: 9,
      name: 'Headache'
    },
    {
      symptom_id: 45,
      name: 'Heartburn'
    },
    {
      symptom_id: 122,
      name: 'Hiccups'
    },
    {
      symptom_id: 149,
      name: 'Hot flushes'
    },
    {
      symptom_id: 40,
      name: 'Increased thirst'
    },
    {
      symptom_id: 73,
      name: 'Itching eyes'
    },
    {
      symptom_id: 96,
      name: 'Itching in the nose'
    },
    {
      symptom_id: 35,
      name: 'Lip swelling'
    },
    {
      symptom_id: 235,
      name: 'Memory gap'
    },
    {
      symptom_id: 112,
      name: 'Menstruation disorder'
    },
    {
      symptom_id: 123,
      name: 'Missed period'
    },
    {
      symptom_id: 44,
      name: 'Nausea'
    },
    {
      symptom_id: 136,
      name: 'Neck pain'
    },
    {
      symptom_id: 114,
      name: 'Nervousness'
    },
    {
      symptom_id: 133,
      name: 'Night cough'
    },
    {
      symptom_id: 12,
      name: 'Pain in the limbs'
    },
    {
      symptom_id: 203,
      name: 'Pain on swallowing'
    },
    {
      symptom_id: 37,
      name: 'Palpitations'
    },
    {
      symptom_id: 140,
      name: 'Paralysis'
    },
    {
      symptom_id: 54,
      name: 'Reduced appetite'
    },
    {
      symptom_id: 14,
      name: 'Runny nose'
    },
    {
      symptom_id: 29,
      name: 'Shortness of breath'
    },
    {
      symptom_id: 124,
      name: 'Skin rash'
    },
    {
      symptom_id: 52,
      name: 'Sleeplessness'
    },
    {
      symptom_id: 95,
      name: 'Sneezing'
    },
    {
      symptom_id: 13,
      name: 'Sore throat'
    },
    {
      symptom_id: 64,
      name: 'Sputum'
    },
    {
      symptom_id: 179,
      name: 'Stomach burning'
    },
    {
      symptom_id: 28,
      name: 'Stuffy nose'
    },
    {
      symptom_id: 138,
      name: 'Sweating'
    },
    {
      symptom_id: 248,
      name: 'Swollen glands in the armpits'
    },
    {
      symptom_id: 169,
      name: 'Swollen glands on the neck'
    },
    {
      symptom_id: 211,
      name: 'Tears'
    },
    {
      symptom_id: 16,
      name: 'Tiredness'
    },
    {
      symptom_id: 115,
      name: 'Tremor at rest'
    },
    {
      symptom_id: 144,
      name: 'Unconsciousness, short'
    },
    {
      symptom_id: 101,
      name: 'Vomiting'
    },
    {
      symptom_id: 181,
      name: 'Vomiting blood'
    },
    {
      symptom_id: 56,
      name: 'weakness'
    },
    {
      symptom_id: 23,
      name: 'Weight gain'
    },
    {
      symptom_id: 30,
      name: 'Wheezing'
    }
  ]
)
